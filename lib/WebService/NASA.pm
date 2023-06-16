package WebService::NASA;

our $VERSION   = '0.1';
our $AUTHORITY = 'cpan:OVID';

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: b60b34c7cadff7c6b81aed0fb1438edb

# ABSTRACT: Perl interface to NASA's public APIs

# see also https://api.nasa.gov/
# Don't forget timeouts
use v5.20.0;
use WebService::NASA::Moose types => [
    qw(
      Bool
      Dict
      HashRef
      InstanceOf
      NonEmptyStr
      Optional
      PositiveInt
      PositiveOrZeroInt
      Undef
    )
];

use JSONSchema::Validator;
use PerlX::Maybe   qw(maybe);
use Sys::SigAction qw(timeout_call);
use Mojo::UserAgent;
use Mojo::URL;
use Cpanel::JSON::XS;
use Type::Params -sigs;
use File::Spec::Functions 'catfile';
use Path::Tiny;
use File::ShareDir 'dist_dir';

param [qw/debug testing strict/] => (
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

field is_timeout => (
    isa     => Bool,
    writer  => '_set_is_timeout',
    default => 0,
);

field _json => (
    isa     => InstanceOf ['Cpanel::JSON::XS'],
    default => method() { Cpanel::JSON::XS->new->utf8->unblessed_bool(1) },
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
    default => method() { $self->_validator->schema },
);

field _validator => (
    isa     => InstanceOf ['JSONSchema::Validator::OAS30'],
    default => method() {

        # If there is a nasa/openapi.yaml file, use that because we assume
        # we're in development mode. Otherwise, use the one in the dist
        my $schema
          = $self->_in_development_directory
          ? path( catfile( 'nasa', 'openapi.yaml' ) )->absolute
          : catfile( dist_dir('WebService-NASA'), 'openapi.yaml' );
        return JSONSchema::Validator->new( resource => "file://$schema" );
    },
);

field _in_development_directory => (
    isa     => Bool,
    default => method() {
        return ( -d 'nasa' && -e catfile( 'nasa', 'openapi.yaml' ) && -d '.git' );
    },
);

field _base_url => (
    isa     => NonEmptyStr,
    default => method() { $self->_nasa_schema->{servers}[0]{url} },
);

method is_demo() {
    return $self->_api_key eq 'DEMO_KEY';
}

signature_for _get_response => (
    method => 1,
    named  => [
        route => NonEmptyStr,
        query => HashRef [NonEmptyStr],
    ],
    named_to_list => 1,
);

method _get_response( $route, $query ) {
    $query->{api_key} = $self->_api_key;

    my $path = {};
    $route =~ s/{(\w+)}/
        $path->{$1} = delete $query->{$1}
    /gex;
    my $url = $self->_url( $route, $query );

    my $requests_remaining = $self->requests_remaining;

    # if it's not defined, we haven't made an API call yet
    if ( defined $requests_remaining && !$requests_remaining ) {
        carp("You have no API credits left for $route. See https://api.nasa.gov/ for more information.");
        return;
    }

    if ( $self->validate_request ) {
        my $have_path = keys $path->%*;
        my ( $result, $errors, $warnings ) = $self->_validator->validate_request(
            method       => 'GET',
            openapi_path => $route,
            parameters   => {
                path  => $path,
                query => $query,
            },
        );
        if ( !$result ) {
            my @errors = '';
            foreach my $error (@$errors) {
                push @errors,
                  "Bad request for route: $url. " . $error->to_string . ': ' . join "\n\t" => @{ $error->context };
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
    my $response;
    $self->_set_is_timeout(0);
    if ( timeout_call( $self->timeout, sub { $response = $self->_GET($url) } ) ) {
        $url = $self->_sanitize_url( $query, $route );
        $self->_set_is_timeout(1);
        carp("Request timed out for $url");
        return;
    }
    $self->_set_response($response);

    $url = $self->_sanitize_url( $query, $route );

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

    my $raw_response = $self->is_json ? $self->_json->decode($response_body) : $response_body;

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

method _sanitize_url( $query, $route ) {

    # immediately replace the api key with stars in the URL in case this
    # shows up in logs
    $query->{api_key} = 'REDACTED';
    return $self->_url( $route, $query );
}

method is_json() {
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

method _url( $url, $query ) {
    return Mojo::URL->new( $self->_base_url . $url )->query($query);
}

# Begin generated code here

signature_for get_neo_rest_v1_feed => (
    method => 1,
    named  => [
        end_date   => Optional [NonEmptyStr],
        start_date => Optional [NonEmptyStr],
        api_key    => Optional [NonEmptyStr],
    ],
);

method get_neo_rest_v1_feed($query) {
    return $self->_get_response(
        route => '/neo/rest/v1/feed',
        query => {
            maybe end_date   => $query->{end_date},
            maybe start_date => $query->{start_date},
            maybe api_key    => $query->{api_key},
        }
    );
}

signature_for get_neo_rest_v1_neo_asteroidid => (
    method => 1,
    named  => [
        asteroidId => NonEmptyStr,
        api_key    => Optional [NonEmptyStr],
    ],
);

method get_neo_rest_v1_neo_asteroidid($query) {
    return $self->_get_response(
        route => '/neo/rest/v1/neo/{asteroidId}/',
        query => {
            asteroidId    => $query->{asteroidId},
            maybe api_key => $query->{api_key},
        }
    );
}

signature_for get_neo_rest_v1_neo_browse => (
    method => 1,
    named  => [
        page    => Optional [NonEmptyStr],
        size    => Optional [NonEmptyStr],
        api_key => Optional [NonEmptyStr],
    ],
);

method get_neo_rest_v1_neo_browse($query) {
    return $self->_get_response(
        route => '/neo/rest/v1/neo/browse',
        query => {
            maybe page    => $query->{page},
            maybe size    => $query->{size},
            maybe api_key => $query->{api_key},
        }
    );
}

signature_for get_planetary_apod => (
    method => 1,
    named  => [
        count      => Optional [NonEmptyStr],
        date       => Optional [NonEmptyStr],
        end_date   => Optional [NonEmptyStr],
        start_date => Optional [NonEmptyStr],
        thumbs     => Optional [NonEmptyStr],
        api_key    => Optional [NonEmptyStr],
    ],
);

method get_planetary_apod($query) {
    return $self->_get_response(
        route => '/planetary/apod',
        query => {
            maybe count      => $query->{count},
            maybe date       => $query->{date},
            maybe end_date   => $query->{end_date},
            maybe start_date => $query->{start_date},
            maybe thumbs     => $query->{thumbs},
            maybe api_key    => $query->{api_key},
        }
    );
}

signature_for get_planetary_earth_assets => (
    method => 1,
    named  => [
        date    => NonEmptyStr,
        dim     => Optional [NonEmptyStr],
        lat     => NonEmptyStr,
        lon     => NonEmptyStr,
        api_key => Optional [NonEmptyStr],
    ],
);

method get_planetary_earth_assets($query) {
    return $self->_get_response(
        route => '/planetary/earth/assets',
        query => {
            date          => $query->{date},
            maybe dim     => $query->{dim},
            lat           => $query->{lat},
            lon           => $query->{lon},
            maybe api_key => $query->{api_key},
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
        api_key     => Optional [NonEmptyStr],
    ],
);

method get_planetary_earth_imagery($query) {
    return $self->_get_response(
        route => '/planetary/earth/imagery',
        query => {
            maybe cloud_score => $query->{cloud_score},
            date              => $query->{date},
            maybe dim         => $query->{dim},
            lat               => $query->{lat},
            lon               => $query->{lon},
            maybe api_key     => $query->{api_key},
        }
    );
}

__END__

=head1 SYNOPSIS

    use WebService::NASA;

    my $api = WebService::NASA->new(
        api_key => 'your_api_key',
    );

=head1 DESCRIPTION

This project is a Perl client for the NASA API. It is generated from a
full OpenAPI 3.0.0 specification, which can be found at F<nasa/openapi.yaml>.

By default both the request and response are validated against the OpenAPI
specification.

Please see L<https://api.nasa.gov> for more information. You can sign up for
a free API key there.

=head1 CONSTRUCTOR

The following arguments may be passed to the constructor.

=over 4

=item * C<api_key>

Optional. If not passed, we consult C<$ENV{NASA_API_KEY}>. If that is not set,
we use C<DEMO_KEY>. Note that the C<DEMO_KEY> has a more severe rate limit.

=item * C<validate_request>

Optional. Defaults to true. If set to false, requests will not be validated.

=item * C<validate_response>

Optional. Defaults to true. If set to false, responses will not be validated.

=item * C<strict>

Optional. Defaults to false. If set to true, validation errors will be fatal.

=item * C<timeout>

Optional. Defaults to 30 seconds. The number of seconds to wait for a
response.

=item * C<debug>

Optional. Defaults to false. If set to true, request/response debug
information will be printed to C<STDERR>.

=back

=head1 RATE LIMITING

L<WebService::NASA> does not handle rate limiting because your needs may vary.
Instead, we provide two methods to help you manage rate limiting,
C<requests_remaining> and C<last_request_time>. You can use these to
to manager your own rate limiting.

=head2 Web Service Rate Limits

Limits are placed on the number of API requests you may make using your API
key. Rate limits may vary by service. If you have an API key, you have an
I<official> hourly limit of 1,000 requests per hour. There is no clear
documentation on the limits and we've seen it vary across APIs. For at least
one API, the limit is 2,000 requests per hour.

For each API key, these limits are applied across all api.nasa.gov API
requests. Exceeding these limits will lead to your API key being temporarily
blocked from making further requests. The block will automatically be lifted
by waiting an hour. If you need higher rate limits, contact NASA.

=head2 DEMO_KEY Rate Limits

If you do not supply an API key, the C<DEMO_KEY> will be used.

This API key can be used for initially exploring APIs prior to signing up, but
it has much lower rate limits, so you’re encouraged to signup for your own API
key if you plan to use the API (signup is quick and easy). The rate limits for
the C<DEMO_KEY> are:

=over 4

=item * Hourly Limit: 30 requests per IP address per hour

=item * Daily Limit: 50 requests per IP address per day

=back

=head1 REGULAR METHODS

Most of these methods are only valid I<after> you have called a C<get_*> api
method.

=head2 C<requests_remaining>

The number of requests remaining for the current hour, as determined by the
C<X-RateLimit-Remaining> header.

=head2 C<last_request_time>

The time of the last request as a unix timestamp.

=head2 C<is_json>

Returns true if the last response was C<application/json>. The response is
gauranteed to be JSON decoded. Otherwise, you must handle the response for
yourself. For example, C<GET /planetary/apod> returns an image.

=head2 C<is_demo>

Returns true if the C<DEMO_KEY> is being used (i.e. no API key was passed to
the constructor and no C<$ENV{NASA_API_KEY}> was set). If the last request
accepted an API key, this method will still return false if the instance did
not have an API key available when constructed.

=head1 API METHODS

In addition to the arugments specified below for each method, all methods take
an I<optional> API key. If you do not provide one, the api key supplied in the
contructor will be used. If you did not supply one to the contructor,
C<DEMO_KEY> will be used. Note that the C<DEMO_KEY> is rate limited to 30
requests per ip address per hour and 50 requests per ip address per day.

Passing in an API key is useful if you have multiple keys and need to use a
different one for a specific request.

All requests return a raw response. For requests return C<application/json>,
this response will be the JSON decoded into a Perl data structure. For all
else, the raw response will be returned.

Because NASA has not provided a full OpenAPI specification, we cannot
guarantee exactly what will be returned. We do our best to provide a
specification, but we're very loose with it to avoid validation errors.

To understand what is returned, please see L<WenService::NASA::Spec>.



=head2 C<get_neo_rest_v1_feed>

    my $result = $nasa->get_neo_rest_v1_feed(
        end_date   => $end_date,
        start_date => $start_date,
    );

Method for C</neo/rest/v1/feed>.

Retrieve a list of Asteroids based on their closest approach date to Earth.


Arguments:

=over 4

=item * C<end_date> 

End date of APOD images to retrieve

Optional.

=item * C<start_date> 

Start date of APOD images to retrieve

Optional.


=back



=head2 C<get_neo_rest_v1_neo_asteroidid>

    my $result = $nasa->get_neo_rest_v1_neo_asteroidid(
        asteroidId => $asteroidId,
    );

Method for C</neo/rest/v1/neo/{asteroidId}/>.

Lookup a specific Asteroid based on its NASA JPL small body (SPK-ID) ID

Arguments:

=over 4

=item * C<asteroidId> 

Asteroid SPK-ID correlates to the NASA JPL small body

Required.


=back



=head2 C<get_neo_rest_v1_neo_browse>

    my $result = $nasa->get_neo_rest_v1_neo_browse(
        page => $page,
        size => $size,
    );

Method for C</neo/rest/v1/neo/browse>.

Browse the overall Asteroid data-set

Arguments:

=over 4

=item * C<page> 

Page number of query

Optional.

=item * C<size> 

Number of elements per page

Optional.


=back



=head2 C<get_planetary_apod>

    my $result = $nasa->get_planetary_apod(
        count      => $count,
        date       => $date,
        end_date   => $end_date,
        start_date => $start_date,
        thumbs     => $thumbs,
    );

Method for C</planetary/apod>.

One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in the APOD API Github repository.


Arguments:

=over 4

=item * C<count> 

If this is specified then count randomly chosen images will be returned. Cannot be used with date or start_date and end_date.

Optional.

=item * C<date> 

Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

Optional.

=item * C<end_date> 

End date of APOD images to retrieve

Optional.

=item * C<start_date> 

Start date of APOD images to retrieve

Optional.

=item * C<thumbs> 

Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.

Optional.


=back



=head2 C<get_planetary_earth_assets>

    my $result = $nasa->get_planetary_earth_assets(
        date => $date,
        dim  => $dim,
        lat  => $lat,
        lon  => $lon,
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
        date        => $date,
        dim         => $dim,
        lat         => $lat,
        lon         => $lon,
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

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: b60b34c7cadff7c6b81aed0fb1438edb