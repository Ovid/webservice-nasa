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

