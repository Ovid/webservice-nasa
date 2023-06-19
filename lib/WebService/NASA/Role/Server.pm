package WebService::NASA::Role::Server;

use WebService::NASA::Moose::Role;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

# ABSTRACT: Role to provide basic server functionality

use v5.20.0;
use WebService::NASA::Types qw(
  Bool
  HashRef
  InstanceOf
  NonEmptyStr
  Optional
  PositiveInt
  PositiveOrZeroInt
  Undef
);

use WebService::NASA::Response;
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

field _json => (
    isa     => InstanceOf ['Cpanel::JSON::XS'],
    default => method() { Cpanel::JSON::XS->new->utf8->unblessed_bool(1) },
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
    return WebService::NASA::Response->new(
        is_timeout         => $self->is_timeout,
        route              => $route,
        is_json            => $self->is_json,
        last_request_time  => $self->last_request_time,
        requests_remaining => $self->requests_remaining,
        content            => $raw_response,
    );
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

__END__

=head1 SYNOPSIS

    package WebService::NASA::Server::ApiNasaGov;
    use WebService::NASA::Moose;
    with qw(WebService::NASA::Role::Server);

=head1 DESCRIPTION

Provides the basic server querying functionality for the NASA API.

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

=head1 SEE ALSO

The unofficial NASA OpenAPI specification can be found at
L<https://github.com/Ovid/nasa-openapi>.
