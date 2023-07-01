#!/usr/bin/env perl

use Test::Most;
use lib 'lib';
use Clone 'clone';
use WebService::NASA::Generator::Utils qw(preprocess_openapi perl_to_string);

use DDP;
my $data     = openapi();
my $orig     = clone($data);
my $resolved = preprocess_openapi($data);
is_deeply $resolved, resolved(), 'Resolved all $ref entries and converted markdown to POD';
eq_or_diff $data, $orig, '... and the original data is unchanged';
explain $resolved;

done_testing;

sub openapi {
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
                        maximum => 90,
                        minimum => -90,
                        type    => 'number',
                    },
                },
                Longitude => {
                    description => 'Longitude',
                    in          => 'query',
                    name        => 'lon',
                    schema      => {
                        maximum => 180,
                        minimum => -180,
                        type    => 'number',
                    },
                },
            },
            schemas => {
                APODImage => {
                    properties => {
                        copyright => {
                            description => 'The copyright holder of the image',
                            example     => 'Alan Smithee',
                            type        => 'string',
                        },
                        date => {
                            description => 'The date the image was published.',
                            example     => '2018-02-04',
                            format      => 'date',
                            type        => 'string',
                        },
                        explanation => {
                            description => 'The text explanation of the image. This is often much longer than the title.',
                            example     =>
                              'This image shows the pillars as seen in visible light, capturing the multi-coloured glow of gas clouds, wispy tendrils of dark cosmic dust, and the rust-coloured elephants trunks of the nebula\'s famous pillars.',
                            type => 'string',
                        },
                        hdurl => {
                            description => 'The URL of the high resolution image.',
                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                            type        => 'string',
                        },
                        title => {
                            description => 'The title of the image.',
                            example     => 'The Eagle Nebula in Infrared from Hubble',
                            type        => 'string',
                        },
                        url => {
                            description => 'The URL of the APOD image or video of the day.',
                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                            type        => 'string',
                        },
                    },
                    type => 'object',
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
            contact => {
                email => 'curtis.poe@gmail.com',
                name  => 'Curtis "Ovid" Poe',
                url   => 'https://ovid.github.io',
            },
            description => 'NASA provides free APIs for the public at https://api.nasa.gov/.',
            license     => {
                name => 'MIT',
                url  => 'https://opensource.org/license/mit/',
            },
            title   => 'Unofficial NASA OpenAPI Specification',
            version => '1.0.0',
        },
        openapi => '3.0.0',
        paths   => {
            '/planetary/apod' => {
                get => {
                    description => 'One of the most popular websites at NASA is the [Astronomy Picture of the Day](https://apod.nasa.gov/apod/astropix.html).
In fact, this website is one of the [most popular websites](https://analytics.usa.gov/) across all federal
agencies. It has the popular appeal of a Justin Bieber video. This endpoint
structures the APOD imagery and associated metadata so that it can be
repurposed for other applications. In addition, if the `concept_tags` parameter
is set to `True`, then keywords derived from the image explanation are returned.
These keywords could be used as auto-generated hashtags for twitter or
instagram feeds; but generally help with discoverability of relevant imagery.

The full documentation for this API can be found in [the APOD API Github repository](https://github.com/nasa/apod-api).',
                    parameters => [
                        {
                            '$ref'  => '#/components/parameters/ImageDate',
                            example => '2018-02-04',
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
                        {
                            description =>
                              'If this is specified then count randomly chosen images will be returned. Cannot be used with date or start_date and end_date.',
                            in     => 'query',
                            name   => 'count',
                            schema => {
                                type => 'integer',
                            },
                        },
                        {
                            description => 'Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.',
                            in          => 'query',
                            name        => 'thumbs',
                            schema      => {
                                type => 'boolean',
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
                                                items => {
                                                    '$ref' => '#/components/schemas/APODImage',
                                                },
                                                type => 'array',
                                            },
                                            {
                                                '$ref'  => '#/components/schemas/APODImage',
                                                example => {
                                                    copyright   => 'Tianyao Yang',
                                                    date        => '2023-06-12',
                                                    explanation =>
                                                      "What\x{2019}s that near the Moon? It\x{2019}s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \x{2014} it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.",
                                                    hdurl           => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg',
                                                    media_type      => 'image',
                                                    service_version => 'v1',
                                                    title           => 'The Largest Satellites of Earth',
                                                    url             => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg',
                                                },
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
                    security => [ { api_key => [] } ],
                    summary  => 'Returns Astronomy Picture of the Day images',
                    tags     => ['images'],
                },
            },
        },
        servers => [
            { description => 'NASA OpenAPI server', url => 'https://api.nasa.gov', },
        ],
        tags => [
            { description => 'Earth imagery',                        name => 'earth', },
            { description => 'Landsat 8 satellite imagery of Earth', name => 'landsat-8', },
            { description => 'APIs related to fetching images',      name => 'images', },
            { description => 'APIs related to asteroids',            name => 'asteroids', },
        ],
    };
}

sub resolved {
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
                        maximum => 90,
                        minimum => -90,
                        type    => 'number',
                    },
                },
                Longitude => {
                    description => 'Longitude',
                    in          => 'query',
                    name        => 'lon',
                    schema      => {
                        maximum => 180,
                        minimum => -180,
                        type    => 'number',
                    },
                },
            },
            schemas => {
                APODImage => {
                    properties => {
                        copyright => {
                            description => 'The copyright holder of the image',
                            example     => 'Alan Smithee',
                            type        => 'string',
                        },
                        date => {
                            description => 'The date the image was published.',
                            example     => '2018-02-04',
                            format      => 'date',
                            type        => 'string',
                        },
                        explanation => {
                            description => 'The text explanation of the image. This is often much longer than the title.',
                            example     =>
                              'This image shows the pillars as seen in visible light, capturing the multi-coloured glow of gas clouds, wispy tendrils of dark cosmic dust, and the rust-coloured elephants trunks of the nebula\'s famous pillars.',
                            type => 'string',
                        },
                        hdurl => {
                            description => 'The URL of the high resolution image.',
                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                            type        => 'string',
                        },
                        title => {
                            description => 'The title of the image.',
                            example     => 'The Eagle Nebula in Infrared from Hubble',
                            type        => 'string',
                        },
                        url => {
                            description => 'The URL of the APOD image or video of the day.',
                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                            type        => 'string',
                        },
                    },
                    type => 'object',
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
            contact => {
                email => 'curtis.poe@gmail.com',
                name  => 'Curtis "Ovid" Poe',
                url   => 'https://ovid.github.io',
            },
            description => 'NASA provides free APIs for the public at https://api.nasa.gov/.',
            license     => {
                name => 'MIT',
                url  => 'https://opensource.org/license/mit/',
            },
            title   => 'Unofficial NASA OpenAPI Specification',
            version => '1.0.0',
        },
        openapi => '3.0.0',
        paths   => {
            '/planetary/apod' => {
                get => {
                    description => 'One of the most popular websites at NASA is the L<Astronomy Picture of the Day|https://apod.nasa.gov/apod/astropix.html>.
In fact, this website is one of the L<most popular websites|https://analytics.usa.gov/> across all federal
agencies. It has the popular appeal of a Justin Bieber video. This endpoint
structures the APOD imagery and associated metadata so that it can be
repurposed for other applications. In addition, if the C<concept_tags> parameter
is set to C<True>, then keywords derived from the image explanation are returned.
These keywords could be used as auto-generated hashtags for twitter or
instagram feeds; but generally help with discoverability of relevant imagery.

The full documentation for this API can be found in L<the APOD API Github repository|https://github.com/nasa/apod-api>.',
                    parameters => [
                        {
                            description => 'Date of image; if not supplied, then the most recent image (i.e., closest to today) is returned',
                            example     => '2018-02-04',
                            in          => 'query',
                            name        => 'date',
                            schema      => {
                                format => 'date',
                                type   => 'string',
                            },
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
                        {
                            description =>
                              'If this is specified then count randomly chosen images will be returned. Cannot be used with date or startI<date and end>date.',
                            in     => 'query',
                            name   => 'count',
                            schema => {
                                type => 'integer',
                            },
                        },
                        {
                            description => 'Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.',
                            in          => 'query',
                            name        => 'thumbs',
                            schema      => {
                                type => 'boolean',
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
                                                items => {
                                                    properties => {
                                                        copyright => {
                                                            description => 'The copyright holder of the image',
                                                            example     => 'Alan Smithee',
                                                            type        => 'string',
                                                        },
                                                        date => {
                                                            description => 'The date the image was published.',
                                                            example     => '2018-02-04',
                                                            format      => 'date',
                                                            type        => 'string',
                                                        },
                                                        explanation => {
                                                            description => 'The text explanation of the image. This is often much longer than the title.',
                                                            example     =>
                                                              'This image shows the pillars as seen in visible light, capturing the multi-coloured glow of gas clouds, wispy tendrils of dark cosmic dust, and the rust-coloured elephants trunks of the nebula\'s famous pillars.',
                                                            type => 'string',
                                                        },
                                                        hdurl => {
                                                            description => 'The URL of the high resolution image.',
                                                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                                                            type        => 'string',
                                                        },
                                                        title => {
                                                            description => 'The title of the image.',
                                                            example     => 'The Eagle Nebula in Infrared from Hubble',
                                                            type        => 'string',
                                                        },
                                                        url => {
                                                            description => 'The URL of the APOD image or video of the day.',
                                                            example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                                                            type        => 'string',
                                                        },
                                                    },
                                                    type => 'object',
                                                },
                                                type => 'array',
                                            },
                                            {
                                                example => {
                                                    copyright   => 'Tianyao Yang',
                                                    date        => '2023-06-12',
                                                    explanation =>
                                                      "What\x{2019}s that near the Moon? It\x{2019}s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \x{2014} it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.",
                                                    hdurl           => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg',
                                                    media_type      => 'image',
                                                    service_version => 'v1',
                                                    title           => 'The Largest Satellites of Earth',
                                                    url             => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg',
                                                },
                                                properties => {
                                                    copyright => {
                                                        description => 'The copyright holder of the image',
                                                        example     => 'Alan Smithee',
                                                        type        => 'string',
                                                    },
                                                    date => {
                                                        description => 'The date the image was published.',
                                                        example     => '2018-02-04',
                                                        format      => 'date',
                                                        type        => 'string',
                                                    },
                                                    explanation => {
                                                        description => 'The text explanation of the image. This is often much longer than the title.',
                                                        example     =>
                                                          'This image shows the pillars as seen in visible light, capturing the multi-coloured glow of gas clouds, wispy tendrils of dark cosmic dust, and the rust-coloured elephants trunks of the nebula\'s famous pillars.',
                                                        type => 'string',
                                                    },
                                                    hdurl => {
                                                        description => 'The URL of the high resolution image.',
                                                        example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                                                        type        => 'string',
                                                    },
                                                    title => {
                                                        description => 'The title of the image.',
                                                        example     => 'The Eagle Nebula in Infrared from Hubble',
                                                        type        => 'string',
                                                    },
                                                    url => {
                                                        description => 'The URL of the APOD image or video of the day.',
                                                        example     => 'https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg',
                                                        type        => 'string',
                                                    },
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
        },
        servers => [
            {
                description => 'NASA OpenAPI server',
                url         => 'https://api.nasa.gov',
            },
        ],
        tags => [
            { description => 'Earth imagery',                        name => 'earth', },
            { description => 'Landsat 8 satellite imagery of Earth', name => 'landsat-8', },
            { description => 'APIs related to fetching images',      name => 'images', },
            { description => 'APIs related to asteroids',            name => 'asteroids', },
        ],
    };
}
