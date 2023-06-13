package WebService::NASA::Schema;

# ABSTRACT: JSON Schema for WebService::NASA

use v5.20.0;
use warnings;
our $VERSION = '0.1';

use parent 'Exporter';
our @EXPORT_OK = qw(get_nasa_schema);

sub get_nasa_schema () {
    return {
        components => {
            parameters => {
                Dimensions => {
                    description => 'Width and height of image in degrees',
                    in          => 'query',
                    name        => 'dim',
                    schema      => {
                        type => 'number',
                    },
                },
                ImageDate => {
                    description => 'Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned',
                    in          => 'query',
                    name        => 'date',
                    schema      => {
                        format => 'date',
                        type   => 'string',
                    },
                },
                Latitude => {
                    description => 'Latitude',
                    in          => 'query',
                    name        => 'lat',
                    schema      => {
                        type => 'number',
                    },
                },
                Longitude => {
                    description => 'Longitude',
                    in          => 'query',
                    name        => 'lon',
                    schema      => {
                        type => 'number',
                    },
                },
            },
            securitySchemes => {
                api_key => {
                    in   => 'query',
                    name => 'api_key',
                    type => 'apiKey',
                },
            },
        },
        info => {
            description => 'NASA provides free APIs for the public at https://api.nasa.gov/.

Go there, sign up for an API key, and start using this OpenAPI specification.
',
            title   => 'Unofficial NASA OpenAPI Specification',
            version => '1.0.0',
        },
        openapi => '3.0.0',
        paths   => {
            '/planetary/apod' => {
                get => {
                    description =>
                      'One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in the APOD API Github repository.
',
                    parameters => [
                        {
                            '$ref' => '#/components/parameters/ImageDate',
                        },
                        {
                            description => 'Start date of APOD images to retrieve',
                            in          => 'query',
                            name        => 'start_date',
                            schema      => {
                                format => 'date',
                                type   => 'string',
                            },
                        },
                        {
                            description => 'End date of APOD images to retrieve',
                            in          => 'query',
                            name        => 'end_date',
                            schema      => {
                                format => 'date',
                                type   => 'string',
                            },
                        },
                    ],
                    responses => {
                        200 => {
                            content => {
                                'application/json' => {
                                    schema => {
                                        oneOf => [
                                            {
                                                example => [
                                                    {
                                                        copyright       => 'Petr Horalek',
                                                        date            => '2021-01-01',
                                                        explanation     => 'The South Celestial Pole is easy to spot in star trail images of the southern sky.',
                                                        hdurl           => 'https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.png',
                                                        media_type      => 'image',
                                                        service_version => 'v1',
                                                        title           => 'Galaxies and the South Celestial Pole',
                                                        url             => 'https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.jpg',
                                                    },
                                                    {
                                                        copyright   => 'Mike Smolinsky',
                                                        date        => '2021-01-02',
                                                        explanation =>
                                                          'In the mid 19th century, one of the first photographic technologies used to record the lunar surface was the wet-plate collodion process, notably employed by British astronomer Warren De la Rue.',
                                                        hdurl           => 'https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO.jpg',
                                                        media_type      => 'image',
                                                        service_version => 'v1',
                                                        title           => '21st Century Wet Collodion Moon',
                                                        url             => 'https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO_1024.jpg',
                                                    },
                                                ],
                                                type => 'array',
                                            },
                                            {
                                                example => {
                                                    copyright => '
Tianyao Yang
',
                                                    date        => '2023-06-12',
                                                    explanation =>
                                                      "What\x{2019}s that near the Moon? It\x{2019}s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \x{2014} it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.",
                                                    hdurl           => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg',
                                                    media_type      => 'image',
                                                    service_version => 'v1',
                                                    title           => 'The Largest Satellites of Earth',
                                                    url             => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg',
                                                },
                                                type => 'object',
                                            },
                                        ],
                                    },
                                },
                            },
                            description => 'successful operation',
                        },
                        400 => {
                            description => 'Bad request',
                        },
                    },
                    security => [
                        {
                            api_key => [],
                        },
                    ],
                    summary => 'Returns Astronomy Picture of the Day images',
                    tags    => [
                        'images',
                    ],
                },
            },
            '/planetary/earth/assets' => {
                get => {
                    description => 'This endpoint retrieves the date-times and asset names for closest available
imagery for a supplied location and date. The satellite passes over each point
on earth roughly once every sixteen days. This is an amazing visualization of
the acquisition pattern for Landsat 8 imagery. The objective of this endpoint
is primarily to support the use of the imagery endpoint.
',
                    parameters => [
                        {
                            '$ref'   => '#/components/parameters/Latitude',
                            example  => '1.5',
                            required => 1,
                        },
                        {
                            '$ref'   => '#/components/parameters/Longitude',
                            example  => '100.75',
                            required => 1,
                        },
                        {
                            '$ref' => '#/components/parameters/Dimensions',
                        },
                        {
                            '$ref'   => '#/components/parameters/ImageDate',
                            example  => '2018-02-04',
                            required => 1,
                        },
                    ],
                    responses => {
                        200 => {
                            content => {
                                'application/json' => {
                                    example => {
                                        date     => '2014-02-04T03:30:01.210000',
                                        id       => 'LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204',
                                        resource => {
                                            dataset => 'LANDSAT/LC08/C01/T1_SR',
                                            planet  => 'earth',
                                        },
                                        service_version => 'v5000',
                                        url             =>
                                          'https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels',
                                    },
                                    schema => {
                                        type => 'object',
                                    },
                                },
                            },
                            description => 'Image assets retrieved successfully',
                        },
                        400 => {
                            description => 'Bad request',
                        },
                        403 => {
                            description => 'API key is invalid or missing',
                        },
                    },
                    security => [
                        {
                            api_key => [],
                        },
                    ],
                    tags => [
                        'earth',
                        'landsat-8',
                        'images',
                    ],
                    'x-name' => 'Earth Imagery Assets',
                },
            },
            '/planetary/earth/imagery' => {
                get => {
                    description => 'This endpoint retrieves the Landsat 8 image for the supplied location and
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
',
                    parameters => [
                        {
                            '$ref'   => '#/components/parameters/Latitude',
                            example  => '1.5',
                            required => 1,
                        },
                        {
                            '$ref'   => '#/components/parameters/Longitude',
                            example  => '100.75',
                            required => 1,
                        },
                        {
                            '$ref' => '#/components/parameters/Dimensions',
                        },
                        {
                            '$ref'   => '#/components/parameters/ImageDate',
                            example  => '2018-01-01',
                            required => 1,
                        },
                        {
                            description => 'NOT CURRENTLY AVAILABLE!!!! calculate the percentage of the image covered by clouds',
                            in          => 'query',
                            name        => 'cloud_score',
                            schema      => {
                                type => 'boolean',
                            },
                        },
                    ],
                    responses => {
                        200 => {
                            content => {
                                'image/png' => {
                                    schema => {
                                        format => 'binary',
                                        type   => 'string',
                                    },
                                },
                            },
                            description => 'Image retrieved successfully',
                        },
                        400 => {
                            description => 'Bad request',
                        },
                        403 => {
                            description => 'API key is invalid or missing',
                        },
                    },
                    security => [
                        {
                            api_key => [],
                        },
                    ],
                    tags => [
                        'earth',
                        'landsat-8',
                        'images',
                    ],
                    'x-name' => 'Earth Imagery Image',
                },
            },
        },
        servers => [
            {
                description => 'NASA OpenAPI server',
                url         => 'https://api.nasa.gov',
            },
        ],
        tags => [
            {
                description => 'Earth imagery',
                name        => 'earth',
            },
            {
                description => 'Landsat 8 satellite imagery of Earth',
                name        => 'landsat-8',
            },
            {
                description => 'APIs related to fetching images',
                name        => 'images',
            },
        ],
    };
}

1;

__END__

=head1 SYNOPSIS

    use WebService::NASA::Schema qw(get_nasa_schema);

    my $schema = get_nasa_schema();

=head1 DESCRIPTION

This module provides a function that returns the OpenAPI schema for NASA'S public APIs.

=head1 FUNCTIONS

All functions exported on demand.

=head2 get_nasa_schema

    my $schema = get_nasa_schema();

Returns as hashref the OpenAPI schema for NASA'S public APIs.

=head1 SCHEMA

The full schema is defined as:

    openapi: 3.0.0
    info:
      version: 1.0.0
      title: Unofficial NASA OpenAPI Specification
      description: |
        NASA provides free APIs for the public at https://api.nasa.gov/.
    
        Go there, sign up for an API key, and start using this OpenAPI specification.
    
    servers:
      - url: https://api.nasa.gov
        description: NASA OpenAPI server
    
    paths:
      /planetary/earth/imagery:
        get:
          x-name: Earth Imagery Image
          description: |
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
          parameters:
            - $ref: '#/components/parameters/Latitude'
              required: true
              example: 1.5
            - $ref: '#/components/parameters/Longitude'
              required: true
              example: 100.75
            - $ref: '#/components/parameters/Dimensions'
            - $ref: '#/components/parameters/ImageDate'
              required: true
              example: 2018-01-01
            - name: cloud_score
              in: query
              description: NOT CURRENTLY AVAILABLE!!!! calculate the percentage of the image covered by clouds
              schema:
                type: boolean
          responses:
            '200':
              description: Image retrieved successfully
              content:
                image/png:
                  schema:
                    type: string
                    format: binary
            '400':
              description: Bad request
            '403':
              description: API key is invalid or missing
          security:
            - api_key: []
          tags:
            - earth
            - landsat-8
            - images
      /planetary/earth/assets:
        get:
          x-name: Earth Imagery Assets
          description: |
            This endpoint retrieves the date-times and asset names for closest available
            imagery for a supplied location and date. The satellite passes over each point
            on earth roughly once every sixteen days. This is an amazing visualization of
            the acquisition pattern for Landsat 8 imagery. The objective of this endpoint
            is primarily to support the use of the imagery endpoint.
          parameters:
            - $ref: '#/components/parameters/Latitude'
              required: true
              example: 1.5
            - $ref: '#/components/parameters/Longitude'
              required: true
              example: 100.75
            - $ref: '#/components/parameters/Dimensions'
            - $ref: '#/components/parameters/ImageDate'
              required: true
              example: 2018-02-04
          responses:
            '200':
              description: Image assets retrieved successfully
              content:
                application/json:
                  schema:
                    type: object
                  example: {"date":"2014-02-04T03:30:01.210000","id":"LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204","resource":{"dataset":"LANDSAT/LC08/C01/T1_SR","planet":"earth"},"service_version":"v5000","url":"https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels"}
            '400':
              description: Bad request
            '403':
              description: API key is invalid or missing
          security:
            - api_key: []
          tags:
            - earth
            - landsat-8
            - images
      /planetary/apod:
        get:
          description: >
            One of the most popular websites at NASA is the Astronomy Picture of the Day.
            In fact, this website is one of the most popular websites across all federal
            agencies. It has the popular appeal of a Justin Bieber video. This endpoint
            structures the APOD imagery and associated metadata so that it can be
            repurposed for other applications. In addition, if the concept_tags parameter
            is set to True, then keywords derived from the image explanation are returned.
            These keywords could be used as auto-generated hashtags for twitter or
            instagram feeds; but generally help with discoverability of relevant imagery.
    
            The full documentation for this API can be found in the APOD API Github repository.
          parameters:
            - $ref: '#/components/parameters/ImageDate'
            - name: start_date
              in: query
              description: Start date of APOD images to retrieve
              schema:
                type: string
                format: date
            - name: end_date
              in: query
              description: End date of APOD images to retrieve
              schema:
                type: string
                format: date
          responses:
            "200":
              content:
                application/json:
                  schema:
                    oneOf:
                      - type: array
                        example: [{"copyright":"Petr Horalek","date":"2021-01-01","explanation":"The South Celestial Pole is easy to spot in star trail images of the southern sky.","hdurl":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.png","media_type":"image","service_version":"v1","title":"Galaxies and the South Celestial Pole","url":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.jpg"},{"copyright":"Mike Smolinsky","date":"2021-01-02","explanation":"In the mid 19th century, one of the first photographic technologies used to record the lunar surface was the wet-plate collodion process, notably employed by British astronomer Warren De la Rue.","hdurl":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO.jpg","media_type":"image","service_version":"v1","title":"21st Century Wet Collodion Moon","url":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO_1024.jpg"}]
                      - type: object
                        example: {"copyright":"\nTianyao Yang\n","date":"2023-06-12","explanation":"What\u2019s that near the Moon? It\u2019s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \u2014 it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.","hdurl":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg","media_type":"image","service_version":"v1","title":"The Largest Satellites of Earth","url":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg"}
              description: successful operation
            '400':
              description: Bad request
          security:
            - api_key: []
          summary: Returns Astronomy Picture of the Day images
          tags:
            - images
    components:
      parameters:
        Latitude:
          name: lat
          in: query
          description: Latitude
          schema:
            type: number
        Longitude:
          name: lon
          in: query
          description: Longitude
          schema:
            type: number
        Dimensions:
          name: dim 
          in: query
          description: Width and height of image in degrees
          schema:
            type: number
        ImageDate:
          name: date
          in: query
          description: Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned
          schema:
            type: string
            format: date
      securitySchemes:
        api_key:
          in: query
          name: api_key
          type: apiKey
    tags:
      - name: earth
        description: Earth imagery
      - name: landsat-8
        description: Landsat 8 satellite imagery of Earth
      - name: images
        description: APIs related to fetching images

