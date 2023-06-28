package WebService::NASA;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 6c606b924d10d14e8d2e4299e33a1ac1

# ABSTRACT: Perl interface to NASA's public APIs

# see also https://api.nasa.gov/

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
with qw(
  WebService::NASA::Role::DelegatedParams
);

use Type::Params -sigs;
use Method::Delegation qw(delegate);

field _constructor_args => (
    isa    => HashRef,
    writer => '_set_constructor_args',
);

method BUILD($args) {
    $self->_set_constructor_args($args);
}

# Begin generated code here

field api_nasa_gov_server => (
    isa     => InstanceOf ['WebService::NASA::Server::ApiNasaGov'],
    default => method() {
        require WebService::NASA::Server::ApiNasaGov;
        WebService::NASA::Server::ApiNasaGov->new( $self->_constructor_args )
    },
);
delegate(
    methods => [
        'get_neo_rest_v1_feed',
        'get_neo_rest_v1_neo_asteroidid',
        'get_neo_rest_v1_neo_browse',
        'get_planetary_apod',
        'get_planetary_earth_assets',
        'get_planetary_earth_imagery',
    ],
    to   => 'api_nasa_gov_server',
    args => 1,
);

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

In addition to the arguments specified below for each method, all methods take
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

To understand what is returned, please see L<WebService::NASA::Schema>.



=head1 Server C<https://api.nasa.gov>

Methods are delegated to L<WebService::NASA::Server::ApiNasaGov>.



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

=head1 SEE ALSO

The unofficial NASA OpenAPI specification can be found at
L<https://github.com/Ovid/nasa-openapi>.

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 6c606b924d10d14e8d2e4299e33a1ac1