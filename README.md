# NAME

WebService::NASA - Perl interface to NASA's public APIs

# VERSION

version 0.1

# SYNOPSIS

```perl
use WebService::NASA;

my $api = WebService::NASA->new(
    api_key => 'your_api_key',
);
```

# DESCRIPTION

This project is a Perl client for the NASA API. It is generated from a
full OpenAPI 3.0.0 specification, which can be found at `nasa/openapi.yaml`.

# METHODS

In addition to the arugments specified below for each method, all methods take
an _optional_ API key. If you do not provide one, the api key supplied in the
contructor will be used. If you did not supply one to the contructor,
`DEMO_KEY` will be used. Note that the `DEMO_KEY` is rate limited to 30
requests per ip address per hour and 50 requests per ip address per day.

Passing in an API key is useful if you have multiple keys and want to use a
different one for a specific request.

## `get_neo_rest_v1_feed`

```perl
my $result = $nasa->get_neo_rest_v1_feed(
    end_date   => $end_date,
    start_date => $start_date,
);
```

Method for `/neo/rest/v1/feed`.

Retrieve a list of Asteroids based on their closest approach date to Earth.

Arguments:

- `end_date` 

    End date of APOD images to retrieve

    Optional.

- `start_date` 

    Start date of APOD images to retrieve

    Optional.

## `get_neo_rest_v1_neo_asteroidid_`

```perl
my $result = $nasa->get_neo_rest_v1_neo_asteroidid_(
    asteroidId => $asteroidId,
);
```

Method for `/neo/rest/v1/neo/{asteroidId}/`.

Lookup a specific Asteroid based on its NASA JPL small body (SPK-ID) ID

Arguments:

- `asteroidId` 

    Asteroid SPK-ID correlates to the NASA JPL small body

    Required.

## `get_neo_rest_v1_neo_browse`

```perl
my $result = $nasa->get_neo_rest_v1_neo_browse(
    page => $page,
    size => $size,
);
```

Method for `/neo/rest/v1/neo/browse`.

Browse the overall Asteroid data-set

Arguments:

- `page` 

    Page number of query

    Optional.

- `size` 

    Number of elements per page

    Optional.

## `get_planetary_apod`

```perl
my $result = $nasa->get_planetary_apod(
    count      => $count,
    date       => $date,
    end_date   => $end_date,
    start_date => $start_date,
    thumbs     => $thumbs,
);
```

Method for `/planetary/apod`.

One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept\_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in the APOD API Github repository.

Arguments:

- `count` 

    If this is specified then count randomly chosen images will be returned. Cannot be used with date or start\_date and end\_date.

    Optional.

- `date` 

    Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

    Optional.

- `end_date` 

    End date of APOD images to retrieve

    Optional.

- `start_date` 

    Start date of APOD images to retrieve

    Optional.

- `thumbs` 

    Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.

    Optional.

## `get_planetary_earth_assets`

```perl
my $result = $nasa->get_planetary_earth_assets(
    date => $date,
    dim  => $dim,
    lat  => $lat,
    lon  => $lon,
);
```

Method for `/planetary/earth/assets`.

This endpoint retrieves the date-times and asset names for closest available
imagery for a supplied location and date. The satellite passes over each point
on earth roughly once every sixteen days. This is an amazing visualization of
the acquisition pattern for Landsat 8 imagery. The objective of this endpoint
is primarily to support the use of the imagery endpoint.

Arguments:

- `date` 

    Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

    Required.

- `dim` 

    Width and height of image in degrees

    Optional.

- `lat` 

    Latitude

    Required.

- `lon` 

    Longitude

    Required.

## `get_planetary_earth_imagery`

```perl
my $result = $nasa->get_planetary_earth_imagery(
    cloud_score => $cloud_score,
    date        => $date,
    dim         => $dim,
    lat         => $lat,
    lon         => $lon,
);
```

Method for `/planetary/earth/imagery`.

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

- `cloud_score` 

    NOT CURRENTLY AVAILABLE!!!! calculate the percentage of the image covered by clouds

    Optional.

- `date` 

    Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned

    Required.

- `dim` 

    Width and height of image in degrees

    Optional.

- `lat` 

    Latitude

    Required.

- `lon` 

    Longitude

    Required.

\#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 7756a2c4b583e668a6da50a37e843674

# AUTHOR

Curtis "Ovid" Poe <curtis.poe@gmail.com>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2023 by Curtis "Ovid" Poe.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
