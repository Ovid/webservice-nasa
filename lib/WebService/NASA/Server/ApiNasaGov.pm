package WebService::NASA::Server::ApiNasaGov;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 21f041d1eaa35215af5d7ec56618f367

# ABSTRACT: Perl interface to NASA's public APIs

use v5.20.0;
use WebService::NASA::Moose types => [
    qw(
      NonEmptyStr
      Optional
    )
];
with qw(WebService::NASA::Role::Server);

use PerlX::Maybe qw(maybe);
use Type::Params -sigs;

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

    use WebService::NASA::Server::ApiNasaGov

    my $api = WebService::NASA::Server::ApiNasaGov->new(
        api_key => 'your_api_key',
    );

=head1 DESCRIPTION

Gives acess to the endpoints at L<https://api.nasa.gov>. You probably want
C<WebService::NASA> instead, as it's the front-end for this module.

Please see L<https://api.nasa.gov> for more information. You can sign up for
a free API key there.

=head1 METHODS

To understand what is returned, please see L<WebService::NASA::Schema>.



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

One of the most popular websites at NASA is the L<Astronomy Picture of the Day|https://apod.nasa.gov/apod/astropix.html>. In fact, this website is one of the L<most popular websites|https://analytics.usa.gov/> across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the C<concept_tags> parameter is set to C<True>, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in L<the APOD API Github repository|https://github.com/nasa/apod-api>.

Arguments:

=over 4

=item * C<count> 

If this is specified then count randomly chosen images will be returned. Cannot be used with C<date> or C<start_date> and C<end_date>.

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

This endpoint retrieves the date-times and asset names for closest
available imagery for a supplied location and date. The satellite
passes over each point on earth roughly once every sixteen days. L<This
is an amazing
visualization|https://earthobservatory.nasa.gov/features/LandsatBigData>
of the acquisition pattern for Landsat 8 imagery. The objective of
this endpoint is primarily to support the use of the imagery endpoint.

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
current versions of the API.

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

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 21f041d1eaa35215af5d7ec56618f367