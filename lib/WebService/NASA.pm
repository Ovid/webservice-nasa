package WebService::NASA;

# ABSTRACT: Perl interface to NASA's public APIs

# see also https://api.nasa.gov/
# Don't forget timeouts
use v5.20.0;
use WebService::NASA::Moose types => [
    qw(
      Bool
      HashRef
      InstanceOf
      NonEmptyStr
      Optional
      PositiveInt
      PositiveOrZeroInt
      Undef
    )
];
use WebService::NASA::Schema qw(get_nasa_schema);

use JSONSchema::Validator;
use PerlX::Maybe;
use Sys::SigAction qw(timeout_call);
use Mojo::UserAgent;
use Mojo::URL;
use Type::Params -sigs;

our $VERSION = '0.4';

param [qw/debug raw testing strict/] => (
    isa     => Bool,
    default => 0,
);

param [qw/validate_request validate_response/] => (
    isa     => Bool,
    default => 1,
);

param timeout => (
    isa     => PositiveInt,
    default => 30,
);

param _api_key => (
    isa      => NonEmptyStr,
    lazy     => 1,
    init_arg => 'api_key',
    default  => method() { $ENV{NASA_API_KEY} // 'DEMO_KEY' },
);

field last_request_time => (
    isa     => PositiveOrZeroInt,
    writer  => '_set_last_request_time',
    default => 0,
);

field requests_remaining => (
    isa     => PositiveOrZeroInt | Undef,
    writer  => '_set_requests_remaining',
    default => undef,
);

field response => (
    isa    => InstanceOf ['Mojo::Message::Response'] | Undef,
    writer => '_set_response',
);

field _ua => (
    isa     => InstanceOf ['Mojo::UserAgent'],
    default => method() { Mojo::UserAgent->new },
);

field _nasa_schema => (
    isa     => HashRef,
    default => method() { get_nasa_schema() },
);

field _validator => (
    isa     => InstanceOf ['JSONSchema::Validator::OAS30'],
    default => method() { JSONSchema::Validator->new( schema => $self->_nasa_schema ) },
);

field _base_url => (
    isa     => NonEmptyStr,
    default => method() { $self->_nasa_schema->{servers}[0]{url} },
);

method is_demo() {
    return $self->_api_key eq 'DEMO_KEY';
}

signature_for get_planetary_apod => (
    method => 1,
    named  => [
        date       => Optional [NonEmptyStr],
        end_date   => Optional [NonEmptyStr],
        start_date => Optional [NonEmptyStr],
    ],
);

method get_planetary_apod($arg_for) {
    return $self->_get_response(
        route  => '/planetary/apod',
        params => {
            maybe date       => $arg_for->{date},
            maybe end_date   => $arg_for->{end_date},
            maybe start_date => $arg_for->{start_date},
        }
    );
}

signature_for get_planetary_earth_assets => (
    method => 1,
    named  => [
        date => NonEmptyStr,
        dim  => Optional [NonEmptyStr],
        lat  => NonEmptyStr,
        lon  => NonEmptyStr,
    ],
);

method get_planetary_earth_assets($arg_for) {
    return $self->_get_response(
        route  => '/planetary/earth/assets',
        params => {
            date      => $arg_for->{date},
            maybe dim => $arg_for->{dim},
            lat       => $arg_for->{lat},
            lon       => $arg_for->{lon},
        }
    );
}

signature_for get_planetary_earth_imagery => (
    method => 1,
    named  => [
        cloud_score => Optional [NonEmptyStr],
        date        => NonEmptyStr,
        dim         => Optional [NonEmptyStr],
        lat         => NonEmptyStr,
        lon         => NonEmptyStr,
    ],
);

method get_planetary_earth_imagery($arg_for) {
    return $self->_get_response(
        route  => '/planetary/earth/imagery',
        params => {
            maybe cloud_score => $arg_for->{cloud_score},
            date              => $arg_for->{date},
            maybe dim         => $arg_for->{dim},
            lat               => $arg_for->{lat},
            lon               => $arg_for->{lon},
        }
    );
}

signature_for _get_response => (
    method => 1,
    named  => [
        route  => NonEmptyStr,
        params => HashRef [NonEmptyStr],
    ],
    named_to_list => 1,
);

method _get_response( $route, $params ) {
    $params->{api_key} = $self->_api_key;
    my $url = $self->_url( $route, $params );

    my $requests_remaining = $self->requests_remaining;

    # if it's not defined, we haven't made an API call yet
    if ( defined $requests_remaining && !$requests_remaining ) {
        carp("You have no API credits left for $route. See https://api.nasa.gov/ for more information.");
        return;
    }

    my $response;
    if ( timeout_call( $self->timeout, sub { $response = $self->_GET($url) } ) ) {
        $url = $self->_sanitize_url( $params, $route );
        carp("Request timed out for $url");
        return;
    }
    $self->_set_response($response);

    $url = $self->_sanitize_url( $params, $route );

    my $remaining = $response->headers->header('X-RateLimit-Remaining');
    if ( defined $remaining ) {
        $self->_set_requests_remaining($remaining);
    }
    $self->_set_last_request_time(time);

    $self->_debug( $response->headers->to_string . "\n" );

    my $response_body = $response->body;
    if ( $self->debug ) {
        $self->_debug($response_body);
    }

    my $raw_response = $self->should_decode ? $response->json : $response_body;

    if ( $self->validate_response ) {
        my ( $result, $errors, undef ) = $self->_validator->validate_response(
            method       => 'GET',
            openapi_path => $route,
            status       => $response->code,
            parameters   => {
                body => [ 1, $response->headers->content_type, $response_body ],
            },
        );
        if ( !$result ) {
            my @errors = '';
            foreach my $error (@$errors) {
                push @errors,
                  "Error response for route: $url. " . $error->to_string . ': ' . join "\n\t" => @{ $error->context };
            }
            $errors = join "\n" => @errors;
            if ( $self->strict ) {
                croak $errors;
            }
            else {
                carp $errors;
            }
        }
    }
    return $raw_response;
}

method _sanitize_url( $params, $route ) {

    # immediately replace the api key with stars in the URL in case this
    # shows up in logs
    $params->{api_key} = 'REDACTED';
    return $self->_url( $route, $params );
}

method should_decode() {
    my $response = $self->response or return 0;
    return $response->is_success && $response->body && $response->headers->header('content-type') eq 'application/json';
}

# an easy target to override for testing
method _GET($url) {
    $self->_debug("GET $url\n");
    return $self->_ua->get($url)->res;
}

method _debug($msg) {
    return if !$self->debug;
    say STDERR $msg;
}

method _url( $url, $params ) {
    return Mojo::URL->new( $self->_base_url . $url )->query($params);
}

__END__

=head1 SYNOPSIS

    use WebService::NASA;

    my $api = WebService::NASA->new(
        api_key => 'your_api_key',
    );

=head1 METHODS



=head2 C<get_planetary_apod>

    my $result = $nasa->get_planetary_apod(
            date => $date,
            end_date => $end_date,
            start_date => $start_date,
        ],
    );

Method for C</planetary/apod>.

One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in the APOD API Github repository.


Arguments:

=over 4

=item * C<date> 

Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

Optional.

=item * C<end_date> 

End date of APOD images to retrieve

Optional.

=item * C<start_date> 

Start date of APOD images to retrieve

Optional.

=back



=head2 C<get_planetary_earth_assets>

    my $result = $nasa->get_planetary_earth_assets(
            date => $date,
            dim => $dim,
            lat => $lat,
            lon => $lon,
        ],
    );

Method for C</planetary/earth/assets>.

This endpoint retrieves the date-times and asset names for closest available
imagery for a supplied location and date. The satellite passes over each point
on earth roughly once every sixteen days. This is an amazing visualization of
the acquisition pattern for Landsat 8 imagery. The objective of this endpoint
is primarily to support the use of the imagery endpoint.


Arguments:

=over 4

=item * C<date> 

Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

Required.

=item * C<dim> 

Width and height of image in degrees

Optional.

=item * C<lat> 

Latitude

Required.

=item * C<lon> 

Longitude

Required.

=back



=head2 C<get_planetary_earth_imagery>

    my $result = $nasa->get_planetary_earth_imagery(
            cloud_score => $cloud_score,
            date => $date,
            dim => $dim,
            lat => $lat,
            lon => $lon,
        ],
    );

Method for C</planetary/earth/imagery>.

This endpoint retrieves the Landsat 8 image for the supplied location and
date. The response will include the date and URL to the image that is
closest to the supplied date. The requested resource may not be available
for the exact date in the request. You can retrieve a JSON that contains
the inputs you provided and a URL to the resulting image through the
assets endpoint. The assets endpoint no longer returns a list of potential
images within your date range due to a change on the Google Earth Engine
API side.

Note that the returned object may not match the supplied date exactly.
Instead, the image closest to the supplied date is returned.

The cloud score was an optional calculation that returns the percentage of
the queried image that is covered by clouds, but it is not available in
current versions of the API. If False If HTTP Request


Arguments:

=over 4

=item * C<cloud_score> 

NOT CURRENTLY AVAILABLE!!!! calculate the percentage of the image covered by clouds

Optional.

=item * C<date> 

Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

Required.

=item * C<dim> 

Width and height of image in degrees

Optional.

=item * C<lat> 

Latitude

Required.

=item * C<lon> 

Longitude

Required.

=back


