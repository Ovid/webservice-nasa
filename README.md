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

By default both the request and response are validated against the OpenAPI
specification.

Please see [https://api.nasa.gov](https://api.nasa.gov) for more information. You can sign up for
a free API key there.

# CONSTRUCTOR

The following arguments may be passed to the constructor.

- `api_key`

    Optional. If not passed, we consult `$ENV{NASA_API_KEY}`. If that is not set,
    we use `DEMO_KEY`. Note that the `DEMO_KEY` has a more severe rate limit.

- `validate_request`

    Optional. Defaults to true. If set to false, requests will not be validated.

- `validate_response`

    Optional. Defaults to true. If set to false, responses will not be validated.

- `strict`

    Optional. Defaults to false. If set to true, validation errors will be fatal.

- `timeout`

    Optional. Defaults to 30 seconds. The number of seconds to wait for a
    response.

- `debug`

    Optional. Defaults to false. If set to true, request/response debug
    information will be printed to `STDERR`.

# RATE LIMITING

[WebService::NASA](https://metacpan.org/pod/WebService%3A%3ANASA) does not handle rate limiting because your needs may vary.
Instead, we provide two methods to help you manage rate limiting,
`requests_remaining` and `last_request_time`. You can use these to
to manager your own rate limiting.

## Web Service Rate Limits

Limits are placed on the number of API requests you may make using your API
key. Rate limits may vary by service. If you have an API key, you have an
_official_ hourly limit of 1,000 requests per hour. There is no clear
documentation on the limits and we've seen it vary across APIs. For at least
one API, the limit is 2,000 requests per hour.

For each API key, these limits are applied across all api.nasa.gov API
requests. Exceeding these limits will lead to your API key being temporarily
blocked from making further requests. The block will automatically be lifted
by waiting an hour. If you need higher rate limits, contact NASA.

## DEMO\_KEY Rate Limits

If you do not supply an API key, the `DEMO_KEY` will be used.

This API key can be used for initially exploring APIs prior to signing up, but
it has much lower rate limits, so you’re encouraged to signup for your own API
key if you plan to use the API (signup is quick and easy). The rate limits for
the `DEMO_KEY` are:

- Hourly Limit: 30 requests per IP address per hour
- Daily Limit: 50 requests per IP address per day

# REGULAR METHODS

Most of these methods are only valid _after_ you have called a `get_*` api
method.

## `requests_remaining`

The number of requests remaining for the current hour, as determined by the
`X-RateLimit-Remaining` header.

## `last_request_time`

The time of the last request as a unix timestamp.

## `is_json`

Returns true if the last response was `application/json`. The response is
gauranteed to be JSON decoded. Otherwise, you must handle the response for
yourself. For example, `GET /planetary/apod` returns an image.

## `is_demo`

Returns true if the `DEMO_KEY` is being used (i.e. no API key was passed to
the constructor and no `$ENV{NASA_API_KEY}` was set). If the last request
accepted an API key, this method will still return false if the instance did
not have an API key available when constructed.

# API METHODS

In addition to the arguments specified below for each method, all methods take
an _optional_ API key. If you do not provide one, the api key supplied in the
contructor will be used. If you did not supply one to the contructor,
`DEMO_KEY` will be used. Note that the `DEMO_KEY` is rate limited to 30
requests per ip address per hour and 50 requests per ip address per day.

Passing in an API key is useful if you have multiple keys and need to use a
different one for a specific request.

All requests return a raw response. For requests return `application/json`,
this response will be the JSON decoded into a Perl data structure. For all
else, the raw response will be returned.

Because NASA has not provided a full OpenAPI specification, we cannot
guarantee exactly what will be returned. We do our best to provide a
specification, but we're very loose with it to avoid validation errors.

To understand what is returned, please see [WebService::NASA::Schema](https://metacpan.org/pod/WebService%3A%3ANASA%3A%3ASchema).

# Server `https://api.nasa.gov`

Methods are delegated to [WebService::NASA::Server::ApiNasaGov](https://metacpan.org/pod/WebService%3A%3ANASA%3A%3AServer%3A%3AApiNasaGov).

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

## `get_neo_rest_v1_neo_asteroidid`

```perl
my $result = $nasa->get_neo_rest_v1_neo_asteroidid(
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

One of the most popular websites at NASA is the [Astronomy Picture of the Day](https://apod.nasa.gov/apod/astropix.html). In fact, this website is one of the [most popular websites](https://analytics.usa.gov/) across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the `concept_tags` parameter is set to `True`, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in [the APOD API Github repository](https://github.com/nasa/apod-api).

Arguments:

- `count` 

    If this is specified then count randomly chosen images will be returned. Cannot be used with `date` or `start_date` and `end_date`.

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

This endpoint retrieves the date-times and asset names for closest
available imagery for a supplied location and date. The satellite
passes over each point on earth roughly once every sixteen days. [This
is an amazing
visualization](https://earthobservatory.nasa.gov/features/LandsatBigData)
of the acquisition pattern for Landsat 8 imagery. The objective of
this endpoint is primarily to support the use of the imagery endpoint.

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
current versions of the API.

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

# SEE ALSO

The unofficial NASA OpenAPI specification can be found at
[https://github.com/Ovid/nasa-openapi](https://github.com/Ovid/nasa-openapi).

# Server `https://eonet.gsfc.nasa.gov/api/v3/`

Methods are delegated to [WebService::NASA::Server::EonetGsfcNasaGov](https://metacpan.org/pod/WebService%3A%3ANASA%3A%3AServer%3A%3AEonetGsfcNasaGov).

## `get_events`

```perl
my $result = $nasa->get_events(
    bbox     => $bbox,
    category => $category,
    days     => $days,
    end      => $end,
    limit    => $limit,
    magID    => $magID,
    magMax   => $magMax,
    magMin   => $magMin,
    source   => $source,
    start    => $start,
    status   => $status,
);
```

Method for `/events`.

Returns a list of natural events currently occurring on Earth.

Arguments:

- `bbox` 

    Query using a bounding box for all events with datapoints that fall within. This uses two pairs of coordinates: the upper left hand corner (lon,lat) followed by the lower right hand corner (lon,lat).

    Optional.

- `category` 

    Category of each earth event

    Optional.

- `days` 

    The maximum number of days to return

    Optional.

- `end` 

    The end date of the events

    Optional.

- `limit` 

    The maximum number of events to return

    Optional.

- `magID` 

    EONET Event Magnitudes

    Optional.

- `magMax` 

    The maximum magnitude of the events

    Optional.

- `magMin` 

    The minimum magnitude of the events

    Optional.

- `source` 

    Source of each earth event

    Optional.

- `start` 

    The start date of the events

    Optional.

- `status` 

    Status of each earth event

    Optional.

# SEE ALSO

The unofficial NASA OpenAPI specification can be found at
[https://github.com/Ovid/nasa-openapi](https://github.com/Ovid/nasa-openapi).

\#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: c16f9aadede5d0b5171ea1a9df93c1c4

# AUTHOR

Curtis "Ovid" Poe <curtis.poe@gmail.com>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2023 by Curtis "Ovid" Poe.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```

# POD ERRORS

Hey! **The above document had some coding errors, which are explained below:**

- Around line 183:

    You forgot a '=back' before '=head2'

- Around line 203:

    You forgot a '=back' before '=head2'

- Around line 230:

    You forgot a '=back' before '=head2'

- Around line 279:

    You forgot a '=back' before '=head2'

- Around line 326:

    You forgot a '=back' before '=head2'
