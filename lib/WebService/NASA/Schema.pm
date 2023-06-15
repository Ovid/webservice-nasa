package WebService::NASA::Schema;

our $VERSION   = '0.1';
our $AUTHORITY = 'cpan:OVID';

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: f12b872cdb818930c0e588744e7391ac

# ABSTRACT: JSON Schema for WebService::NASA

use v5.20.0;
use warnings;

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
                CloseApproachData => {
                    properties => {
                        close_approach_date => {
                            example => '1900-12-18',
                            type    => 'string',
                        },
                        close_approach_date_full => {
                            example => '1900-Dec-18 08:14',
                            type    => 'string',
                        },
                        epoch_date_close_approach => {
                            example => '-2175876600000',
                            type    => 'number',
                        },
                        miss_distance => {
                            properties => {
                                astronomical => {
                                    example => '0.459439927',
                                    type    => 'string',
                                },
                                kilometers => {
                                    example => '68701088',
                                    type    => 'string',
                                },
                                lunar => {
                                    example => '178.7561950684',
                                    type    => 'string',
                                },
                                miles => {
                                    example => '42686992',
                                    type    => 'string',
                                },
                            },
                            type => 'object',
                        },
                        orbiting_body => {
                            example => 'Merc',
                            type    => 'string',
                        },
                        relative_velocity => {
                            properties => {
                                kilometers_per_hour => {
                                    example => '53294.2079999601',
                                    type    => 'string',
                                },
                                kilometers_per_second => {
                                    example => '14.8095021111',
                                    type    => 'string',
                                },
                                miles_per_hour => {
                                    example => '33118.8269999761',
                                    type    => 'string',
                                },
                            },
                            type => 'object',
                        },
                    },
                    type => 'object',
                },
                ClosestApproachData => {
                    properties => {
                        absolute_magnitude_h => {
                            example => '21.6',
                            type    => 'number',
                        },
                        close_approach_data => {
                            items => {
                                '$ref' => '#/components/schemas/CloseApproachData',
                            },
                            type => 'array',
                        },
                        estimated_diameter => {
                            properties => {
                                feet => {
                                    properties => {
                                        estimated_diameter_max => {
                                            example => '851.0432680809',
                                            type    => 'number',
                                        },
                                        estimated_diameter_min => {
                                            example => '380.6596305779',
                                            type    => 'number',
                                        },
                                    },
                                    type => 'object',
                                },
                                kilometers => {
                                    properties => {
                                        estimated_diameter_max => {
                                            example => '0.2595214392',
                                            type    => 'number',
                                        },
                                        estimated_diameter_min => {
                                            example => '0.1160289086',
                                            type    => 'number',
                                        },
                                    },
                                    type => 'object',
                                },
                                meters => {
                                    properties => {
                                        estimated_diameter_max => {
                                            example => '259.5214391852',
                                            type    => 'number',
                                        },
                                        estimated_diameter_min => {
                                            example => '116.0289086489',
                                            type    => 'number',
                                        },
                                    },
                                    type => 'object',
                                },
                                miles => {
                                    properties => {
                                        estimated_diameter_max => {
                                            example => '0.1612313869',
                                            type    => 'number',
                                        },
                                        estimated_diameter_min => {
                                            example => '0.0720791841',
                                            type    => 'number',
                                        },
                                    },
                                    type => 'object',
                                },
                            },
                            type => 'object',
                        },
                        id => {
                            example => 3542519,
                            type    => 'string',
                        },
                        is_potentially_hazardous_asteroid => {
                            example => 1,
                            type    => 'boolean',
                        },
                        links => {
                            properties => {
                                self => {
                                    example => 'https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY',
                                    type    => 'string',
                                },
                            },
                            type => 'object',
                        },
                        name => {
                            example => '(2010 PK9)',
                            type    => 'string',
                        },
                        nasa_jpl_url => {
                            example => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3542519',
                            type    => 'string',
                        },
                        neo_reference_id => {
                            example => 3542519,
                            type    => 'string',
                        },
                        orbital_data => {
                            type => 'object',
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
            description => 'NASA provides free APIs for the public at https://api.nasa.gov/.

Go there, sign up for an API key, and start using this OpenAPI specification.
',
            license => {
                name => 'MIT',
                url  => 'https://opensource.org/license/mit/',
            },
            title   => 'Unofficial NASA OpenAPI Specification',
            version => '1.0.0',
        },
        openapi => '3.0.0',
        paths   => {
            '/neo/rest/v1/feed' => {
                get => {
                    description => 'Retrieve a list of Asteroids based on their closest approach date to Earth.
',
                    parameters => [
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
                                    example => {
                                        element_count => 25,
                                        links         => {
                                            next =>
                                              'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY',
                                            previous =>
                                              'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY',
                                            self =>
                                              'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY',
                                        },
                                        near_earth_objects => {
                                            '2015-09-07' => [
                                                {
                                                    absolute_magnitude_h => '19.61',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 07:32',
                                                            epoch_date_close_approach => '1441611120000',
                                                            miss_distance             => {
                                                                astronomical => '0.4981690972',
                                                                kilometers   => '74525035.840942964',
                                                                lunar        => '193.7877788108',
                                                                miles        => '46307709.9545183432',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '4187.1034988155',
                                                                kilometers_per_second => '1.1630843052',
                                                                miles_per_hour        => '2601.7032823612',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '2333.5925520145',
                                                            estimated_diameter_min => '1043.6143156183',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.7112789871',
                                                            estimated_diameter_min => '0.3180936332',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '711.2789870931',
                                                            estimated_diameter_min => '318.0936332215',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.4419681355',
                                                            estimated_diameter_min => '0.197654159',
                                                        },
                                                    },
                                                    id                                => '2440012',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/2440012?api_key=DEMO_KEY',
                                                    },
                                                    name             => '440012 (2002 LE27)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2440012',
                                                    neo_reference_id => '2440012',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.11',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 20:01',
                                                            epoch_date_close_approach => '1441656060000',
                                                            miss_distance             => {
                                                                astronomical => '0.3213750467',
                                                                kilometers   => '48077022.457470529',
                                                                lunar        => '125.0148931663',
                                                                miles        => '29873676.4942861402',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '31548.7181977204',
                                                                kilometers_per_second => '8.7635328327',
                                                                miles_per_hour        => '19603.1465934669',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '737.9467595171',
                                                            estimated_diameter_min => '330.0198236112',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.2249261651',
                                                            estimated_diameter_min => '0.100590039',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '224.9261651032',
                                                            estimated_diameter_min => '100.5900390178',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.1397625961',
                                                            estimated_diameter_min => '0.0625037331',
                                                        },
                                                    },
                                                    id                                => '3713989',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3713989?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 FC35)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3713989',
                                                    neo_reference_id => '3713989',
                                                },
                                                {
                                                    absolute_magnitude_h => '26.7',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 17:58',
                                                            epoch_date_close_approach => '1441648680000',
                                                            miss_distance             => {
                                                                astronomical => '0.0163786734',
                                                                kilometers   => '2450214.654065658',
                                                                lunar        => '6.3713039526',
                                                                miles        => '1522492.7871077604',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '29113.7972136669',
                                                                kilometers_per_second => '8.0871658927',
                                                                miles_per_hour        => '18090.1813853476',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '89.1302305717',
                                                            estimated_diameter_min => '39.8602508817',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0271668934',
                                                            estimated_diameter_min => '0.0121494041',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '27.1668934089',
                                                            estimated_diameter_min => '12.14940408',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0168807197',
                                                            estimated_diameter_min => '0.0075492874',
                                                        },
                                                    },
                                                    id                                => '3726788',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3726788?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RG2)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726788',
                                                    neo_reference_id => '3726788',
                                                },
                                                {
                                                    absolute_magnitude_h => '26.3',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 03:58',
                                                            epoch_date_close_approach => '1441598280000',
                                                            miss_distance             => {
                                                                astronomical => '0.0692469329',
                                                                kilometers   => '10359193.665872923',
                                                                lunar        => '26.9370568981',
                                                                miles        => '6436904.4607474174',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '12661.0618226584',
                                                                kilometers_per_second => '3.5169616174',
                                                                miles_per_hour        => '7867.0914419735',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '107.1581062656',
                                                            estimated_diameter_min => '47.92256199',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0326617897',
                                                            estimated_diameter_min => '0.0146067964',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '32.6617897446',
                                                            estimated_diameter_min => '14.6067964271',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.020295089',
                                                            estimated_diameter_min => '0.0090762397',
                                                        },
                                                    },
                                                    id                                => '3727036',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727036?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RL35)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727036',
                                                    neo_reference_id => '3727036',
                                                },
                                                {
                                                    absolute_magnitude_h => '23.6',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 11:50',
                                                            epoch_date_close_approach => '1441626600000',
                                                            miss_distance             => {
                                                                astronomical => '0.1093379598',
                                                                kilometers   => '16356725.896225626',
                                                                lunar        => '42.5324663622',
                                                                miles        => '10163598.1796045988',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '26178.3406398515',
                                                                kilometers_per_second => '7.2717612888',
                                                                miles_per_hour        => '16266.2028270233',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '371.5566426699',
                                                            estimated_diameter_min => '166.1651821003',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.1132504611',
                                                            estimated_diameter_min => '0.0506471459',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '113.2504610618',
                                                            estimated_diameter_min => '50.6471458835',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0703705522',
                                                            estimated_diameter_min => '0.0314706677',
                                                        },
                                                    },
                                                    id                                => '3727179',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727179?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RH36)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727179',
                                                    neo_reference_id => '3727179',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.9',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 21:51',
                                                            epoch_date_close_approach => '1441662660000',
                                                            miss_distance             => {
                                                                astronomical => '0.2895816212',
                                                                kilometers   => '43320793.722666844',
                                                                lunar        => '112.6472506468',
                                                                miles        => '26918293.0014326872',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '9700.4054267199',
                                                                kilometers_per_second => '2.694557063',
                                                                miles_per_hour        => '6027.4546941749',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '512.8909429502',
                                                            estimated_diameter_min => '229.3718026961',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.1563291544',
                                                            estimated_diameter_min => '0.0699125232',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '156.3291544087',
                                                            estimated_diameter_min => '69.9125232246',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.097138403',
                                                            estimated_diameter_min => '0.0434416145',
                                                        },
                                                    },
                                                    id                                => '3727662',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727662?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RX83)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727662',
                                                    neo_reference_id => '3727662',
                                                },
                                                {
                                                    absolute_magnitude_h => '24.2',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 16:55',
                                                            epoch_date_close_approach => '1441644900000',
                                                            miss_distance             => {
                                                                astronomical => '0.0764899182',
                                                                kilometers   => '11442728.839194234',
                                                                lunar        => '29.7545781798',
                                                                miles        => '7110181.9971550692',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '25128.8978914704',
                                                                kilometers_per_second => '6.9802494143',
                                                                miles_per_hour        => '15614.1199148417',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '281.8545369825',
                                                            estimated_diameter_min => '126.0491808919',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0859092601',
                                                            estimated_diameter_min => '0.0384197891',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '85.9092601232',
                                                            estimated_diameter_min => '38.4197891064',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0533815229',
                                                            estimated_diameter_min => '0.0238729428',
                                                        },
                                                    },
                                                    id                                => '3727663',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727663?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RY83)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727663',
                                                    neo_reference_id => '3727663',
                                                },
                                                {
                                                    absolute_magnitude_h => '27.5',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 16:34',
                                                            epoch_date_close_approach => '1441643640000',
                                                            miss_distance             => {
                                                                astronomical => '0.2270491427',
                                                                kilometers   => '33966068.133246049',
                                                                lunar        => '88.3221165103',
                                                                miles        => '21105536.0612875162',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '47572.1706482885',
                                                                kilometers_per_second => '13.2144918467',
                                                                miles_per_hour        => '29559.4968119879',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '61.6630539546',
                                                            estimated_diameter_min => '27.5765560686',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0187948982',
                                                            estimated_diameter_min => '0.008405334',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '18.7948982439',
                                                            estimated_diameter_min => '8.4053340207',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0116786047',
                                                            estimated_diameter_min => '0.0052228308',
                                                        },
                                                    },
                                                    id                                => '3759353',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3759353?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2016 RU33)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759353',
                                                    neo_reference_id => '3759353',
                                                },
                                                {
                                                    absolute_magnitude_h => '31.02',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 19:16',
                                                            epoch_date_close_approach => '1441653360000',
                                                            miss_distance             => {
                                                                astronomical => '0.1205320685',
                                                                kilometers   => '18031340.714294095',
                                                                lunar        => '46.8869746465',
                                                                miles        => '11204155.576264711',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '48533.5778505242',
                                                                kilometers_per_second => '13.4815494029',
                                                                miles_per_hour        => '30156.8778593994',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '12.1905985585',
                                                            estimated_diameter_min => '5.4518014126',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0037156943',
                                                            estimated_diameter_min => '0.001661709',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '3.7156943217',
                                                            estimated_diameter_min => '1.6617090174',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0023088247',
                                                            estimated_diameter_min => '0.0010325378',
                                                        },
                                                    },
                                                    id                                => '3759690',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3759690?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2016 RN41)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759690',
                                                    neo_reference_id => '3759690',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.2',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 05:30',
                                                            epoch_date_close_approach => '1441603800000',
                                                            miss_distance             => {
                                                                astronomical => '0.4191352221',
                                                                kilometers   => '62701736.468136927',
                                                                lunar        => '163.0436013969',
                                                                miles        => '38961052.3932945126',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '66647.8557106394',
                                                                kilometers_per_second => '18.513293253',
                                                                miles_per_hour        => '41412.3856775359',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '707.9865871058',
                                                            estimated_diameter_min => '316.6212271853',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.2157943048',
                                                            estimated_diameter_min => '0.096506147',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '215.7943048444',
                                                            estimated_diameter_min => '96.5061469579',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.134088323',
                                                            estimated_diameter_min => '0.059966121',
                                                        },
                                                    },
                                                    id                                => '3827337',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3827337?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2018 RZ2)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3827337',
                                                    neo_reference_id => '3827337',
                                                },
                                                {
                                                    absolute_magnitude_h => '20.8',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 10:04',
                                                            epoch_date_close_approach => '1441620240000',
                                                            miss_distance             => {
                                                                astronomical => '0.3387069263',
                                                                kilometers   => '50669834.728726981',
                                                                lunar        => '131.7569943307',
                                                                miles        => '31484775.3319990978',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '138058.9823592299',
                                                                kilometers_per_second => '38.349717322',
                                                                miles_per_hour        => '85784.4826776004',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '1349.040630575',
                                                            estimated_diameter_min => '603.309310875',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.411187571',
                                                            estimated_diameter_min => '0.1838886721',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '411.1875710413',
                                                            estimated_diameter_min => '183.8886720703',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.2555000322',
                                                            estimated_diameter_min => '0.1142630881',
                                                        },
                                                    },
                                                    id                                => '3843641',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3843641?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2019 QK4)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3843641',
                                                    neo_reference_id => '3843641',
                                                },
                                                {
                                                    absolute_magnitude_h => '24.5',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 05:39',
                                                            epoch_date_close_approach => '1441604340000',
                                                            miss_distance             => {
                                                                astronomical => '0.4067666372',
                                                                kilometers   => '60851422.512182764',
                                                                lunar        => '158.2322218708',
                                                                miles        => '37811320.6148355832',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '97883.7299230601',
                                                                kilometers_per_second => '27.1899249786',
                                                                miles_per_hour        => '60821.1431846925',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '245.4850393757',
                                                            estimated_diameter_min => '109.7842471007',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0748238376',
                                                            estimated_diameter_min => '0.0334622374',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '74.8238376074',
                                                            estimated_diameter_min => '33.4622374455',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0464933628',
                                                            estimated_diameter_min => '0.0207924639',
                                                        },
                                                    },
                                                    id                                => '3986741',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3986741?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2020 BY)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3986741',
                                                    neo_reference_id => '3986741',
                                                },
                                                {
                                                    absolute_magnitude_h => '26.9',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-07',
                                                            close_approach_date_full  => '2015-Sep-07 19:56',
                                                            epoch_date_close_approach => '1441655760000',
                                                            miss_distance             => {
                                                                astronomical => '0.462203352',
                                                                kilometers   => '69144636.96606024',
                                                                lunar        => '179.797103928',
                                                                miles        => '42964485.121061712',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '72279.8474933128',
                                                                kilometers_per_second => '20.0777354148',
                                                                miles_per_hour        => '44911.8863493865',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '81.2877363957',
                                                            estimated_diameter_min => '36.3529808636',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0247765013',
                                                            estimated_diameter_min => '0.0110803882',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '24.7765012606',
                                                            estimated_diameter_min => '11.0803882126',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0153953994',
                                                            estimated_diameter_min => '0.0068850319',
                                                        },
                                                    },
                                                    id                                => '54088823',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/54088823?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2020 WZ)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54088823',
                                                    neo_reference_id => '54088823',
                                                },
                                            ],
                                            '2015-09-08' => [
                                                {
                                                    absolute_magnitude_h => '20.48',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 20:28',
                                                            epoch_date_close_approach => '1441744080000',
                                                            miss_distance             => {
                                                                astronomical => '0.3027469593',
                                                                kilometers   => '45290300.260256691',
                                                                lunar        => '117.7685671677',
                                                                miles        => '28142087.6157806958',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '65260.5717781091',
                                                                kilometers_per_second => '18.127936605',
                                                                miles_per_hour        => '40550.3813917923',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '1563.2377352435',
                                                            estimated_diameter_min => '699.1011681995',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.4764748465',
                                                            estimated_diameter_min => '0.2130860292',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '476.474846455',
                                                            estimated_diameter_min => '213.0860292484',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.2960676518',
                                                            estimated_diameter_min => '0.1324054791',
                                                        },
                                                    },
                                                    id                                => '2465633',
                                                    is_potentially_hazardous_asteroid => 1,
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/2465633?api_key=DEMO_KEY',
                                                    },
                                                    name             => '465633 (2009 JR5)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2465633',
                                                    neo_reference_id => '2465633',
                                                },
                                                {
                                                    absolute_magnitude_h => '21.34',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 14:31',
                                                            epoch_date_close_approach => '1441722660000',
                                                            miss_distance             => {
                                                                astronomical => '0.2591250701',
                                                                kilometers   => '38764558.550560687',
                                                                lunar        => '100.7996522689',
                                                                miles        => '24087179.7459520006',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '71099.3261312856',
                                                                kilometers_per_second => '19.7498128142',
                                                                miles_per_hour        => '44178.3562841869',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '1052.0225040417',
                                                            estimated_diameter_min => '470.4787665793',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.320656449',
                                                            estimated_diameter_min => '0.1434019235',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '320.6564489709',
                                                            estimated_diameter_min => '143.4019234645',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.1992466184',
                                                            estimated_diameter_min => '0.0891057966',
                                                        },
                                                    },
                                                    id                                => '3426410',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3426410?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2008 QV11)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3426410',
                                                    neo_reference_id => '3426410',
                                                },
                                                {
                                                    absolute_magnitude_h => '26.5',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 12:07',
                                                            epoch_date_close_approach => '1441714020000',
                                                            miss_distance             => {
                                                                astronomical => '0.4917435147',
                                                                kilometers   => '73563782.385433689',
                                                                lunar        => '191.2882272183',
                                                                miles        => '45710414.7542113482',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '68950.9255988812',
                                                                kilometers_per_second => '19.1530348886',
                                                                miles_per_hour        => '42843.4237422604',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '97.7293544391',
                                                            estimated_diameter_min => '43.7058959846',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0297879063',
                                                            estimated_diameter_min => '0.0133215567',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '29.7879062798',
                                                            estimated_diameter_min => '13.3215566698',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0185093411',
                                                            estimated_diameter_min => '0.008277629',
                                                        },
                                                    },
                                                    id                                => '3553060',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3553060?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2010 XT10)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3553060',
                                                    neo_reference_id => '3553060',
                                                },
                                                {
                                                    absolute_magnitude_h => '24.3',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 09:45',
                                                            epoch_date_close_approach => '1441705500000',
                                                            miss_distance             => {
                                                                astronomical => '0.0269252677',
                                                                kilometers   => '4027962.697099799',
                                                                lunar        => '10.4739291353',
                                                                miles        => '2502859.9608192662',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '70151.9167909206',
                                                                kilometers_per_second => '19.486643553',
                                                                miles_per_hour        => '43589.6729637806',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '269.1689931548',
                                                            estimated_diameter_min => '120.3760332259',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0820427065',
                                                            estimated_diameter_min => '0.0366906138',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '82.0427064882',
                                                            estimated_diameter_min => '36.6906137531',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0509789586',
                                                            estimated_diameter_min => '0.0227984834',
                                                        },
                                                    },
                                                    id                                => '3726710',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3726710?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RC)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726710',
                                                    neo_reference_id => '3726710',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.9',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 14:36',
                                                            epoch_date_close_approach => '1441722960000',
                                                            miss_distance             => {
                                                                astronomical => '0.0540392535',
                                                                kilometers   => '8084157.219990045',
                                                                lunar        => '21.0212696115',
                                                                miles        => '5023262.364730821',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '56899.294813224',
                                                                kilometers_per_second => '15.8053596703',
                                                                miles_per_hour        => '35355.0090465835',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '512.8909429502',
                                                            estimated_diameter_min => '229.3718026961',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.1563291544',
                                                            estimated_diameter_min => '0.0699125232',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '156.3291544087',
                                                            estimated_diameter_min => '69.9125232246',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.097138403',
                                                            estimated_diameter_min => '0.0434416145',
                                                        },
                                                    },
                                                    id                                => '3727181',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727181?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RO36)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727181',
                                                    neo_reference_id => '3727181',
                                                },
                                                {
                                                    absolute_magnitude_h => '21.7',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 15:42',
                                                            epoch_date_close_approach => '1441726920000',
                                                            miss_distance             => {
                                                                astronomical => '0.1684193589',
                                                                kilometers   => '25195177.358205543',
                                                                lunar        => '65.5151306121',
                                                                miles        => '15655557.2525527734',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '43492.1113096542',
                                                                kilometers_per_second => '12.0811420305',
                                                                miles_per_hour        => '27024.3066079349',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '891.3023057169',
                                                            estimated_diameter_min => '398.6025088171',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.2716689341',
                                                            estimated_diameter_min => '0.1214940408',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '271.6689340891',
                                                            estimated_diameter_min => '121.4940407996',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.1688071972',
                                                            estimated_diameter_min => '0.0754928736',
                                                        },
                                                    },
                                                    id                                => '3727639',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3727639?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 RN83)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727639',
                                                    neo_reference_id => '3727639',
                                                },
                                                {
                                                    absolute_magnitude_h => '23.3',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 14:19',
                                                            epoch_date_close_approach => '1441721940000',
                                                            miss_distance             => {
                                                                astronomical => '0.0795238758',
                                                                kilometers   => '11896602.433824546',
                                                                lunar        => '30.9347876862',
                                                                miles        => '7392205.9712328948',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '23664.2417675863',
                                                                kilometers_per_second => '6.573400491',
                                                                miles_per_hour        => '14704.0395583094',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '426.6041048727',
                                                            estimated_diameter_min => '190.7831555951',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.130028927',
                                                            estimated_diameter_min => '0.058150704',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '130.0289270043',
                                                            estimated_diameter_min => '58.1507039646',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0807962044',
                                                            estimated_diameter_min => '0.0361331611',
                                                        },
                                                    },
                                                    id                                => '3730577',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3730577?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 TX237)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3730577',
                                                    neo_reference_id => '3730577',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.81',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 18:50',
                                                            epoch_date_close_approach => '1441738200000',
                                                            miss_distance             => {
                                                                astronomical => '0.1132399881',
                                                                kilometers   => '16940461.018585347',
                                                                lunar        => '44.0503553709',
                                                                miles        => '10526314.3652659086',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '43040.7362163935',
                                                                kilometers_per_second => '11.9557600601',
                                                                miles_per_hour        => '26743.8396784585',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '534.595169215',
                                                            estimated_diameter_min => '239.0782277615',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.1629446024',
                                                            estimated_diameter_min => '0.0728710415',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '162.9446023625',
                                                            estimated_diameter_min => '72.8710414898',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.1012490505',
                                                            estimated_diameter_min => '0.0452799519',
                                                        },
                                                    },
                                                    id                                => '3731587',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3731587?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2015 UG)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3731587',
                                                    neo_reference_id => '3731587',
                                                },
                                                {
                                                    absolute_magnitude_h => '20.49',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 10:26',
                                                            epoch_date_close_approach => '1441707960000',
                                                            miss_distance             => {
                                                                astronomical => '0.2804752346',
                                                                kilometers   => '41958497.683910302',
                                                                lunar        => '109.1048662594',
                                                                miles        => '26071801.4952820876',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '61046.242250638',
                                                                kilometers_per_second => '16.9572895141',
                                                                miles_per_hour        => '37931.7609140145',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '1556.0553102697',
                                                            estimated_diameter_min => '695.8890901025',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.4742856434',
                                                            estimated_diameter_min => '0.2121069879',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '474.2856433931',
                                                            estimated_diameter_min => '212.1069878758',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.2947073445',
                                                            estimated_diameter_min => '0.1317971312',
                                                        },
                                                    },
                                                    id                                => '3747356',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3747356?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2016 EK158)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3747356',
                                                    neo_reference_id => '3747356',
                                                },
                                                {
                                                    absolute_magnitude_h => '24.4',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 01:02',
                                                            epoch_date_close_approach => '1441674120000',
                                                            miss_distance             => {
                                                                astronomical => '0.170705627',
                                                                kilometers   => '25537198.19621449',
                                                                lunar        => '66.404488903',
                                                                miles        => '15868079.146520362',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '68754.220451069',
                                                                kilometers_per_second => '19.0983945697',
                                                                miles_per_hour        => '42721.1988130545',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '257.0543928497',
                                                            estimated_diameter_min => '114.9582192654',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0783501764',
                                                            estimated_diameter_min => '0.0350392641',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '78.3501764334',
                                                            estimated_diameter_min => '35.0392641108',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0486845275',
                                                            estimated_diameter_min => '0.0217723826',
                                                        },
                                                    },
                                                    id                                => '3758838',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/3758838?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2016 RT)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3758838',
                                                    neo_reference_id => '3758838',
                                                },
                                                {
                                                    absolute_magnitude_h => '22.7',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 00:22',
                                                            epoch_date_close_approach => '1441671720000',
                                                            miss_distance             => {
                                                                astronomical => '0.3949696486',
                                                                kilometers   => '59086618.145208482',
                                                                lunar        => '153.6431933054',
                                                                miles        => '36714722.0311497716',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '33518.4463701775',
                                                                kilometers_per_second => '9.3106795473',
                                                                miles_per_hour        => '20827.0590792917',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '562.3737359442',
                                                            estimated_diameter_min => '251.5011804664',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.1714115092',
                                                            estimated_diameter_min => '0.0766575574',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '171.4115092306',
                                                            estimated_diameter_min => '76.6575573531',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.1065101409',
                                                            estimated_diameter_min => '0.0476327831',
                                                        },
                                                    },
                                                    id                                => '54191333',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/54191333?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2021 QP3)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54191333',
                                                    neo_reference_id => '54191333',
                                                },
                                                {
                                                    absolute_magnitude_h => '27.06',
                                                    close_approach_data  => [
                                                        {
                                                            close_approach_date       => '2015-09-08',
                                                            close_approach_date_full  => '2015-Sep-08 16:40',
                                                            epoch_date_close_approach => '1441730400000',
                                                            miss_distance             => {
                                                                astronomical => '0.4431941124',
                                                                kilometers   => '66300895.211580588',
                                                                lunar        => '172.4025097236',
                                                                miles        => '41197465.9325965944',
                                                            },
                                                            orbiting_body     => 'Earth',
                                                            relative_velocity => {
                                                                kilometers_per_hour   => '18729.435222936',
                                                                kilometers_per_second => '5.2026208953',
                                                                miles_per_hour        => '11637.7426806071',
                                                            },
                                                        },
                                                    ],
                                                    estimated_diameter => {
                                                        feet => {
                                                            estimated_diameter_max => '75.513574769',
                                                            estimated_diameter_min => '33.7706972815',
                                                        },
                                                        kilometers => {
                                                            estimated_diameter_max => '0.0230165369',
                                                            estimated_diameter_min => '0.0102933082',
                                                        },
                                                        meters => {
                                                            estimated_diameter_max => '23.0165368531',
                                                            estimated_diameter_min => '10.293308202',
                                                        },
                                                        miles => {
                                                            estimated_diameter_max => '0.0143018085',
                                                            estimated_diameter_min => '0.0063959632',
                                                        },
                                                    },
                                                    id                                => '54218591',
                                                    is_potentially_hazardous_asteroid => '',
                                                    is_sentry_object                  => '',
                                                    links                             => {
                                                        self => 'http://api.nasa.gov/neo/rest/v1/neo/54218591?api_key=DEMO_KEY',
                                                    },
                                                    name             => '(2021 VC9)',
                                                    nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54218591',
                                                    neo_reference_id => '54218591',
                                                },
                                            ],
                                        },
                                    },
                                    schema => {
                                        properties => {
                                            element_count => {
                                                example => 20,
                                                type    => 'integer',
                                            },
                                            links => {
                                                properties => {
                                                    next => {
                                                        example =>
                                                          'https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY',
                                                        type => 'string',
                                                    },
                                                    prev => {
                                                        example =>
                                                          'https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY',
                                                        type => 'string',
                                                    },
                                                    self => {
                                                        example =>
                                                          'https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY',
                                                        type => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            near_earth_objects => {
                                                type => 'object',
                                            },
                                        },
                                        type => 'object',
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
                        'asteroids',
                    ],
                },
            },
            '/neo/rest/v1/neo/browse' => {
                get => {
                    description => 'Browse the overall Asteroid data-set',
                    parameters  => [
                        {
                            description => 'Page number of query',
                            in          => 'query',
                            name        => 'page',
                            schema      => {
                                minimum => 0,
                                type    => 'integer',
                            },
                        },
                        {
                            description => 'Number of elements per page',
                            in          => 'query',
                            name        => 'size',
                            schema      => {
                                maximum => 1000,
                                minimum => 1,
                                type    => 'integer',
                            },
                        },
                    ],
                    responses => {
                        200 => {
                            content => {
                                'application/json' => {
                                    example => {
                                        links => {
                                            next => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=1&size=2&api_key=DEMO_KEY',
                                            self => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=2&api_key=DEMO_KEY',
                                        },
                                        near_earth_objects => [
                                            {
                                                absolute_magnitude_h => '10.31',
                                                close_approach_data  => [
                                                    {
                                                        close_approach_date       => '1900-12-27',
                                                        close_approach_date_full  => '1900-Dec-27 01:30',
                                                        epoch_date_close_approach => '-2177879400000',
                                                        miss_distance             => {
                                                            astronomical => '0.3149291693',
                                                            kilometers   => '47112732.928149391',
                                                            lunar        => '122.5074468577',
                                                            miles        => '29274494.7651919558',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20083.0290749201',
                                                            kilometers_per_second => '5.5786191875',
                                                            miles_per_hour        => '12478.8132604691',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1907-11-05',
                                                        close_approach_date_full  => '1907-Nov-05 03:31',
                                                        epoch_date_close_approach => '-1961526540000',
                                                        miss_distance             => {
                                                            astronomical => '0.4714855425',
                                                            kilometers   => '70533232.893794475',
                                                            lunar        => '183.4078760325',
                                                            miles        => '43827318.620434755',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15820.1671985367',
                                                            kilometers_per_second => '4.3944908885',
                                                            miles_per_hour        => '9830.0366684463',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1917-04-20',
                                                        close_approach_date_full  => '1917-Apr-20 21:19',
                                                        epoch_date_close_approach => '-1663036860000',
                                                        miss_distance             => {
                                                            astronomical => '0.499257206',
                                                            kilometers   => '74687814.59975122',
                                                            lunar        => '194.211053134',
                                                            miles        => '46408855.985038036',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '17340.4224662258',
                                                            kilometers_per_second => '4.8167840184',
                                                            miles_per_hour        => '10774.6641707501',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1924-03-05',
                                                        close_approach_date_full  => '1924-Mar-05 22:13',
                                                        epoch_date_close_approach => '-1446083220000',
                                                        miss_distance             => {
                                                            astronomical => '0.3597864889',
                                                            kilometers   => '53823292.394218643',
                                                            lunar        => '139.9569441821',
                                                            miles        => '33444243.0636095534',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '16545.797587763',
                                                            kilometers_per_second => '4.5960548855',
                                                            miles_per_hour        => '10280.915173352',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1931-01-30',
                                                        close_approach_date_full  => '1931-Jan-30 04:07',
                                                        epoch_date_close_approach => '-1228247580000',
                                                        miss_distance             => {
                                                            astronomical => '0.1740731458',
                                                            kilometers   => '26040971.835879446',
                                                            lunar        => '67.7144537162',
                                                            miles        => '16181109.5707945148',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21314.9467227704',
                                                            kilometers_per_second => '5.9208185341',
                                                            miles_per_hour        => '13244.2789789347',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1938-01-13',
                                                        close_approach_date_full  => '1938-Jan-13 22:04',
                                                        epoch_date_close_approach => '-1008726960000',
                                                        miss_distance             => {
                                                            astronomical => '0.2150052405',
                                                            kilometers   => '32164326.017637735',
                                                            lunar        => '83.6370385545',
                                                            miles        => '19985985.424901343',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21902.5886564605',
                                                            kilometers_per_second => '6.0840524046',
                                                            miles_per_hour        => '13609.4168237879',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1944-11-27',
                                                        close_approach_date_full  => '1944-Nov-27 01:41',
                                                        epoch_date_close_approach => '-791936340000',
                                                        miss_distance             => {
                                                            astronomical => '0.4030090561',
                                                            kilometers   => '60289296.383270507',
                                                            lunar        => '156.7705228229',
                                                            miles        => '37462031.6350747166',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13053.9550896485',
                                                            kilometers_per_second => '3.626098636',
                                                            miles_per_hour        => '8111.2200388986',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1961-04-04',
                                                        close_approach_date_full  => '1961-Apr-04 09:08',
                                                        epoch_date_close_approach => '-275928720000',
                                                        miss_distance             => {
                                                            astronomical => '0.4424921301',
                                                            kilometers   => '66195880.154722887',
                                                            lunar        => '172.1294386089',
                                                            miles        => '41132212.6021023606',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13348.2112136055',
                                                            kilometers_per_second => '3.7078364482',
                                                            miles_per_hour        => '8294.0593510317',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1968-02-11',
                                                        close_approach_date_full  => '1968-Feb-11 13:46',
                                                        epoch_date_close_approach => '-59566440000',
                                                        miss_distance             => {
                                                            astronomical => '0.2662714057',
                                                            kilometers   => '39833635.134625859',
                                                            lunar        => '103.5795768173',
                                                            miles        => '24751473.1315964942',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21840.7859008821',
                                                            kilometers_per_second => '6.0668849725',
                                                            miles_per_hour        => '13571.014994912',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1975-01-23',
                                                        close_approach_date_full  => '1975-Jan-23 07:39',
                                                        epoch_date_close_approach => '159694740000',
                                                        miss_distance             => {
                                                            astronomical => '0.1511341909',
                                                            kilometers   => '22609353.042813383',
                                                            lunar        => '58.7912002601',
                                                            miles        => '14048800.5292673654',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20971.1076598791',
                                                            kilometers_per_second => '5.8253076833',
                                                            miles_per_hour        => '13030.6307567732',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1981-12-29',
                                                        close_approach_date_full  => '1981-Dec-29 08:05',
                                                        epoch_date_close_approach => '378461100000',
                                                        miss_distance             => {
                                                            astronomical => '0.3084893271',
                                                            kilometers   => '46149346.251893277',
                                                            lunar        => '120.0023482419',
                                                            miles        => '28675874.0429781426',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20394.9786453535',
                                                            kilometers_per_second => '5.6652718459',
                                                            miles_per_hour        => '12672.6465921642',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1988-11-06',
                                                        close_approach_date_full  => '1988-Nov-06 14:56',
                                                        epoch_date_close_approach => '594831360000',
                                                        miss_distance             => {
                                                            astronomical => '0.4676402077',
                                                            kilometers   => '69957978.998277599',
                                                            lunar        => '181.9120407953',
                                                            miles        => '43469872.4247609062',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15501.2476969045',
                                                            kilometers_per_second => '4.305902138',
                                                            miles_per_hour        => '9631.8724925571',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2005-03-08',
                                                        close_approach_date_full  => '2005-Mar-08 22:07',
                                                        epoch_date_close_approach => '1110319620000',
                                                        miss_distance             => {
                                                            astronomical => '0.3655672222',
                                                            kilometers   => '54688077.782936714',
                                                            lunar        => '142.2056494358',
                                                            miles        => '33981595.7867820932',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15884.2526231559',
                                                            kilometers_per_second => '4.4122923953',
                                                            miles_per_hour        => '9869.8568590937',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2012-01-31',
                                                        close_approach_date_full  => '2012-Jan-31 11:01',
                                                        epoch_date_close_approach => '1328007660000',
                                                        miss_distance             => {
                                                            astronomical => '0.1786758136',
                                                            kilometers   => '26729521.135077032',
                                                            lunar        => '69.5048914904',
                                                            miles        => '16608954.2658937616',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21402.705247412',
                                                            kilometers_per_second => '5.9451959021',
                                                            miles_per_hour        => '13298.8087133156',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2019-01-15',
                                                        close_approach_date_full  => '2019-Jan-15 06:01',
                                                        epoch_date_close_approach => '1547532060000',
                                                        miss_distance             => {
                                                            astronomical => '0.2085986871',
                                                            kilometers   => '31205919.274956477',
                                                            lunar        => '81.1448892819',
                                                            miles        => '19390459.0899223026',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21761.7034264303',
                                                            kilometers_per_second => '6.0449176185',
                                                            miles_per_hour        => '13521.8762207172',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2025-11-30',
                                                        close_approach_date_full  => '2025-Nov-30 02:18',
                                                        epoch_date_close_approach => '1764469080000',
                                                        miss_distance             => {
                                                            astronomical => '0.3976474744',
                                                            kilometers   => '59487215.181119528',
                                                            lunar        => '154.6848675416',
                                                            miles        => '36963641.4867163664',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13423.8631236067',
                                                            kilometers_per_second => '3.7288508677',
                                                            miles_per_hour        => '8341.0665058878',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2042-04-06',
                                                        close_approach_date_full  => '2042-Apr-06 19:02',
                                                        epoch_date_close_approach => '2280423720000',
                                                        miss_distance             => {
                                                            astronomical => '0.4461417254',
                                                            kilometers   => '66741851.837964898',
                                                            lunar        => '173.5491311806',
                                                            miles        => '41471463.6747876724',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13410.8089939193',
                                                            kilometers_per_second => '3.7252247205',
                                                            miles_per_hour        => '8332.9551773606',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2049-02-12',
                                                        close_approach_date_full  => '2049-Feb-12 05:38',
                                                        epoch_date_close_approach => '2496721080000',
                                                        miss_distance             => {
                                                            astronomical => '0.2725553389',
                                                            kilometers   => '40773698.156568143',
                                                            lunar        => '106.0240268321',
                                                            miles        => '25335601.2070526534',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21812.6325080767',
                                                            kilometers_per_second => '6.0590645856',
                                                            miles_per_hour        => '13553.5215714769',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2056-01-24',
                                                        close_approach_date_full  => '2056-Jan-24 11:03',
                                                        epoch_date_close_approach => '2715937380000',
                                                        miss_distance             => {
                                                            astronomical => '0.1497821765',
                                                            kilometers   => '22407094.568364055',
                                                            lunar        => '58.2652666585',
                                                            miles        => '13923122.940991759',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20954.7282866821',
                                                            kilometers_per_second => '5.8207578574',
                                                            miles_per_hour        => '13020.4532512442',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2062-12-31',
                                                        close_approach_date_full  => '2062-Dec-31 08:25',
                                                        epoch_date_close_approach => '2934779100000',
                                                        miss_distance             => {
                                                            astronomical => '0.3029535232',
                                                            kilometers   => '45321201.779715584',
                                                            lunar        => '117.8489205248',
                                                            miles        => '28161288.9295956992',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20636.0765370681',
                                                            kilometers_per_second => '5.7322434825',
                                                            miles_per_hour        => '12822.4554460466',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2069-11-08',
                                                        close_approach_date_full  => '2069-Nov-08 21:29',
                                                        epoch_date_close_approach => '3151171740000',
                                                        miss_distance             => {
                                                            astronomical => '0.4647282185',
                                                            kilometers   => '69522351.616494595',
                                                            lunar        => '180.7792769965',
                                                            miles        => '43199186.121611611',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15283.5036662481',
                                                            kilometers_per_second => '4.2454176851',
                                                            miles_per_hour        => '9496.5748197307',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2086-03-11',
                                                        close_approach_date_full  => '2086-Mar-11 22:55',
                                                        epoch_date_close_approach => '3666725700000',
                                                        miss_distance             => {
                                                            astronomical => '0.3713100271',
                                                            kilometers   => '55547189.163802277',
                                                            lunar        => '144.4396005419',
                                                            miles        => '34515422.8449623426',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15213.1117567663',
                                                            kilometers_per_second => '4.2258643769',
                                                            miles_per_hour        => '9452.8360246418',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2093-01-31',
                                                        close_approach_date_full  => '2093-Jan-31 15:47',
                                                        epoch_date_close_approach => '3884255220000',
                                                        miss_distance             => {
                                                            astronomical => '0.1824638842',
                                                            kilometers   => '27296208.428246654',
                                                            lunar        => '70.9784509538',
                                                            miles        => '16961077.4217016652',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21509.6890394877',
                                                            kilometers_per_second => '5.9749136221',
                                                            miles_per_hour        => '13365.2842812306',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2100-01-16',
                                                        close_approach_date_full  => '2100-Jan-16 11:39',
                                                        epoch_date_close_approach => '4103782740000',
                                                        miss_distance             => {
                                                            astronomical => '0.2038791175',
                                                            kilometers   => '30499881.715479725',
                                                            lunar        => '79.3089767075',
                                                            miles        => '18951747.693781205',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21653.7107877231',
                                                            kilometers_per_second => '6.0149196633',
                                                            miles_per_hour        => '13454.7737947383',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2106-12-04',
                                                        close_approach_date_full  => '2106-Dec-04 02:22',
                                                        epoch_date_close_approach => '4320872520000',
                                                        miss_distance             => {
                                                            astronomical => '0.3922912542',
                                                            kilometers   => '58685936.047948554',
                                                            lunar        => '152.6012978838',
                                                            miles        => '36465749.7209118852',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13870.9098509079',
                                                            kilometers_per_second => '3.8530305141',
                                                            miles_per_hour        => '8618.8439570822',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2123-04-10',
                                                        close_approach_date_full  => '2123-Apr-10 05:51',
                                                        epoch_date_close_approach => '4836779460000',
                                                        miss_distance             => {
                                                            astronomical => '0.4497028378',
                                                            kilometers   => '67274586.667835486',
                                                            lunar        => '174.9344039042',
                                                            miles        => '41802489.7481862668',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13513.4075714592',
                                                            kilometers_per_second => '3.7537243254',
                                                            miles_per_hour        => '8396.7059434992',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2130-02-14',
                                                        close_approach_date_full  => '2130-Feb-14 22:11',
                                                        epoch_date_close_approach => '5053011060000',
                                                        miss_distance             => {
                                                            astronomical => '0.2781645724',
                                                            kilometers   => '41612827.540500788',
                                                            lunar        => '108.2060186636',
                                                            miles        => '25857012.0280873544',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21737.4657416866',
                                                            kilometers_per_second => '6.0381849282',
                                                            miles_per_hour        => '13506.8158659941',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2137-01-25',
                                                        close_approach_date_full  => '2137-Jan-25 14:12',
                                                        epoch_date_close_approach => '5272179120000',
                                                        miss_distance             => {
                                                            astronomical => '0.1494623094',
                                                            kilometers   => '22359243.131520978',
                                                            lunar        => '58.1408383566',
                                                            miles        => '13893389.4368983764',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20931.393493074',
                                                            kilometers_per_second => '5.8142759703',
                                                            miles_per_hour        => '13005.9539179604',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2144-01-03',
                                                        close_approach_date_full  => '2144-Jan-03 10:26',
                                                        epoch_date_close_approach => '5491103160000',
                                                        miss_distance             => {
                                                            astronomical => '0.296580393',
                                                            kilometers   => '44367795.07656291',
                                                            lunar        => '115.369772877',
                                                            miles        => '27568869.475111758',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '20859.6738502169',
                                                            kilometers_per_second => '5.7943538473',
                                                            miles_per_hour        => '12961.3901209861',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2150-11-12',
                                                        close_approach_date_full  => '2150-Nov-12 07:12',
                                                        epoch_date_close_approach => '5707523520000',
                                                        miss_distance             => {
                                                            astronomical => '0.4609447583',
                                                            kilometers   => '68956354.029344821',
                                                            lunar        => '179.3075109787',
                                                            miles        => '42847491.5292516898',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15028.2129289863',
                                                            kilometers_per_second => '4.1745035914',
                                                            miles_per_hour        => '9337.9470835693',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2167-03-16',
                                                        close_approach_date_full  => '2167-Mar-16 05:30',
                                                        epoch_date_close_approach => '6223152600000',
                                                        miss_distance             => {
                                                            astronomical => '0.3774337428',
                                                            kilometers   => '56463283.989007836',
                                                            lunar        => '146.8217259492',
                                                            miles        => '35084657.7735706968',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '14494.512963503',
                                                            kilometers_per_second => '4.026253601',
                                                            miles_per_hour        => '9006.3266800166',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2174-02-03',
                                                        close_approach_date_full  => '2174-Feb-03 01:30',
                                                        epoch_date_close_approach => '6440520600000',
                                                        miss_distance             => {
                                                            astronomical => '0.1884002692',
                                                            kilometers   => '28184278.979746604',
                                                            lunar        => '73.2877047188',
                                                            miles        => '17512898.8741029752',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21619.9554168322',
                                                            kilometers_per_second => '6.0055431713',
                                                            miles_per_hour        => '13433.7995199755',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2181-01-17',
                                                        close_approach_date_full  => '2181-Jan-17 20:55',
                                                        epoch_date_close_approach => '6660046500000',
                                                        miss_distance             => {
                                                            astronomical => '0.1980108125',
                                                            kilometers   => '29621995.786969375',
                                                            lunar        => '77.0262060625',
                                                            miles        => '18406254.672652375',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '21563.4201458554',
                                                            kilometers_per_second => '5.9898389294',
                                                            miles_per_hour        => '13398.6707011844',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2187-12-06',
                                                        close_approach_date_full  => '2187-Dec-06 23:28',
                                                        epoch_date_close_approach => '6877265280000',
                                                        miss_distance             => {
                                                            astronomical => '0.3873137309',
                                                            kilometers   => '57941309.164393183',
                                                            lunar        => '150.6650413201',
                                                            miles        => '36003060.0306766054',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '14340.1754211404',
                                                            kilometers_per_second => '3.9833820614',
                                                            miles_per_hour        => '8910.4273332081',
                                                        },
                                                    },
                                                ],
                                                designation        => '433',
                                                estimated_diameter => {
                                                    feet => {
                                                        estimated_diameter_max => '169053.836084245',
                                                        estimated_diameter_min => '75603.1738682955',
                                                    },
                                                    kilometers => {
                                                        estimated_diameter_max => '51.5276075896',
                                                        estimated_diameter_min => '23.0438466577',
                                                    },
                                                    meters => {
                                                        estimated_diameter_max => '51527.6075895943',
                                                        estimated_diameter_min => '23043.8466576534',
                                                    },
                                                    miles => {
                                                        estimated_diameter_max => '32.0177610556',
                                                        estimated_diameter_min => '14.3187780415',
                                                    },
                                                },
                                                id                                => '2000433',
                                                is_potentially_hazardous_asteroid => '',
                                                is_sentry_object                  => '',
                                                links                             => {
                                                    self => 'http://api.nasa.gov/neo/rest/v1/neo/2000433?api_key=DEMO_KEY',
                                                },
                                                name             => '433 Eros (A898 PA)',
                                                name_limited     => 'Eros',
                                                nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000433',
                                                neo_reference_id => '2000433',
                                                orbital_data     => {
                                                    aphelion_distance           => '1.782973900121676',
                                                    ascending_node_longitude    => '304.2870401191066',
                                                    data_arc_in_days            => 46582,
                                                    eccentricity                => '.2227818894620597',
                                                    epoch_osculation            => '2460000.5',
                                                    equinox                     => 'J2000',
                                                    first_observation_date      => '1893-10-29',
                                                    inclination                 => '10.82782330218545',
                                                    jupiter_tisserand_invariant => '4.582',
                                                    last_observation_date       => '2021-05-13',
                                                    mean_anomaly                => '110.7776526746434',
                                                    mean_motion                 => '.5597706088868498',
                                                    minimum_orbit_intersection  => '.148662',
                                                    observations_used           => 9130,
                                                    orbit_class                 => {
                                                        orbit_class_description => 'Near-Earth asteroid orbits similar to that of 1221 Amor',
                                                        orbit_class_range       => '1.017 AU < q (perihelion) < 1.3 AU',
                                                        orbit_class_type        => 'AMO',
                                                    },
                                                    orbit_determination_date => '2021-05-24 17:55:05',
                                                    orbit_id                 => '659',
                                                    orbit_uncertainty        => '0',
                                                    orbital_period           => '643.1205824040848',
                                                    perihelion_argument      => '178.9269951795186',
                                                    perihelion_distance      => '1.133284372081002',
                                                    perihelion_time          => '2459802.601698595905',
                                                    semi_major_axis          => '1.458129136101339',
                                                },
                                            },
                                            {
                                                absolute_magnitude_h => '15.59',
                                                close_approach_data  => [
                                                    {
                                                        close_approach_date       => '1909-08-21',
                                                        close_approach_date_full  => '1909-Aug-21 15:04',
                                                        epoch_date_close_approach => '-1904892960000',
                                                        miss_distance             => {
                                                            astronomical => '1.7087741683',
                                                            kilometers   => '255628975.888701521',
                                                            lunar        => '664.7131514687',
                                                            miles        => '158840480.0863061498',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '12405.7044543097',
                                                            kilometers_per_second => '3.4460290151',
                                                            miles_per_hour        => '7708.4223038459',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1911-09-08',
                                                        close_approach_date_full  => '1911-Sep-08 08:15',
                                                        epoch_date_close_approach => '-1840290300000',
                                                        miss_distance             => {
                                                            astronomical => '0.2054817435',
                                                            kilometers   => '30739631.151486345',
                                                            lunar        => '79.9323982215',
                                                            miles        => '19100721.085327761',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '25865.4349107149',
                                                            kilometers_per_second => '7.1848430308',
                                                            miles_per_hour        => '16071.7753754939',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1941-09-08',
                                                        close_approach_date_full  => '1941-Sep-08 16:50',
                                                        epoch_date_close_approach => '-893488200000',
                                                        miss_distance             => {
                                                            astronomical => '0.2056683545',
                                                            kilometers   => '30767547.759604915',
                                                            lunar        => '80.0049899005',
                                                            miles        => '19118067.661241227',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '26314.5798352299',
                                                            kilometers_per_second => '7.3096055098',
                                                            miles_per_hour        => '16350.8565648405',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1956-09-12',
                                                        close_approach_date_full  => '1956-Sep-12 20:20',
                                                        epoch_date_close_approach => '-419744400000',
                                                        miss_distance             => {
                                                            astronomical => '1.4171297569',
                                                            kilometers   => '211999593.145857803',
                                                            lunar        => '551.2634754341',
                                                            miles        => '131730438.7592235614',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '11748.4582554323',
                                                            kilometers_per_second => '3.2634606265',
                                                            miles_per_hour        => '7300.0350754379',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '1971-09-06',
                                                        close_approach_date_full  => '1971-Sep-06 04:03',
                                                        epoch_date_close_approach => '52977780000',
                                                        miss_distance             => {
                                                            astronomical => '0.3147502333',
                                                            kilometers   => '47085964.483683071',
                                                            lunar        => '122.4378407537',
                                                            miles        => '29257861.6250895398',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '27596.0371152368',
                                                            kilometers_per_second => '7.6655658653',
                                                            miles_per_hour        => '17147.104284187',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2001-09-05',
                                                        close_approach_date_full  => '2001-Sep-05 00:40',
                                                        epoch_date_close_approach => '999650400000',
                                                        miss_distance             => {
                                                            astronomical => '0.2846489809',
                                                            kilometers   => '42582881.240310683',
                                                            lunar        => '110.7284535701',
                                                            miles        => '26459775.4466381054',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '27551.5977911354',
                                                            kilometers_per_second => '7.6532216086',
                                                            miles_per_hour        => '17119.4914163863',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2003-10-26',
                                                        close_approach_date_full  => '2003-Oct-26 03:46',
                                                        epoch_date_close_approach => '1067139960000',
                                                        miss_distance             => {
                                                            astronomical => '1.4865987524',
                                                            kilometers   => '222392006.903697388',
                                                            lunar        => '578.2869146836',
                                                            miles        => '138187985.2279364344',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13406.8625452769',
                                                            kilometers_per_second => '3.7241284848',
                                                            miles_per_hour        => '8330.5030076472',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2048-09-19',
                                                        close_approach_date_full  => '2048-Sep-19 10:28',
                                                        epoch_date_close_approach => '2484124080000',
                                                        miss_distance             => {
                                                            astronomical => '0.4256632516',
                                                            kilometers   => '63678315.776634092',
                                                            lunar        => '165.5830048724',
                                                            miles        => '39567870.6370587896',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '46942.0120478077',
                                                            kilometers_per_second => '13.0394477911',
                                                            miles_per_hour        => '29167.940763817',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2050-11-15',
                                                        close_approach_date_full  => '2050-Nov-15 11:59',
                                                        epoch_date_close_approach => '2552126340000',
                                                        miss_distance             => {
                                                            astronomical => '1.9591584297',
                                                            kilometers   => '293085928.075664739',
                                                            lunar        => '762.1126291533',
                                                            miles        => '182115150.9144578382',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '18017.4339623463',
                                                            kilometers_per_second => '5.0048427673',
                                                            miles_per_hour        => '11195.3327862146',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2063-10-10',
                                                        close_approach_date_full  => '2063-Oct-10 19:16',
                                                        epoch_date_close_approach => '2959269360000',
                                                        miss_distance             => {
                                                            astronomical => '1.563825951',
                                                            kilometers   => '233945031.32032437',
                                                            lunar        => '608.328294939',
                                                            miles        => '145366701.718921506',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '12298.8414475462',
                                                            kilometers_per_second => '3.4163448465',
                                                            miles_per_hour        => '7642.0217872267',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2078-09-10',
                                                        close_approach_date_full  => '2078-Sep-10 05:26',
                                                        epoch_date_close_approach => '3430013160000',
                                                        miss_distance             => {
                                                            astronomical => '0.2134595996',
                                                            kilometers   => '31933101.431212852',
                                                            lunar        => '83.0357842444',
                                                            miles        => '19842309.1292552776',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '27080.1163785251',
                                                            kilometers_per_second => '7.5222545496',
                                                            miles_per_hour        => '16826.5312019786',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2108-09-07',
                                                        close_approach_date_full  => '2108-Sep-07 18:36',
                                                        epoch_date_close_approach => '4376486160000',
                                                        miss_distance             => {
                                                            astronomical => '0.2568612457',
                                                            kilometers   => '38425895.242266659',
                                                            lunar        => '99.9190245773',
                                                            miles        => '23876744.1242075342',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '28147.2800874542',
                                                            kilometers_per_second => '7.8186889132',
                                                            miles_per_hour        => '17489.6252298962',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2110-11-08',
                                                        close_approach_date_full  => '2110-Nov-08 03:30',
                                                        epoch_date_close_approach => '4444860600000',
                                                        miss_distance             => {
                                                            astronomical => '1.3899546635',
                                                            kilometers   => '207934257.056166745',
                                                            lunar        => '540.6923641015',
                                                            miles        => '129204356.049101281',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '12481.2049027845',
                                                            kilometers_per_second => '3.4670013619',
                                                            miles_per_hour        => '7755.3353463996',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2138-09-08',
                                                        close_approach_date_full  => '2138-Sep-08 23:41',
                                                        epoch_date_close_approach => '5323275660000',
                                                        miss_distance             => {
                                                            astronomical => '0.367762384',
                                                            kilometers   => '55016469.31252208',
                                                            lunar        => '143.059567376',
                                                            miles        => '34185648.821201504',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '30982.3940994637',
                                                            kilometers_per_second => '8.6062205832',
                                                            miles_per_hour        => '19251.2548225251',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2157-12-03',
                                                        close_approach_date_full  => '2157-Dec-03 17:48',
                                                        epoch_date_close_approach => '5930300880000',
                                                        miss_distance             => {
                                                            astronomical => '1.6444271204',
                                                            kilometers   => '246002794.582073548',
                                                            lunar        => '639.6821498356',
                                                            miles        => '152859048.3850410424',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '15284.991269407',
                                                            kilometers_per_second => '4.2458309082',
                                                            miles_per_hour        => '9497.4991584824',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2170-11-10',
                                                        close_approach_date_full  => '2170-Nov-10 05:57',
                                                        epoch_date_close_approach => '6338498220000',
                                                        miss_distance             => {
                                                            astronomical => '1.8228425235',
                                                            kilometers   => '272693358.861024945',
                                                            lunar        => '709.0857416415',
                                                            miles        => '169443795.983016441',
                                                        },
                                                        orbiting_body     => 'Juptr',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '13510.0676557181',
                                                            kilometers_per_second => '3.752796571',
                                                            miles_per_hour        => '8394.6306497433',
                                                        },
                                                    },
                                                    {
                                                        close_approach_date       => '2185-09-13',
                                                        close_approach_date_full  => '2185-Sep-13 19:01',
                                                        epoch_date_close_approach => '6806919660000',
                                                        miss_distance             => {
                                                            astronomical => '0.2200717468',
                                                            kilometers   => '32922264.568459316',
                                                            lunar        => '85.6079095052',
                                                            miles        => '20456946.6016219208',
                                                        },
                                                        orbiting_body     => 'Earth',
                                                        relative_velocity => {
                                                            kilometers_per_hour   => '29942.5501628245',
                                                            kilometers_per_second => '8.3173750452',
                                                            miles_per_hour        => '18605.1362386728',
                                                        },
                                                    },
                                                ],
                                                designation        => '719',
                                                estimated_diameter => {
                                                    feet => {
                                                        estimated_diameter_max => '14860.2128474689',
                                                        estimated_diameter_min => '6645.6892174112',
                                                    },
                                                    kilometers => {
                                                        estimated_diameter_max => '4.529392731',
                                                        estimated_diameter_min => '2.0256060086',
                                                    },
                                                    meters => {
                                                        estimated_diameter_max => '4529.3927309679',
                                                        estimated_diameter_min => '2025.6060086475',
                                                    },
                                                    miles => {
                                                        estimated_diameter_max => '2.8144332906',
                                                        estimated_diameter_min => '1.2586528312',
                                                    },
                                                },
                                                id                                => '2000719',
                                                is_potentially_hazardous_asteroid => '',
                                                is_sentry_object                  => '',
                                                links                             => {
                                                    self => 'http://api.nasa.gov/neo/rest/v1/neo/2000719?api_key=DEMO_KEY',
                                                },
                                                name             => '719 Albert (A911 TB)',
                                                name_limited     => 'Albert',
                                                nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000719',
                                                neo_reference_id => '2000719',
                                                orbital_data     => {
                                                    aphelion_distance           => '4.079828796226027',
                                                    ascending_node_longitude    => '183.8569896093903',
                                                    data_arc_in_days            => 40483,
                                                    eccentricity                => '.5470449589266008',
                                                    epoch_osculation            => '2460000.5',
                                                    equinox                     => 'J2000',
                                                    first_observation_date      => '1911-10-04',
                                                    inclination                 => '11.57600929611851',
                                                    jupiter_tisserand_invariant => '3.141',
                                                    last_observation_date       => '2022-08-05',
                                                    mean_anomaly                => '10.23596428095426',
                                                    mean_motion                 => '.2301418330768929',
                                                    minimum_orbit_intersection  => '.200008',
                                                    observations_used           => 2035,
                                                    orbit_class                 => {
                                                        orbit_class_description => 'Near-Earth asteroid orbits similar to that of 1221 Amor',
                                                        orbit_class_range       => '1.017 AU < q (perihelion) < 1.3 AU',
                                                        orbit_class_type        => 'AMO',
                                                    },
                                                    orbit_determination_date => '2023-03-01 06:08:09',
                                                    orbit_id                 => '257',
                                                    orbit_uncertainty        => '0',
                                                    orbital_period           => '1564.252770506612',
                                                    perihelion_argument      => '156.2503681890173',
                                                    perihelion_distance      => '1.194521858788897',
                                                    perihelion_time          => '2459956.023234763085',
                                                    semi_major_axis          => '2.637175327507462',
                                                },
                                            },
                                        ],
                                        page => {
                                            number         => 0,
                                            size           => 2,
                                            total_elements => 32803,
                                            total_pages    => 1641,
                                        },
                                    },
                                    schema => {
                                        properties => {
                                            links => {
                                                properties => {
                                                    next => {
                                                        example => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=2&size=20&api_key=DEMO_KEY',
                                                        type    => 'string',
                                                    },
                                                    prev => {
                                                        example => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=20&api_key=DEMO_KEY',
                                                        type    => 'string',
                                                    },
                                                    self => {
                                                        example => 1,
                                                        type    => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            near_earth_objects => {
                                                items => {
                                                    type => 'object',
                                                },
                                                type => 'array',
                                            },
                                            page => {
                                                properties => {
                                                    number => {
                                                        example => 1,
                                                        type    => 'integer',
                                                    },
                                                    size => {
                                                        example => 20,
                                                        type    => 'integer',
                                                    },
                                                    total_elements => {
                                                        example => 32803,
                                                        type    => 'integer',
                                                    },
                                                    total_pages => {
                                                        example => 1641,
                                                        type    => 'integer',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                        },
                                        type => 'object',
                                    },
                                },
                            },
                            description => 'successful operation',
                        },
                        400 => {
                            description => 'Bad request',
                        },
                    },
                    tags => [
                        'asteroids',
                    ],
                },
            },
            '/neo/rest/v1/neo/{asteroidId}/' => {
                get => {
                    description => 'Lookup a specific Asteroid based on its NASA JPL small body (SPK-ID) ID',
                    parameters  => [
                        {
                            description => 'Asteroid SPK-ID correlates to the NASA JPL small body',
                            in          => 'path',
                            name        => 'asteroidId',
                            required    => 1,
                            schema      => {
                                type => 'string',
                            },
                        },
                    ],
                    responses => {
                        200 => {
                            content => {
                                'application/json' => {
                                    example => {
                                        absolute_magnitude_h => '21.87',
                                        close_approach_data  => [
                                            {
                                                close_approach_date       => '1900-06-01',
                                                close_approach_date_full  => '1900-Jun-01 16:40',
                                                epoch_date_close_approach => '-2195882400000',
                                                miss_distance             => {
                                                    astronomical => '0.0445442688',
                                                    kilometers   => '6663727.733187456',
                                                    lunar        => '17.3277205632',
                                                    miles        => '4140648.4089846528',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111371.6150741711',
                                                    kilometers_per_second => '30.9365597428',
                                                    miles_per_hour        => '69201.9904887259',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1900-07-07',
                                                close_approach_date_full  => '1900-Jul-07 22:08',
                                                epoch_date_close_approach => '-2192752320000',
                                                miss_distance             => {
                                                    astronomical => '0.1416631157',
                                                    kilometers   => '21192500.366283559',
                                                    lunar        => '55.1069520073',
                                                    miles        => '13168409.1003647542',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '114401.3274004396',
                                                    kilometers_per_second => '31.7781465001',
                                                    miles_per_hour        => '71084.5359061231',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1900-07-27',
                                                close_approach_date_full  => '1900-Jul-27 20:47',
                                                epoch_date_close_approach => '-2191029180000',
                                                miss_distance             => {
                                                    astronomical => '0.2177280037',
                                                    kilometers   => '32571645.592872119',
                                                    lunar        => '84.6961934393',
                                                    miles        => '20239082.0727044822',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '85912.2885290242',
                                                    kilometers_per_second => '23.8645245914',
                                                    miles_per_hour        => '53382.5550584928',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1902-02-11',
                                                close_approach_date_full  => '1902-Feb-11 06:38',
                                                epoch_date_close_approach => '-2142350520000',
                                                miss_distance             => {
                                                    astronomical => '0.0869542779',
                                                    kilometers   => '13008174.761228073',
                                                    lunar        => '33.8252141031',
                                                    miles        => '8082904.9873424874',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101395.5032664968',
                                                    kilometers_per_second => '28.165417574',
                                                    miles_per_hour        => '63003.2225713408',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1903-09-02',
                                                close_approach_date_full  => '1903-Sep-02 16:25',
                                                epoch_date_close_approach => '-2093240100000',
                                                miss_distance             => {
                                                    astronomical => '0.1920513206',
                                                    kilometers   => '28730468.492447122',
                                                    lunar        => '74.7079637134',
                                                    miles        => '17852285.2997374036',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '74541.3451500834',
                                                    kilometers_per_second => '20.7059292084',
                                                    miles_per_hour        => '46317.0930461727',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1904-07-26',
                                                close_approach_date_full  => '1904-Jul-26 08:05',
                                                epoch_date_close_approach => '-2064930900000',
                                                miss_distance             => {
                                                    astronomical => '0.0426656551',
                                                    kilometers   => '6382691.125114637',
                                                    lunar        => '16.5969398339',
                                                    miles        => '3966020.3583385106',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '57054.4261586543',
                                                    kilometers_per_second => '15.8484517107',
                                                    miles_per_hour        => '35451.4016317483',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1907-04-13',
                                                close_approach_date_full  => '1907-Apr-13 18:18',
                                                epoch_date_close_approach => '-1979271720000',
                                                miss_distance             => {
                                                    astronomical => '0.1169638142',
                                                    kilometers   => '17497537.471395754',
                                                    lunar        => '45.4989237238',
                                                    miles        => '10872465.6217952452',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '109423.1716115918',
                                                    kilometers_per_second => '30.3953254477',
                                                    miles_per_hour        => '67991.3034938805',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1907-08-23',
                                                close_approach_date_full  => '1907-Aug-23 15:07',
                                                epoch_date_close_approach => '-1967878380000',
                                                miss_distance             => {
                                                    astronomical => '0.444181105',
                                                    kilometers   => '66448547.20224635',
                                                    lunar        => '172.786449845',
                                                    miles        => '41289212.62524563',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '110599.6254088219',
                                                    kilometers_per_second => '30.7221181691',
                                                    miles_per_hour        => '68722.3061324983',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1908-08-17',
                                                close_approach_date_full  => '1908-Aug-17 14:30',
                                                epoch_date_close_approach => '-1936776600000',
                                                miss_distance             => {
                                                    astronomical => '0.1463952026',
                                                    kilometers   => '21900410.487178462',
                                                    lunar        => '56.9477338114',
                                                    miles        => '13608284.0522162956',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51581.7479650468',
                                                    kilometers_per_second => '14.3282633236',
                                                    miles_per_hour        => '32050.8922286147',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1909-07-31',
                                                close_approach_date_full  => '1909-Jul-31 06:55',
                                                epoch_date_close_approach => '-1906736700000',
                                                miss_distance             => {
                                                    astronomical => '0.3030546234',
                                                    kilometers   => '45336326.154292158',
                                                    lunar        => '117.8882485026',
                                                    miles        => '28170686.7801734604',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '96715.5249125574',
                                                    kilometers_per_second => '26.8654235868',
                                                    miles_per_hour        => '60095.266021361',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1912-09-02',
                                                close_approach_date_full  => '1912-Sep-02 17:01',
                                                epoch_date_close_approach => '-1809154740000',
                                                miss_distance             => {
                                                    astronomical => '0.1426727545',
                                                    kilometers   => '21343540.180232915',
                                                    lunar        => '55.4997015005',
                                                    miles        => '13262260.888787627',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '65396.26938254',
                                                    kilometers_per_second => '18.165630384',
                                                    miles_per_hour        => '40634.6986060566',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1913-07-24',
                                                close_approach_date_full  => '1913-Jul-24 19:43',
                                                epoch_date_close_approach => '-1781065020000',
                                                miss_distance             => {
                                                    astronomical => '0.0341641274',
                                                    kilometers   => '5110880.689448638',
                                                    lunar        => '13.2898455586',
                                                    miles        => '3175753.9987536844',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '63603.5962241934',
                                                    kilometers_per_second => '17.6676656178',
                                                    miles_per_hour        => '39520.8012205273',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1914-01-17',
                                                close_approach_date_full  => '1914-Jan-17 12:19',
                                                epoch_date_close_approach => '-1765798860000',
                                                miss_distance             => {
                                                    astronomical => '0.0904483787',
                                                    kilometers   => '13530884.798473369',
                                                    lunar        => '35.1844193143',
                                                    miles        => '8407701.9434517322',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '103696.7133548884',
                                                    kilometers_per_second => '28.8046425986',
                                                    miles_per_hour        => '64433.1050287638',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1915-09-12',
                                                close_approach_date_full  => '1915-Sep-12 10:16',
                                                epoch_date_close_approach => '-1713707040000',
                                                miss_distance             => {
                                                    astronomical => '0.0884675943',
                                                    kilometers   => '13234563.671304141',
                                                    lunar        => '34.4138941827',
                                                    miles        => '8223576.5330375058',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '91467.2267655487',
                                                    kilometers_per_second => '25.4075629904',
                                                    miles_per_hour        => '56834.1776532933',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1916-08-26',
                                                close_approach_date_full  => '1916-Aug-26 18:08',
                                                epoch_date_close_approach => '-1683525120000',
                                                miss_distance             => {
                                                    astronomical => '0.3610820857',
                                                    kilometers   => '54017110.915877459',
                                                    lunar        => '140.4609313373',
                                                    miles        => '33564676.3084045742',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '99130.4644222811',
                                                    kilometers_per_second => '27.5362401173',
                                                    miles_per_hour        => '61595.815518389',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1917-05-22',
                                                close_approach_date_full  => '1917-May-22 04:10',
                                                epoch_date_close_approach => '-1660333800000',
                                                miss_distance             => {
                                                    astronomical => '0.0650604839',
                                                    kilometers   => '9732909.812609293',
                                                    lunar        => '25.3085282371',
                                                    miles        => '6047749.7196745234',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107705.0903840942',
                                                    kilometers_per_second => '29.9180806622',
                                                    miles_per_hour        => '66923.7546333834',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1917-08-09',
                                                close_approach_date_full  => '1917-Aug-09 13:03',
                                                epoch_date_close_approach => '-1653476220000',
                                                miss_distance             => {
                                                    astronomical => '0.1373528976',
                                                    kilometers   => '20547700.919288112',
                                                    lunar        => '53.4302771664',
                                                    miles        => '12767749.3028434656',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51512.8497411056',
                                                    kilometers_per_second => '14.3091249281',
                                                    miles_per_hour        => '32008.0815516331',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1918-08-04',
                                                close_approach_date_full  => '1918-Aug-04 09:54',
                                                epoch_date_close_approach => '-1622383560000',
                                                miss_distance             => {
                                                    astronomical => '0.3954025933',
                                                    kilometers   => '59151385.750156271',
                                                    lunar        => '153.8116087937',
                                                    miles        => '36754966.7546916998',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '108757.4431633027',
                                                    kilometers_per_second => '30.2104008787',
                                                    miles_per_hour        => '67577.6457255533',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1919-01-29',
                                                close_approach_date_full  => '1919-Jan-29 16:05',
                                                epoch_date_close_approach => '-1606982100000',
                                                miss_distance             => {
                                                    astronomical => '0.0671039137',
                                                    kilometers   => '10038602.558183819',
                                                    lunar        => '26.1034224293',
                                                    miles        => '6237698.3837379422',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '123616.9813057776',
                                                    kilometers_per_second => '34.3380503627',
                                                    miles_per_hour        => '76810.7848563594',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1920-10-08',
                                                close_approach_date_full  => '1920-Oct-08 02:08',
                                                epoch_date_close_approach => '-1553637120000',
                                                miss_distance             => {
                                                    astronomical => '0.0926211966',
                                                    kilometers   => '13855933.728211242',
                                                    lunar        => '36.0296454774',
                                                    miles        => '8609677.9826374596',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '139714.0838534477',
                                                    kilometers_per_second => '38.8094677371',
                                                    miles_per_hour        => '86812.8983810492',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1920-10-23',
                                                close_approach_date_full  => '1920-Oct-23 19:32',
                                                epoch_date_close_approach => '-1552278480000',
                                                miss_distance             => {
                                                    astronomical => '0.0795468188',
                                                    kilometers   => '11900034.657755956',
                                                    lunar        => '30.9437125132',
                                                    miles        => '7394338.6562899528',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101126.0132953747',
                                                    kilometers_per_second => '28.0905592487',
                                                    miles_per_hour        => '62835.771983451',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1921-08-31',
                                                close_approach_date_full  => '1921-Aug-31 19:42',
                                                epoch_date_close_approach => '-1525321080000',
                                                miss_distance             => {
                                                    astronomical => '0.124625443',
                                                    kilometers   => '18643700.82060641',
                                                    lunar        => '48.479297327',
                                                    miles        => '11584658.502172058',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '56989.0469502745',
                                                    kilometers_per_second => '15.8302908195',
                                                    miles_per_hour        => '35410.7775341859',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1922-07-25',
                                                close_approach_date_full  => '1922-Jul-25 22:12',
                                                epoch_date_close_approach => '-1496972880000',
                                                miss_distance             => {
                                                    astronomical => '0.1240044527',
                                                    kilometers   => '18550801.994435749',
                                                    lunar        => '48.2377321003',
                                                    miles        => '11526933.8483173762',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '74407.2034548017',
                                                    kilometers_per_second => '20.6686676263',
                                                    miles_per_hour        => '46233.7426133461',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1925-03-20',
                                                close_approach_date_full  => '1925-Mar-20 17:08',
                                                epoch_date_close_approach => '-1413269520000',
                                                miss_distance             => {
                                                    astronomical => '0.0641673858',
                                                    kilometers   => '9599304.239148246',
                                                    lunar        => '24.9611130762',
                                                    miles        => '5964731.0659519548',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '148699.2401375454',
                                                    kilometers_per_second => '41.3053444827',
                                                    miles_per_hour        => '92395.9250732431',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1925-08-30',
                                                close_approach_date_full  => '1925-Aug-30 22:22',
                                                epoch_date_close_approach => '-1399167480000',
                                                miss_distance             => {
                                                    astronomical => '0.2660682312',
                                                    kilometers   => '39803240.662187544',
                                                    lunar        => '103.5005419368',
                                                    miles        => '24732586.8821903472',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '85677.5707243837',
                                                    kilometers_per_second => '23.7993252012',
                                                    miles_per_hour        => '53236.7105426039',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1926-08-01',
                                                close_approach_date_full  => '1926-Aug-01 00:39',
                                                epoch_date_close_approach => '-1370215260000',
                                                miss_distance             => {
                                                    astronomical => '0.0980278237',
                                                    kilometers   => '14664753.626255519',
                                                    lunar        => '38.1328234193',
                                                    miles        => '9112255.3624594022',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53020.1421520992',
                                                    kilometers_per_second => '14.7278172645',
                                                    miles_per_hour        => '32944.6544388974',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1926-11-28',
                                                close_approach_date_full  => '1926-Nov-28 19:40',
                                                epoch_date_close_approach => '-1359865200000',
                                                miss_distance             => {
                                                    astronomical => '0.0394076589',
                                                    kilometers   => '5895301.833126543',
                                                    lunar        => '15.3295793121',
                                                    miles        => '3663170.6956225734',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '115990.199377501',
                                                    kilometers_per_second => '32.2194998271',
                                                    miles_per_hour        => '72071.7991632033',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1927-07-31',
                                                close_approach_date_full  => '1927-Jul-31 06:22',
                                                epoch_date_close_approach => '-1338745080000',
                                                miss_distance             => {
                                                    astronomical => '0.0730742942',
                                                    kilometers   => '10931758.764073354',
                                                    lunar        => '28.4259004438',
                                                    miles        => '6792679.9152421252',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '99453.0232993144',
                                                    kilometers_per_second => '27.6258398054',
                                                    miles_per_hour        => '61796.2410606212',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1927-08-09',
                                                close_approach_date_full  => '1927-Aug-09 10:59',
                                                epoch_date_close_approach => '-1337950860000',
                                                miss_distance             => {
                                                    astronomical => '0.4986362008',
                                                    kilometers   => '74594913.544572296',
                                                    lunar        => '193.9694821112',
                                                    miles        => '46351129.9461418448',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '122587.6522080424',
                                                    kilometers_per_second => '34.0521256133',
                                                    miles_per_hour        => '76171.1997844917',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1928-08-09',
                                                close_approach_date_full  => '1928-Aug-09 11:29',
                                                epoch_date_close_approach => '-1306326660000',
                                                miss_distance             => {
                                                    astronomical => '0.0829178955',
                                                    kilometers   => '12404340.551682585',
                                                    lunar        => '32.2550613495',
                                                    miles        => '7707699.808026273',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100837.9668806831',
                                                    kilometers_per_second => '28.0105463557',
                                                    miles_per_hour        => '62656.7911431667',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1930-08-25',
                                                close_approach_date_full  => '1930-Aug-25 02:45',
                                                epoch_date_close_approach => '-1241903700000',
                                                miss_distance             => {
                                                    astronomical => '0.1398406063',
                                                    kilometers   => '20919856.841988581',
                                                    lunar        => '54.3979958507',
                                                    miles        => '12998996.2701451778',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52587.4677371968',
                                                    kilometers_per_second => '14.607629927',
                                                    miles_per_hour        => '32675.8073837043',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1931-07-29',
                                                close_approach_date_full  => '1931-Jul-29 03:54',
                                                epoch_date_close_approach => '-1212696360000',
                                                miss_distance             => {
                                                    astronomical => '0.2285998411',
                                                    kilometers   => '34198049.310898457',
                                                    lunar        => '88.9253381879',
                                                    miles        => '21249682.4809224266',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '87269.2123198349',
                                                    kilometers_per_second => '24.2414478666',
                                                    miles_per_hour        => '54225.6947328441',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1934-05-06',
                                                close_approach_date_full  => '1934-May-06 18:45',
                                                epoch_date_close_approach => '-1125206100000',
                                                miss_distance             => {
                                                    astronomical => '0.0687113318',
                                                    kilometers   => '10279068.882143266',
                                                    lunar        => '26.7287080702',
                                                    miles        => '6387117.2288024308',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '98201.0345961809',
                                                    kilometers_per_second => '27.2780651656',
                                                    miles_per_hour        => '61018.3039689436',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1934-09-02',
                                                close_approach_date_full  => '1934-Sep-02 23:18',
                                                epoch_date_close_approach => '-1114908120000',
                                                miss_distance             => {
                                                    astronomical => '0.1802150587',
                                                    kilometers   => '26959788.923444969',
                                                    lunar        => '70.1036578343',
                                                    miles        => '16752036.0347958122',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '72574.0384759571',
                                                    kilometers_per_second => '20.1594551322',
                                                    miles_per_hour        => '45094.6851852412',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1935-07-26',
                                                close_approach_date_full  => '1935-Jul-26 13:52',
                                                epoch_date_close_approach => '-1086689280000',
                                                miss_distance             => {
                                                    astronomical => '0.0297594217',
                                                    kilometers   => '4451946.098751779',
                                                    lunar        => '11.5764150413',
                                                    miles        => '2766311.0302173902',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '58413.3270394543',
                                                    kilometers_per_second => '16.2259241776',
                                                    miles_per_hour        => '36295.769792932',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1938-08-24',
                                                close_approach_date_full  => '1938-Aug-24 16:06',
                                                epoch_date_close_approach => '-989481240000',
                                                miss_distance             => {
                                                    astronomical => '0.4214233',
                                                    kilometers   => '63044028.048371',
                                                    lunar        => '163.9336637',
                                                    miles        => '39173742.5186798',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107502.3301353008',
                                                    kilometers_per_second => '29.8617583709',
                                                    miles_per_hour        => '66797.767299904',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1939-08-16',
                                                close_approach_date_full  => '1939-Aug-16 02:36',
                                                epoch_date_close_approach => '-958685040000',
                                                miss_distance             => {
                                                    astronomical => '0.1464445443',
                                                    kilometers   => '21907791.900400641',
                                                    lunar        => '56.9669277327',
                                                    miles        => '13612870.6497092058',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51519.5463347888',
                                                    kilometers_per_second => '14.310985093',
                                                    miles_per_hour        => '32012.2425545248',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1940-07-02',
                                                close_approach_date_full  => '1940-Jul-02 20:48',
                                                epoch_date_close_approach => '-930885120000',
                                                miss_distance             => {
                                                    astronomical => '0.0938520165',
                                                    kilometers   => '14040061.763604855',
                                                    lunar        => '36.5084344185',
                                                    miles        => '8724089.838482799',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '88641.3832339439',
                                                    kilometers_per_second => '24.6226064539',
                                                    miles_per_hour        => '55078.3083766692',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1940-08-01',
                                                close_approach_date_full  => '1940-Aug-01 07:16',
                                                epoch_date_close_approach => '-928341840000',
                                                miss_distance             => {
                                                    astronomical => '0.3306427076',
                                                    kilometers   => '49463444.787992812',
                                                    lunar        => '128.6200132564',
                                                    miles        => '30735159.3829803256',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100310.3957209219',
                                                    kilometers_per_second => '27.8639988114',
                                                    miles_per_hour        => '62328.9789411473',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1941-02-10',
                                                close_approach_date_full  => '1941-Feb-10 01:07',
                                                epoch_date_close_approach => '-911688780000',
                                                miss_distance             => {
                                                    astronomical => '0.0607131274',
                                                    kilometers   => '9082554.540078638',
                                                    lunar        => '23.6174065586',
                                                    miles        => '5643637.6922476844',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '95214.5527356936',
                                                    kilometers_per_second => '26.448486871',
                                                    miles_per_hour        => '59162.6202817981',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1942-03-12',
                                                close_approach_date_full  => '1942-Mar-12 15:28',
                                                epoch_date_close_approach => '-877509120000',
                                                miss_distance             => {
                                                    astronomical => '0.0678058792',
                                                    kilometers   => '10143615.101797304',
                                                    lunar        => '26.3764870088',
                                                    miles        => '6302950.1525746352',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '104593.5658125983',
                                                    kilometers_per_second => '29.0537682813',
                                                    miles_per_hour        => '64990.3742683892',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1943-09-03',
                                                close_approach_date_full  => '1943-Sep-03 09:06',
                                                epoch_date_close_approach => '-830876040000',
                                                miss_distance             => {
                                                    astronomical => '0.1319184324',
                                                    kilometers   => '19734716.500778988',
                                                    lunar        => '51.3162702036',
                                                    miles        => '12262584.2099985144',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '62210.6966726737',
                                                    kilometers_per_second => '17.2807490757',
                                                    miles_per_hour        => '38655.3076075288',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1943-11-20',
                                                close_approach_date_full  => '1943-Nov-20 03:23',
                                                epoch_date_close_approach => '-824157420000',
                                                miss_distance             => {
                                                    astronomical => '0.063934424',
                                                    kilometers   => '9564453.65007688',
                                                    lunar        => '24.870490936',
                                                    miles        => '5943075.914065744',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '120199.2863749722',
                                                    kilometers_per_second => '33.3886906597',
                                                    miles_per_hour        => '74687.1621367154',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1944-07-24',
                                                close_approach_date_full  => '1944-Jul-24 16:51',
                                                epoch_date_close_approach => '-802768140000',
                                                miss_distance             => {
                                                    astronomical => '0.0617486757',
                                                    kilometers   => '9237470.360040759',
                                                    lunar        => '24.0202348473',
                                                    miles        => '5739897.9191261142',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '67051.6942563806',
                                                    kilometers_per_second => '18.6254706268',
                                                    miles_per_hour        => '41663.3152450272',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1945-07-29',
                                                close_approach_date_full  => '1945-Jul-29 14:42',
                                                epoch_date_close_approach => '-770807880000',
                                                miss_distance             => {
                                                    astronomical => '0.0865839436',
                                                    kilometers   => '12952773.538760132',
                                                    lunar        => '33.6811540604',
                                                    miles        => '8048480.2639965416',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '136668.5327868854',
                                                    kilometers_per_second => '37.9634813297',
                                                    miles_per_hour        => '84920.5113863845',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1947-08-29',
                                                close_approach_date_full  => '1947-Aug-29 03:56',
                                                epoch_date_close_approach => '-705096240000',
                                                miss_distance             => {
                                                    astronomical => '0.3266238591',
                                                    kilometers   => '48862233.612540117',
                                                    lunar        => '127.0566811899',
                                                    miles        => '30361584.0814709346',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '94234.6582621438',
                                                    kilometers_per_second => '26.1762939617',
                                                    miles_per_hour        => '58553.7519629415',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1947-11-17',
                                                close_approach_date_full  => '1947-Nov-17 11:29',
                                                epoch_date_close_approach => '-698157060000',
                                                miss_distance             => {
                                                    astronomical => '0.057583754',
                                                    kilometers   => '8614406.94500398',
                                                    lunar        => '22.400080306',
                                                    miles        => '5352744.265575724',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '93140.8270742801',
                                                    kilometers_per_second => '25.8724519651',
                                                    miles_per_hour        => '57874.0878006825',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1948-08-06',
                                                close_approach_date_full  => '1948-Aug-06 01:01',
                                                epoch_date_close_approach => '-675471540000',
                                                miss_distance             => {
                                                    astronomical => '0.1269910769',
                                                    kilometers   => '18997594.613246203',
                                                    lunar        => '49.3995289141',
                                                    miles        => '11804557.9080474814',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51850.6827507994',
                                                    kilometers_per_second => '14.4029674308',
                                                    miles_per_hour        => '32217.9978459064',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1949-08-06',
                                                close_approach_date_full  => '1949-Aug-06 01:15',
                                                epoch_date_close_approach => '-643934700000',
                                                miss_distance             => {
                                                    astronomical => '0.433206521',
                                                    kilometers   => '64806772.81171027',
                                                    lunar        => '168.517336669',
                                                    miles        => '40269061.324010926',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '113783.4230433728',
                                                    kilometers_per_second => '31.6065064009',
                                                    miles_per_hour        => '70700.5941682558',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1950-01-09',
                                                close_approach_date_full  => '1950-Jan-09 05:27',
                                                epoch_date_close_approach => '-630441180000',
                                                miss_distance             => {
                                                    astronomical => '0.0729563461',
                                                    kilometers   => '10914113.979542807',
                                                    lunar        => '28.3800186329',
                                                    miles        => '6781715.9545404566',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '154218.0368787872',
                                                    kilometers_per_second => '42.8383435774',
                                                    miles_per_hour        => '95825.0907483775',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1951-09-19',
                                                close_approach_date_full  => '1951-Sep-19 06:17',
                                                epoch_date_close_approach => '-577042980000',
                                                miss_distance             => {
                                                    astronomical => '0.0369852829',
                                                    kilometers   => '5532919.543187423',
                                                    lunar        => '14.3872750481',
                                                    miles        => '3437996.7821075174',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '120342.8552115046',
                                                    kilometers_per_second => '33.4285708921',
                                                    miles_per_hour        => '74776.370228504',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1952-08-29',
                                                close_approach_date_full  => '1952-Aug-29 14:03',
                                                epoch_date_close_approach => '-547207020000',
                                                miss_distance             => {
                                                    astronomical => '0.1293959855',
                                                    kilometers   => '19357363.817350885',
                                                    lunar        => '50.3350383595',
                                                    miles        => '12028108.125316813',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '54668.2645583521',
                                                    kilometers_per_second => '15.185629044',
                                                    miles_per_hour        => '33968.7336084938',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1953-05-30',
                                                close_approach_date_full  => '1953-May-30 15:18',
                                                epoch_date_close_approach => '-523528920000',
                                                miss_distance             => {
                                                    astronomical => '0.0762818096',
                                                    kilometers   => '11411596.235905552',
                                                    lunar        => '29.6736239344',
                                                    miles        => '7090837.0945065376',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100644.6938718107',
                                                    kilometers_per_second => '27.9568594088',
                                                    miles_per_hour        => '62536.6988116259',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1953-07-26',
                                                close_approach_date_full  => '1953-Jul-26 18:46',
                                                epoch_date_close_approach => '-518591640000',
                                                miss_distance             => {
                                                    astronomical => '0.1634473566',
                                                    kilometers   => '24451376.404490442',
                                                    lunar        => '63.5810217174',
                                                    miles        => '15193380.7713224196',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '79179.7503869489',
                                                    kilometers_per_second => '21.9943751075',
                                                    miles_per_hour        => '49199.217677935',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1954-08-24',
                                                close_approach_date_full  => '1954-Aug-24 00:16',
                                                epoch_date_close_approach => '-484616640000',
                                                miss_distance             => {
                                                    astronomical => '0.0568520477',
                                                    kilometers   => '8504945.241058399',
                                                    lunar        => '22.1154465553',
                                                    miles        => '5284727.9167039462',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '91859.5254322141',
                                                    kilometers_per_second => '25.5165348423',
                                                    miles_per_hour        => '57077.9367886999',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1956-09-01',
                                                close_approach_date_full  => '1956-Sep-01 03:24',
                                                epoch_date_close_approach => '-420755760000',
                                                miss_distance             => {
                                                    astronomical => '0.2307062226',
                                                    kilometers   => '34513159.496705862',
                                                    lunar        => '89.7447205914',
                                                    miles        => '21445482.8709984156',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '80517.797572387',
                                                    kilometers_per_second => '22.3660548812',
                                                    miles_per_hour        => '50030.6281637979',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1957-07-29',
                                                close_approach_date_full  => '1957-Jul-29 03:29',
                                                epoch_date_close_approach => '-392157060000',
                                                miss_distance             => {
                                                    astronomical => '0.0738072531',
                                                    kilometers   => '11041407.854310897',
                                                    lunar        => '28.7110214559',
                                                    miles        => '6860812.7005564986',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '54589.4086457696',
                                                    kilometers_per_second => '15.1637246238',
                                                    miles_per_hour        => '33919.7356110339',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1960-08-21',
                                                close_approach_date_full  => '1960-Aug-21 12:01',
                                                epoch_date_close_approach => '-295444740000',
                                                miss_distance             => {
                                                    astronomical => '0.4813451086',
                                                    kilometers   => '72008202.981478682',
                                                    lunar        => '187.2432472454',
                                                    miles        => '44743822.5340705316',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '115770.8089841198',
                                                    kilometers_per_second => '32.1585580511',
                                                    miles_per_hour        => '71935.4785046049',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1961-05-30',
                                                close_approach_date_full  => '1961-May-30 13:13',
                                                epoch_date_close_approach => '-271075620000',
                                                miss_distance             => {
                                                    astronomical => '0.0573281652',
                                                    kilometers   => '8576171.404928124',
                                                    lunar        => '22.3006562628',
                                                    miles        => '5328985.8026671512',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '90483.4953164398',
                                                    kilometers_per_second => '25.1343042546',
                                                    miles_per_hour        => '56222.92518704',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1961-08-21',
                                                close_approach_date_full  => '1961-Aug-21 09:27',
                                                epoch_date_close_approach => '-263917980000',
                                                miss_distance             => {
                                                    astronomical => '0.14564259',
                                                    kilometers   => '21787821.2452833',
                                                    lunar        => '56.65496751',
                                                    miles        => '13538324.34137754',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51855.8167583849',
                                                    kilometers_per_second => '14.404393544',
                                                    miles_per_hour        => '32221.1879185642',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1962-07-30',
                                                close_approach_date_full  => '1962-Jul-30 12:58',
                                                epoch_date_close_approach => '-234270120000',
                                                miss_distance             => {
                                                    astronomical => '0.2695664827',
                                                    kilometers   => '40326571.635311849',
                                                    lunar        => '104.8613617703',
                                                    miles        => '25057769.6699635562',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '92521.6243571286',
                                                    kilometers_per_second => '25.7004512103',
                                                    miles_per_hour        => '57489.3393123503',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1965-04-23',
                                                close_approach_date_full  => '1965-Apr-23 18:22',
                                                epoch_date_close_approach => '-148023480000',
                                                miss_distance             => {
                                                    astronomical => '0.0925840502',
                                                    kilometers   => '13850376.705893074',
                                                    lunar        => '36.0151955278',
                                                    miles        => '8606225.0090854612',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89175.8897450964',
                                                    kilometers_per_second => '24.7710804847',
                                                    miles_per_hour        => '55410.429936335',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1965-09-03',
                                                close_approach_date_full  => '1965-Sep-03 06:57',
                                                epoch_date_close_approach => '-136573380000',
                                                miss_distance             => {
                                                    astronomical => '0.1565258475',
                                                    kilometers   => '23415933.385944825',
                                                    lunar        => '60.8885546775',
                                                    miles        => '14549986.314195585',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '68089.6383065719',
                                                    kilometers_per_second => '18.9137884185',
                                                    miles_per_hour        => '42308.2533133252',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1966-07-25',
                                                close_approach_date_full  => '1966-Jul-25 14:11',
                                                epoch_date_close_approach => '-108467340000',
                                                miss_distance             => {
                                                    astronomical => '0.0189281294',
                                                    kilometers   => '2831607.841324378',
                                                    lunar        => '7.3630423366',
                                                    miles        => '1759479.5244492964',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '61531.517926346',
                                                    kilometers_per_second => '17.0920883129',
                                                    miles_per_hour        => '38233.2923470676',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1967-01-01',
                                                close_approach_date_full  => '1967-Jan-01 16:07',
                                                epoch_date_close_approach => '-94636380000',
                                                miss_distance             => {
                                                    astronomical => '0.0660229798',
                                                    kilometers   => '9876897.149133026',
                                                    lunar        => '25.6829391422',
                                                    miles        => '6137219.3018307188',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '106344.5955922138',
                                                    kilometers_per_second => '29.5401654423',
                                                    miles_per_hour        => '66078.3960778397',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1968-03-06',
                                                close_approach_date_full  => '1968-Mar-06 02:39',
                                                epoch_date_close_approach => '-57532860000',
                                                miss_distance             => {
                                                    astronomical => '0.05893016',
                                                    kilometers   => '8815826.4147592',
                                                    lunar        => '22.92383224',
                                                    miles        => '5477900.52050896',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89257.1961534836',
                                                    kilometers_per_second => '24.7936655982',
                                                    miles_per_hour        => '55460.950576591',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1968-09-10',
                                                close_approach_date_full  => '1968-Sep-10 10:21',
                                                epoch_date_close_approach => '-41261940000',
                                                miss_distance             => {
                                                    astronomical => '0.0680973113',
                                                    kilometers   => '10187212.723206931',
                                                    lunar        => '26.4898540957',
                                                    miles        => '6330040.4583244078',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '124628.2466004954',
                                                    kilometers_per_second => '34.618957389',
                                                    miles_per_hour        => '77439.1457835134',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1969-08-26',
                                                close_approach_date_full  => '1969-Aug-26 14:37',
                                                epoch_date_close_approach => '-11006580000',
                                                miss_distance             => {
                                                    astronomical => '0.3781109054',
                                                    kilometers   => '56564586.071611498',
                                                    lunar        => '147.0851422006',
                                                    miles        => '35147603.9688467524',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101332.665752823',
                                                    kilometers_per_second => '28.1479627091',
                                                    miles_per_hour        => '62964.1777840249',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1970-05-21',
                                                close_approach_date_full  => '1970-May-21 00:03',
                                                epoch_date_close_approach => '12096180000',
                                                miss_distance             => {
                                                    astronomical => '0.0980744678',
                                                    kilometers   => '14671731.484263586',
                                                    lunar        => '38.1509679742',
                                                    miles        => '9116591.2023700468',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '142344.6783363756',
                                                    kilometers_per_second => '39.5401884268',
                                                    miles_per_hour        => '88447.447491844',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1970-08-11',
                                                close_approach_date_full  => '1970-Aug-11 11:32',
                                                epoch_date_close_approach => '19222320000',
                                                miss_distance             => {
                                                    astronomical => '0.1413539753',
                                                    kilometers   => '21146253.620912611',
                                                    lunar        => '54.9866963917',
                                                    miles        => '13139672.7053155918',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51451.3394274132',
                                                    kilometers_per_second => '14.2920387298',
                                                    miles_per_hour        => '31969.8614347724',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1971-08-04',
                                                close_approach_date_full  => '1971-Aug-04 09:19',
                                                epoch_date_close_approach => '50145540000',
                                                miss_distance             => {
                                                    astronomical => '0.3816618707',
                                                    kilometers   => '57095802.916935409',
                                                    lunar        => '148.4664677023',
                                                    miles        => '35477686.8103862842',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '106940.7394696141',
                                                    kilometers_per_second => '29.7057609638',
                                                    miles_per_hour        => '66448.8166998833',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1974-09-01',
                                                close_approach_date_full  => '1974-Sep-01 17:21',
                                                epoch_date_close_approach => '147288060000',
                                                miss_distance             => {
                                                    astronomical => '0.1260045787',
                                                    kilometers   => '18850016.583767369',
                                                    lunar        => '49.0157811143',
                                                    miles        => '11712857.1727489322',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '57433.9182909725',
                                                    kilometers_per_second => '15.9538661919',
                                                    miles_per_hour        => '35687.2032847434',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1974-11-01',
                                                close_approach_date_full  => '1974-Nov-01 03:23',
                                                epoch_date_close_approach => '152508180000',
                                                miss_distance             => {
                                                    astronomical => '0.046588102',
                                                    kilometers   => '6969480.82654274',
                                                    lunar        => '18.122771678',
                                                    miles        => '4330634.571420212',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '136534.0002990962',
                                                    kilometers_per_second => '37.9261111942',
                                                    miles_per_hour        => '84836.9181302912',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1974-12-11',
                                                close_approach_date_full  => '1974-Dec-11 20:29',
                                                epoch_date_close_approach => '156025740000',
                                                miss_distance             => {
                                                    astronomical => '0.0582880573',
                                                    kilometers   => '8719769.218517951',
                                                    lunar        => '22.6740542897',
                                                    miles        => '5418213.3464956838',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89539.0911063817',
                                                    kilometers_per_second => '24.8719697518',
                                                    miles_per_hour        => '55636.1091377404',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1975-07-26',
                                                close_approach_date_full  => '1975-Jul-26 07:58',
                                                epoch_date_close_approach => '175593480000',
                                                miss_distance             => {
                                                    astronomical => '0.1173612882',
                                                    kilometers   => '17556998.735176134',
                                                    lunar        => '45.6535411098',
                                                    miles        => '10909413.1378292892',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '73582.3480417798',
                                                    kilometers_per_second => '20.4395411227',
                                                    miles_per_hour        => '45721.2095374048',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1976-07-11',
                                                close_approach_date_full  => '1976-Jul-11 20:13',
                                                epoch_date_close_approach => '205963980000',
                                                miss_distance             => {
                                                    astronomical => '0.0547077333',
                                                    kilometers   => '8184160.374208071',
                                                    lunar        => '21.2813082537',
                                                    miles        => '5085401.4433345398',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '105596.5356389236',
                                                    kilometers_per_second => '29.3323710108',
                                                    miles_per_hour        => '65613.5807140856',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1978-08-31',
                                                close_approach_date_full  => '1978-Aug-31 09:50',
                                                epoch_date_close_approach => '273405000000',
                                                miss_distance             => {
                                                    astronomical => '0.2695817677',
                                                    kilometers   => '40328858.238754799',
                                                    lunar        => '104.8673076353',
                                                    miles        => '25059190.4994582662',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '86131.3642674437',
                                                    kilometers_per_second => '23.9253789632',
                                                    miles_per_hour        => '53518.6802027347',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1979-08-01',
                                                close_approach_date_full  => '1979-Aug-01 15:01',
                                                epoch_date_close_approach => '302367660000',
                                                miss_distance             => {
                                                    astronomical => '0.0991684927',
                                                    kilometers   => '14835395.279030549',
                                                    lunar        => '38.5765436603',
                                                    miles        => '9218287.1687336162',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52997.486899352',
                                                    kilometers_per_second => '14.7215241387',
                                                    miles_per_hour        => '32930.5773458779',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1980-08-08',
                                                close_approach_date_full  => '1980-Aug-08 23:43',
                                                epoch_date_close_approach => '334626180000',
                                                miss_distance             => {
                                                    astronomical => '0.4985857843',
                                                    kilometers   => '74587371.343559441',
                                                    lunar        => '193.9498700927',
                                                    miles        => '46346443.4397486458',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '122631.9174136346',
                                                    kilometers_per_second => '34.0644215038',
                                                    miles_per_hour        => '76198.704461822',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1981-09-17',
                                                close_approach_date_full  => '1981-Sep-17 14:22',
                                                epoch_date_close_approach => '369584520000',
                                                miss_distance             => {
                                                    astronomical => '0.0576368877',
                                                    kilometers   => '8622355.633349199',
                                                    lunar        => '22.4207493153',
                                                    miles        => '5357683.3514849862',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89958.995730436',
                                                    kilometers_per_second => '24.9886099251',
                                                    miles_per_hour        => '55897.0215415034',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1983-08-25',
                                                close_approach_date_full  => '1983-Aug-25 10:04',
                                                epoch_date_close_approach => '430653840000',
                                                miss_distance             => {
                                                    astronomical => '0.141438527',
                                                    kilometers   => '21158902.37513749',
                                                    lunar        => '55.019587003',
                                                    miles        => '13147532.276737762',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52438.9335285179',
                                                    kilometers_per_second => '14.5663704246',
                                                    miles_per_hour        => '32583.5140027616',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1984-07-28',
                                                close_approach_date_full  => '1984-Jul-28 19:34',
                                                epoch_date_close_approach => '459891240000',
                                                miss_distance             => {
                                                    astronomical => '0.2321235568',
                                                    kilometers   => '34725189.674104016',
                                                    lunar        => '90.2960635952',
                                                    miles        => '21577232.3139307808',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '87790.1143834037',
                                                    kilometers_per_second => '24.3861428843',
                                                    miles_per_hour        => '54549.3630178432',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1987-09-03',
                                                close_approach_date_full  => '1987-Sep-03 14:29',
                                                epoch_date_close_approach => '557677740000',
                                                miss_distance             => {
                                                    astronomical => '0.1774120376',
                                                    kilometers   => '26540462.937319912',
                                                    lunar        => '69.0132826264',
                                                    miles        => '16491478.9492103056',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '71771.4605630498',
                                                    kilometers_per_second => '19.9365168231',
                                                    miles_per_hour        => '44595.9944815239',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1988-06-06',
                                                close_approach_date_full  => '1988-Jun-06 23:45',
                                                epoch_date_close_approach => '581643900000',
                                                miss_distance             => {
                                                    astronomical => '0.0899538906',
                                                    kilometers   => '13456910.431973022',
                                                    lunar        => '34.9920634434',
                                                    miles        => '8361736.4035588236',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '90484.2836788464',
                                                    kilometers_per_second => '25.1345232441',
                                                    miles_per_hour        => '56223.415044781',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1988-06-24',
                                                close_approach_date_full  => '1988-Jun-24 07:25',
                                                epoch_date_close_approach => '583140300000',
                                                miss_distance             => {
                                                    astronomical => '0.0574258071',
                                                    kilometers   => '8590778.425190877',
                                                    lunar        => '22.3386389619',
                                                    miles        => '5338062.1841810226',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89987.6477230585',
                                                    kilometers_per_second => '24.996568812',
                                                    miles_per_hour        => '55914.8247754749',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1988-07-25',
                                                close_approach_date_full  => '1988-Jul-25 21:10',
                                                epoch_date_close_approach => '585868200000',
                                                miss_distance             => {
                                                    astronomical => '0.0249765049',
                                                    kilometers   => '3736431.933084563',
                                                    lunar        => '9.7158604061',
                                                    miles        => '2321711.1440424494',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '58905.3464383702',
                                                    kilometers_per_second => '16.3625962329',
                                                    miles_per_hour        => '36601.4915133306',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1990-02-14',
                                                close_approach_date_full  => '1990-Feb-14 16:04',
                                                epoch_date_close_approach => '635011440000',
                                                miss_distance             => {
                                                    astronomical => '0.0663244253',
                                                    kilometers   => '9921992.753854111',
                                                    lunar        => '25.8002014417',
                                                    miles        => '6165240.4112482918',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '105945.6710253985',
                                                    kilometers_per_second => '29.4293530626',
                                                    miles_per_hour        => '65830.5198657539',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1991-08-25',
                                                close_approach_date_full  => '1991-Aug-25 11:17',
                                                epoch_date_close_approach => '683119020000',
                                                miss_distance             => {
                                                    astronomical => '0.4160151619',
                                                    kilometers   => '62234982.107945153',
                                                    lunar        => '161.8298979791',
                                                    miles        => '38671024.6826349914',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '106576.1713248869',
                                                    kilometers_per_second => '29.6044920347',
                                                    miles_per_hour        => '66222.2882323999',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1991-10-25',
                                                close_approach_date_full  => '1991-Oct-25 03:28',
                                                epoch_date_close_approach => '688361280000',
                                                miss_distance             => {
                                                    astronomical => '0.0648821168',
                                                    kilometers   => '9706226.474371216',
                                                    lunar        => '25.2391434352',
                                                    miles        => '6031169.4621301408',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '121477.0224101209',
                                                    kilometers_per_second => '33.7436173361',
                                                    miles_per_hour        => '75481.0976192221',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1992-08-15',
                                                close_approach_date_full  => '1992-Aug-15 00:22',
                                                epoch_date_close_approach => '713838120000',
                                                miss_distance             => {
                                                    astronomical => '0.1468751771',
                                                    kilometers   => '21972213.650032777',
                                                    lunar        => '57.1344438919',
                                                    miles        => '13652900.4687232426',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51421.9283300092',
                                                    kilometers_per_second => '14.2838689806',
                                                    miles_per_hour        => '31951.5865226104',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1993-07-03',
                                                close_approach_date_full  => '1993-Jul-03 12:07',
                                                epoch_date_close_approach => '741701220000',
                                                miss_distance             => {
                                                    astronomical => '0.0870631688',
                                                    kilometers   => '13024464.607930456',
                                                    lunar        => '33.8675726632',
                                                    miles        => '8093027.0287180528',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '136926.6097164178',
                                                    kilometers_per_second => '38.0351693657',
                                                    miles_per_hour        => '85080.8703540708',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1993-08-02',
                                                close_approach_date_full  => '1993-Aug-02 02:58',
                                                epoch_date_close_approach => '744260280000',
                                                miss_distance             => {
                                                    astronomical => '0.3370928157',
                                                    kilometers   => '50428367.221022559',
                                                    lunar        => '131.1291053073',
                                                    miles        => '31334734.3802029542',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101150.3588611324',
                                                    kilometers_per_second => '28.0973219059',
                                                    miles_per_hour        => '62850.8993712408',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1995-03-31',
                                                close_approach_date_full  => '1995-Mar-31 16:06',
                                                epoch_date_close_approach => '796665960000',
                                                miss_distance             => {
                                                    astronomical => '0.0641788867',
                                                    kilometers   => '9601024.749291329',
                                                    lunar        => '24.9655869263',
                                                    miles        => '5965800.1413811802',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '86884.4261143422',
                                                    kilometers_per_second => '24.1345628095',
                                                    miles_per_hour        => '53986.6035486589',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1996-09-02',
                                                close_approach_date_full  => '1996-Sep-02 19:20',
                                                epoch_date_close_approach => '841692000000',
                                                miss_distance             => {
                                                    astronomical => '0.1321741893',
                                                    kilometers   => '19772977.188256791',
                                                    lunar        => '51.4157596377',
                                                    miles        => '12286358.2987780758',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '61677.9947542482',
                                                    kilometers_per_second => '17.1327763206',
                                                    miles_per_hour        => '38324.3073516049',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1997-07-25',
                                                close_approach_date_full  => '1997-Jul-25 06:04',
                                                epoch_date_close_approach => '869810640000',
                                                miss_distance             => {
                                                    astronomical => '0.0658904655',
                                                    kilometers   => '9857073.292108485',
                                                    lunar        => '25.6313910795',
                                                    miles        => '6124901.328267693',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '67523.095375762',
                                                    kilometers_per_second => '18.7564153822',
                                                    miles_per_hour        => '41956.225568345',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1997-12-13',
                                                close_approach_date_full  => '1997-Dec-13 16:06',
                                                epoch_date_close_approach => '882029160000',
                                                miss_distance             => {
                                                    astronomical => '0.086362055',
                                                    kilometers   => '12919579.47682285',
                                                    lunar        => '33.594839395',
                                                    miles        => '8027854.43034133',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '162259.8472270872',
                                                    kilometers_per_second => '45.0721797853',
                                                    miles_per_hour        => '100821.958961742',
                                                },
                                            },
                                            {
                                                close_approach_date       => '1999-08-23',
                                                close_approach_date_full  => '1999-Aug-23 12:15',
                                                epoch_date_close_approach => '935410500000',
                                                miss_distance             => {
                                                    astronomical => '0.0388161927',
                                                    kilometers   => '5806819.749429549',
                                                    lunar        => '15.0994989603',
                                                    miles        => '3608190.4782798162',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '128680.221101378',
                                                    kilometers_per_second => '35.7445058615',
                                                    miles_per_hour        => '79956.8851615757',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2000-08-28',
                                                close_approach_date_full  => '2000-Aug-28 19:27',
                                                epoch_date_close_approach => '967490820000',
                                                miss_distance             => {
                                                    astronomical => '0.3248797203',
                                                    kilometers   => '48601314.163075761',
                                                    lunar        => '126.3782111967',
                                                    miles        => '30199456.2535410618',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '93926.6985390599',
                                                    kilometers_per_second => '26.0907495942',
                                                    miles_per_hour        => '58362.3977672286',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2001-05-03',
                                                close_approach_date_full  => '2001-May-03 05:18',
                                                epoch_date_close_approach => '988867080000',
                                                miss_distance             => {
                                                    astronomical => '0.0616532199',
                                                    kilometers   => '9223190.375681613',
                                                    lunar        => '23.9831025411',
                                                    miles        => '5731024.7482997394',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '103159.5219760277',
                                                    kilometers_per_second => '28.6554227711',
                                                    miles_per_hour        => '64099.3151967156',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2001-08-06',
                                                close_approach_date_full  => '2001-Aug-06 07:55',
                                                epoch_date_close_approach => '997084500000',
                                                miss_distance             => {
                                                    astronomical => '0.1265868535',
                                                    kilometers   => '18937123.653602045',
                                                    lunar        => '49.2422860115',
                                                    miles        => '11766982.996096421',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51785.5819946008',
                                                    kilometers_per_second => '14.3848838874',
                                                    miles_per_hour        => '32177.5467677007',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2002-01-05',
                                                close_approach_date_full  => '2002-Jan-05 03:17',
                                                epoch_date_close_approach => '1010200620000',
                                                miss_distance             => {
                                                    astronomical => '0.0736151088',
                                                    kilometers   => '11012663.476298256',
                                                    lunar        => '28.6362773232',
                                                    miles        => '6842951.7722816928',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '84272.2124231887',
                                                    kilometers_per_second => '23.4089478953',
                                                    miles_per_hour        => '52363.4755470641',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2002-08-06',
                                                close_approach_date_full  => '2002-Aug-06 15:09',
                                                epoch_date_close_approach => '1028646540000',
                                                miss_distance             => {
                                                    astronomical => '0.4345788356',
                                                    kilometers   => '65012068.152840172',
                                                    lunar        => '169.0511670484',
                                                    miles        => '40396625.9337394936',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '114001.9417432829',
                                                    kilometers_per_second => '31.6672060398',
                                                    miles_per_hour        => '70836.3731904304',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2005-08-30',
                                                close_approach_date_full  => '2005-Aug-30 06:32',
                                                epoch_date_close_approach => '1125383520000',
                                                miss_distance             => {
                                                    astronomical => '0.1303453291',
                                                    kilometers   => '19499383.597809017',
                                                    lunar        => '50.7043330199',
                                                    miles        => '12116355.1248257546',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '54877.4854398662',
                                                    kilometers_per_second => '15.2437459555',
                                                    miles_per_hour        => '34098.7353278991',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2006-07-27',
                                                close_approach_date_full  => '2006-Jul-27 04:50',
                                                epoch_date_close_approach => '1153975800000',
                                                miss_distance             => {
                                                    astronomical => '0.1594837579',
                                                    kilometers   => '23858430.481435673',
                                                    lunar        => '62.0391818231',
                                                    miles        => '14824941.2595033674',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '78781.9238252744',
                                                    kilometers_per_second => '21.8838677292',
                                                    miles_per_hour        => '48952.0237235434',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2008-10-11',
                                                close_approach_date_full  => '2008-Oct-11 15:40',
                                                epoch_date_close_approach => '1223739600000',
                                                miss_distance             => {
                                                    astronomical => '0.0860557123',
                                                    kilometers   => '12873751.261412801',
                                                    lunar        => '33.4756720847',
                                                    miles        => '7999378.0977506138',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '81649.31389614',
                                                    kilometers_per_second => '22.6803649711',
                                                    miles_per_hour        => '50733.7084039654',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2009-09-01',
                                                close_approach_date_full  => '2009-Sep-01 09:51',
                                                epoch_date_close_approach => '1251798660000',
                                                miss_distance             => {
                                                    astronomical => '0.2382803161',
                                                    kilometers   => '35646227.751486707',
                                                    lunar        => '92.6910429629',
                                                    miles        => '22149538.8370102766',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '81406.9575344498',
                                                    kilometers_per_second => '22.6130437596',
                                                    miles_per_hour        => '50583.1175857808',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2010-07-30',
                                                close_approach_date_full  => '2010-Jul-30 05:23',
                                                epoch_date_close_approach => '1280467380000',
                                                miss_distance             => {
                                                    astronomical => '0.079673681',
                                                    kilometers   => '11919012.97265947',
                                                    lunar        => '30.993061909',
                                                    miles        => '7406131.234341886',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '54100.673021052',
                                                    kilometers_per_second => '15.0279647281',
                                                    miles_per_hour        => '33616.0543002198',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2013-08-21',
                                                close_approach_date_full  => '2013-Aug-21 07:22',
                                                epoch_date_close_approach => '1377069720000',
                                                miss_distance             => {
                                                    astronomical => '0.4961923092',
                                                    kilometers   => '74229312.566701404',
                                                    lunar        => '193.0188082788',
                                                    miles        => '46123956.0326872152',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '117686.5339415965',
                                                    kilometers_per_second => '32.6907038727',
                                                    miles_per_hour        => '73125.8354927659',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2014-08-23',
                                                close_approach_date_full  => '2014-Aug-23 08:41',
                                                epoch_date_close_approach => '1408783260000',
                                                miss_distance             => {
                                                    astronomical => '0.1446197138',
                                                    kilometers   => '21634801.144489606',
                                                    lunar        => '56.2570686682',
                                                    miles        => '13443242.0597683228',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52133.1058486818',
                                                    kilometers_per_second => '14.4814182913',
                                                    miles_per_hour        => '32393.4845758101',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2014-12-04',
                                                close_approach_date_full  => '2014-Dec-04 13:36',
                                                epoch_date_close_approach => '1417700160000',
                                                miss_distance             => {
                                                    astronomical => '0.090404715',
                                                    kilometers   => '13524352.80195705',
                                                    lunar        => '35.167434135',
                                                    miles        => '8403643.14902529',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '90241.2853383744',
                                                    kilometers_per_second => '25.0670237051',
                                                    miles_per_hour        => '56072.4253259471',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2015-07-19',
                                                close_approach_date_full  => '2015-Jul-19 05:52',
                                                epoch_date_close_approach => '1437285120000',
                                                miss_distance             => {
                                                    astronomical => '0.1053744325',
                                                    kilometers   => '15763790.654458775',
                                                    lunar        => '40.9906542425',
                                                    miles        => '9795165.304830095',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '78304.9122820058',
                                                    kilometers_per_second => '21.7513645228',
                                                    miles_per_hour        => '48655.6273010052',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2015-07-30',
                                                close_approach_date_full  => '2015-Jul-30 10:21',
                                                epoch_date_close_approach => '1438251660000',
                                                miss_distance             => {
                                                    astronomical => '0.2516130894',
                                                    kilometers   => '37640782.238359578',
                                                    lunar        => '97.8774917766',
                                                    miles        => '23388897.5253270564',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '90216.0891362556',
                                                    kilometers_per_second => '25.0600247601',
                                                    miles_per_hour        => '56056.7693858028',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2016-08-13',
                                                close_approach_date_full  => '2016-Aug-13 04:21',
                                                epoch_date_close_approach => '1471062060000',
                                                miss_distance             => {
                                                    astronomical => '0.0668617355',
                                                    kilometers   => '10002373.215303385',
                                                    lunar        => '26.0092151095',
                                                    miles        => '6215186.513961313',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '105100.8955301621',
                                                    kilometers_per_second => '29.1946932028',
                                                    miles_per_hour        => '65305.6092253943',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2018-04-22',
                                                close_approach_date_full  => '2018-Apr-22 13:15',
                                                epoch_date_close_approach => '1524402900000',
                                                miss_distance             => {
                                                    astronomical => '0.0632976359',
                                                    kilometers   => '9469191.506675533',
                                                    lunar        => '24.6227803651',
                                                    miles        => '5883882.7629790354',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '119598.7624928255',
                                                    kilometers_per_second => '33.2218784702',
                                                    miles_per_hour        => '74314.0199500559',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2018-09-03',
                                                close_approach_date_full  => '2018-Sep-03 13:36',
                                                epoch_date_close_approach => '1535981760000',
                                                miss_distance             => {
                                                    astronomical => '0.1721372249',
                                                    kilometers   => '25751362.192750963',
                                                    lunar        => '66.9613804861',
                                                    miles        => '16001154.4831827694',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '70838.6454572706',
                                                    kilometers_per_second => '19.6774015159',
                                                    miles_per_hour        => '44016.3794509357',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2019-07-26',
                                                close_approach_date_full  => '2019-Jul-26 15:04',
                                                epoch_date_close_approach => '1564153440000',
                                                miss_distance             => {
                                                    astronomical => '0.0210717866',
                                                    kilometers   => '3152294.392454542',
                                                    lunar        => '8.1969249874',
                                                    miles        => '1958744.9072629996',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '59367.4407665503',
                                                    kilometers_per_second => '16.4909557685',
                                                    miles_per_hour        => '36888.6189585268',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2019-12-30',
                                                close_approach_date_full  => '2019-Dec-30 17:39',
                                                epoch_date_close_approach => '1577727540000',
                                                miss_distance             => {
                                                    astronomical => '0.0800948661',
                                                    kilometers   => '11982021.366495207',
                                                    lunar        => '31.1569029129',
                                                    miles        => '7445282.8347875766',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '133163.6712794345',
                                                    kilometers_per_second => '36.9899086887',
                                                    miles_per_hour        => '82742.7267458242',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2022-04-25',
                                                close_approach_date_full  => '2022-Apr-25 02:39',
                                                epoch_date_close_approach => '1650854340000',
                                                miss_distance             => {
                                                    astronomical => '0.1354750163',
                                                    kilometers   => '20266773.876695281',
                                                    lunar        => '52.6997813407',
                                                    miles        => '12593189.3330296378',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '74129.5571586052',
                                                    kilometers_per_second => '20.5915436552',
                                                    miles_per_hour        => '46061.2240022455',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2022-08-25',
                                                close_approach_date_full  => '2022-Aug-25 05:02',
                                                epoch_date_close_approach => '1661403720000',
                                                miss_distance             => {
                                                    astronomical => '0.4190750573',
                                                    kilometers   => '62692735.942207951',
                                                    lunar        => '163.0201972897',
                                                    miles        => '38955459.7258176838',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107022.230933612',
                                                    kilometers_per_second => '29.7283974816',
                                                    miles_per_hour        => '66499.4523264991',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2023-08-16',
                                                close_approach_date_full  => '2023-Aug-16 11:36',
                                                epoch_date_close_approach => '1692185760000',
                                                miss_distance             => {
                                                    astronomical => '0.1470728362',
                                                    kilometers   => '22001783.030378894',
                                                    lunar        => '57.2113332818',
                                                    miles        => '13671274.0296769772',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51508.9788808378',
                                                    kilometers_per_second => '14.3080496891',
                                                    miles_per_hour        => '32005.6763495961',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2024-08-01',
                                                close_approach_date_full  => '2024-Aug-01 14:16',
                                                epoch_date_close_approach => '1722521760000',
                                                miss_distance             => {
                                                    astronomical => '0.3268193058',
                                                    kilometers   => '48891472.022558646',
                                                    lunar        => '127.1327099562',
                                                    miles        => '30379751.9869994748',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '99843.8794386538',
                                                    kilometers_per_second => '27.7344109552',
                                                    miles_per_hour        => '62039.1038656457',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2026-02-17',
                                                close_approach_date_full  => '2026-Feb-17 01:37',
                                                epoch_date_close_approach => '1771292220000',
                                                miss_distance             => {
                                                    astronomical => '0.0859102769',
                                                    kilometers   => '12851994.435350203',
                                                    lunar        => '33.4190977141',
                                                    miles        => '7985859.0329226814',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '162004.9217546376',
                                                    kilometers_per_second => '45.0013671541',
                                                    miles_per_hour        => '100663.5581869302',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2027-09-03',
                                                close_approach_date_full  => '2027-Sep-03 22:29',
                                                epoch_date_close_approach => '1820010540000',
                                                miss_distance             => {
                                                    astronomical => '0.1384016312',
                                                    kilometers   => '20704589.232045544',
                                                    lunar        => '53.8382345368',
                                                    miles        => '12865235.1799107472',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '63532.3228345332',
                                                    kilometers_per_second => '17.647867454',
                                                    miles_per_hour        => '39476.5147079354',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2027-10-27',
                                                close_approach_date_full  => '2027-Oct-27 08:34',
                                                epoch_date_close_approach => '1824626040000',
                                                miss_distance             => {
                                                    astronomical => '0.0464755868',
                                                    kilometers   => '6952648.792280116',
                                                    lunar        => '18.0790032652',
                                                    miles        => '4320175.6303169608',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '136480.4728715624',
                                                    kilometers_per_second => '37.9112424643',
                                                    miles_per_hour        => '84803.6582684439',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2028-07-25',
                                                close_approach_date_full  => '2028-Jul-25 02:35',
                                                epoch_date_close_approach => '1848105300000',
                                                miss_distance             => {
                                                    astronomical => '0.0460533054',
                                                    kilometers   => '6889476.394299498',
                                                    lunar        => '17.9147358006',
                                                    miles        => '4280922.1224211524',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '65323.4246746204',
                                                    kilometers_per_second => '18.145395743',
                                                    miles_per_hour        => '40589.4357374051',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2029-07-06',
                                                close_approach_date_full  => '2029-Jul-06 02:17',
                                                epoch_date_close_approach => '1877998620000',
                                                miss_distance             => {
                                                    astronomical => '0.04282169',
                                                    kilometers   => '6406033.6138003',
                                                    lunar        => '16.65763741',
                                                    miles        => '3980524.70823214',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '112547.8385701351',
                                                    kilometers_per_second => '31.2632884917',
                                                    miles_per_hour        => '69932.8500270931',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2031-03-17',
                                                close_approach_date_full  => '2031-Mar-17 00:49',
                                                epoch_date_close_approach => '1931474940000',
                                                miss_distance             => {
                                                    astronomical => '0.0796441489',
                                                    kilometers   => '11914595.033402843',
                                                    lunar        => '30.9815739221',
                                                    miles        => '7403386.0541835134',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100736.318168762',
                                                    kilometers_per_second => '27.9823106024',
                                                    miles_per_hour        => '62593.6305865844',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2031-08-28',
                                                close_approach_date_full  => '2031-Aug-28 10:32',
                                                epoch_date_close_approach => '1945679520000',
                                                miss_distance             => {
                                                    astronomical => '0.3539190723',
                                                    kilometers   => '52945539.368456001',
                                                    lunar        => '137.6745191247',
                                                    miles        => '32898832.6244187738',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '97872.4648506989',
                                                    kilometers_per_second => '27.1867957919',
                                                    miles_per_hour        => '60814.1435068134',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2032-08-09',
                                                close_approach_date_full  => '2032-Aug-09 05:03',
                                                epoch_date_close_approach => '1975640580000',
                                                miss_distance             => {
                                                    astronomical => '0.1365572263',
                                                    kilometers   => '20428670.187587981',
                                                    lunar        => '53.1207610307',
                                                    miles        => '12693787.0358408978',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51594.3478783357',
                                                    kilometers_per_second => '14.3317632995',
                                                    miles_per_hour        => '32058.7213247359',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2033-08-04',
                                                close_approach_date_full  => '2033-Aug-04 23:21',
                                                epoch_date_close_approach => '2006810460000',
                                                miss_distance             => {
                                                    astronomical => '0.3990271424',
                                                    kilometers   => '59693610.575226688',
                                                    lunar        => '155.2215583936',
                                                    miles        => '37091889.6376687744',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '109301.0423062885',
                                                    kilometers_per_second => '30.3614006406',
                                                    miles_per_hour        => '67915.417093038',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2035-03-31',
                                                close_approach_date_full  => '2035-Mar-31 08:59',
                                                epoch_date_close_approach => '2058944340000',
                                                miss_distance             => {
                                                    astronomical => '0.1418642403',
                                                    kilometers   => '21222588.178048161',
                                                    lunar        => '55.1851894767',
                                                    miles        => '13187104.7996641818',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '114704.6019378966',
                                                    kilometers_per_second => '31.8623894272',
                                                    miles_per_hour        => '71272.9789096891',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2036-09-01',
                                                close_approach_date_full  => '2036-Sep-01 06:49',
                                                epoch_date_close_approach => '2103864540000',
                                                miss_distance             => {
                                                    astronomical => '0.127172464',
                                                    kilometers   => '19024729.73705168',
                                                    lunar        => '49.470088496',
                                                    miles        => '11821418.892125984',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '57146.8897195546',
                                                    kilometers_per_second => '15.8741360332',
                                                    miles_per_hour        => '35508.8548926866',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2037-07-26',
                                                close_approach_date_full  => '2037-Jul-26 03:24',
                                                epoch_date_close_approach => '2132191440000',
                                                miss_distance             => {
                                                    astronomical => '0.1170882875',
                                                    kilometers   => '17516158.411947625',
                                                    lunar        => '45.5473438375',
                                                    miles        => '10884036.137722225',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '73622.2930485818',
                                                    kilometers_per_second => '20.4506369579',
                                                    miles_per_hour        => '45746.0298112146',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2040-08-30',
                                                close_approach_date_full  => '2040-Aug-30 18:25',
                                                epoch_date_close_approach => '2229963900000',
                                                miss_distance             => {
                                                    astronomical => '0.2809129708',
                                                    kilometers   => '42023982.087052196',
                                                    lunar        => '109.2751456412',
                                                    miles        => '26112491.6165684648',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '87656.0371261715',
                                                    kilometers_per_second => '24.3488992017',
                                                    miles_per_hour        => '54466.0526243147',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2041-08-02',
                                                close_approach_date_full  => '2041-Aug-02 14:58',
                                                epoch_date_close_approach => '2259068280000',
                                                miss_distance             => {
                                                    astronomical => '0.1070525931',
                                                    kilometers   => '16014839.905736697',
                                                    lunar        => '41.6434587159',
                                                    miles        => '9951160.0760005386',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52616.643002919',
                                                    kilometers_per_second => '14.6157341675',
                                                    miles_per_hour        => '32693.9357592304',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2042-01-04',
                                                close_approach_date_full  => '2042-Jan-04 00:08',
                                                epoch_date_close_approach => '2272406880000',
                                                miss_distance             => {
                                                    astronomical => '0.1112658659',
                                                    kilometers   => '16645136.542345633',
                                                    lunar        => '43.2824218351',
                                                    miles        => '10342808.2450224154',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '108537.360803978',
                                                    kilometers_per_second => '30.14926689',
                                                    miles_per_hour        => '67440.8951062274',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2042-08-08',
                                                close_approach_date_full  => '2042-Aug-08 21:09',
                                                epoch_date_close_approach => '2291144940000',
                                                miss_distance             => {
                                                    astronomical => '0.4787006082',
                                                    kilometers   => '71612591.354424534',
                                                    lunar        => '186.2145365898',
                                                    miles        => '44498000.8679212092',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '119894.3668336468',
                                                    kilometers_per_second => '33.3039907871',
                                                    miles_per_hour        => '74497.6969917179',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2045-08-27',
                                                close_approach_date_full  => '2045-Aug-27 17:08',
                                                epoch_date_close_approach => '2387466480000',
                                                miss_distance             => {
                                                    astronomical => '0.1371397313',
                                                    kilometers   => '20515811.694852331',
                                                    lunar        => '53.3473554757',
                                                    miles        => '12747934.2576149278',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53256.57927786',
                                                    kilometers_per_second => '14.7934942439',
                                                    miles_per_hour        => '33091.5672740681',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2046-06-24',
                                                close_approach_date_full  => '2046-Jun-24 11:35',
                                                epoch_date_close_approach => '2413452900000',
                                                miss_distance             => {
                                                    astronomical => '0.076774935',
                                                    kilometers   => '11485366.74538845',
                                                    lunar        => '29.865449715',
                                                    miles        => '7136675.96352261',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '97664.4283013597',
                                                    kilometers_per_second => '27.1290078615',
                                                    miles_per_hour        => '60684.8776853643',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2046-07-28',
                                                close_approach_date_full  => '2046-Jul-28 11:52',
                                                epoch_date_close_approach => '2416391520000',
                                                miss_distance             => {
                                                    astronomical => '0.1968900856',
                                                    kilometers   => '29454337.429877672',
                                                    lunar        => '76.5902432984',
                                                    miles        => '18302076.6003569936',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '83376.2840307527',
                                                    kilometers_per_second => '23.1600788974',
                                                    miles_per_hour        => '51806.7804856641',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2048-03-02',
                                                close_approach_date_full  => '2048-Mar-02 22:03',
                                                epoch_date_close_approach => '2466799380000',
                                                miss_distance             => {
                                                    astronomical => '0.0618477281',
                                                    kilometers   => '9252288.388099147',
                                                    lunar        => '24.0587662309',
                                                    miles        => '5749105.4148043486',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '112058.2362085056',
                                                    kilometers_per_second => '31.1272878357',
                                                    miles_per_hour        => '69628.6301596684',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2048-10-09',
                                                close_approach_date_full  => '2048-Oct-09 17:38',
                                                epoch_date_close_approach => '2485877880000',
                                                miss_distance             => {
                                                    astronomical => '0.0841197486',
                                                    kilometers   => '12584135.215495482',
                                                    lunar        => '32.7225822054',
                                                    miles        => '7819419.0316303716',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '102674.819738768',
                                                    kilometers_per_second => '28.5207832608',
                                                    miles_per_hour        => '63798.140076014',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2049-09-02',
                                                close_approach_date_full  => '2049-Sep-02 11:47',
                                                epoch_date_close_approach => '2514196020000',
                                                miss_distance             => {
                                                    astronomical => '0.2117602028',
                                                    kilometers   => '31678875.289648036',
                                                    lunar        => '82.3747188892',
                                                    miles        => '19684340.3299974568',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '77317.5885936646',
                                                    kilometers_per_second => '21.4771079427',
                                                    miles_per_hour        => '48042.1427569912',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2049-11-10',
                                                close_approach_date_full  => '2049-Nov-10 05:33',
                                                epoch_date_close_approach => '2520135180000',
                                                miss_distance             => {
                                                    astronomical => '0.0696046574',
                                                    kilometers   => '10412708.489119738',
                                                    lunar        => '27.0762117286',
                                                    miles        => '6470157.0299708644',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '126448.6518177671',
                                                    kilometers_per_second => '35.1246255049',
                                                    miles_per_hour        => '78570.2747919898',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2050-07-28',
                                                close_approach_date_full  => '2050-Jul-28 14:11',
                                                epoch_date_close_approach => '2542630260000',
                                                miss_distance             => {
                                                    astronomical => '0.0585971115',
                                                    kilometers   => '8766003.068552505',
                                                    lunar        => '22.7942763735',
                                                    miles        => '5446941.728754369',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '55688.979701628',
                                                    kilometers_per_second => '15.4691610282',
                                                    miles_per_hour        => '34602.9663040477',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2051-07-20',
                                                close_approach_date_full  => '2051-Jul-20 08:50',
                                                epoch_date_close_approach => '2573455800000',
                                                miss_distance             => {
                                                    astronomical => '0.0923955594',
                                                    kilometers   => '13822178.883698478',
                                                    lunar        => '35.9418726066',
                                                    miles        => '8588703.6948478764',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '139847.396265482',
                                                    kilometers_per_second => '38.8464989626',
                                                    miles_per_hour        => '86895.7335295158',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2053-08-22',
                                                close_approach_date_full  => '2053-Aug-22 19:46',
                                                epoch_date_close_approach => '2639504760000',
                                                miss_distance             => {
                                                    astronomical => '0.4692609284',
                                                    kilometers   => '70200435.362862508',
                                                    lunar        => '182.5425011476',
                                                    miles        => '43620527.8237302904',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '113913.3290937642',
                                                    kilometers_per_second => '31.6425914149',
                                                    miles_per_hour        => '70781.312736067',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2054-08-21',
                                                close_approach_date_full  => '2054-Aug-21 03:23',
                                                epoch_date_close_approach => '2670895380000',
                                                miss_distance             => {
                                                    astronomical => '0.1474042211',
                                                    kilometers   => '22051357.505569057',
                                                    lunar        => '57.3402420079',
                                                    miles        => '13702078.1801527066',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51726.0029283752',
                                                    kilometers_per_second => '14.3683341468',
                                                    miles_per_hour        => '32140.5266529118',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2055-07-16',
                                                close_approach_date_full  => '2055-Jul-16 12:04',
                                                epoch_date_close_approach => '2699352240000',
                                                miss_distance             => {
                                                    astronomical => '0.0616360723',
                                                    kilometers   => '9220625.131246001',
                                                    lunar        => '23.9764321247',
                                                    miles        => '5729430.7793207738',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '96484.268170413',
                                                    kilometers_per_second => '26.8011856029',
                                                    miles_per_hour        => '59951.5720751102',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2055-07-31',
                                                close_approach_date_full  => '2055-Jul-31 13:58',
                                                epoch_date_close_approach => '2700655080000',
                                                miss_distance             => {
                                                    astronomical => '0.2772139937',
                                                    kilometers   => '41470622.991713419',
                                                    lunar        => '107.8362435493',
                                                    miles        => '25768650.2188624222',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '93534.9773387296',
                                                    kilometers_per_second => '25.9819381496',
                                                    miles_per_hour        => '58118.9974469456',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2055-12-30',
                                                close_approach_date_full  => '2055-Dec-30 00:31',
                                                epoch_date_close_approach => '2713739460000',
                                                miss_distance             => {
                                                    astronomical => '0.0932708405',
                                                    kilometers   => '13953119.071909735',
                                                    lunar        => '36.2823569545',
                                                    miles        => '8670066.154974943',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '166324.8132583913',
                                                    kilometers_per_second => '46.2013370162',
                                                    miles_per_hour        => '103347.7707715821',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2057-09-07',
                                                close_approach_date_full  => '2057-Sep-07 11:45',
                                                epoch_date_close_approach => '2767088700000',
                                                miss_distance             => {
                                                    astronomical => '0.0474420501',
                                                    kilometers   => '7097229.643393287',
                                                    lunar        => '18.4549574889',
                                                    miles        => '4410014.0053378806',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '137395.6389990392',
                                                    kilometers_per_second => '38.1654552775',
                                                    miles_per_hour        => '85372.3069102641',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2058-09-03',
                                                close_approach_date_full  => '2058-Sep-03 23:45',
                                                epoch_date_close_approach => '2798322300000',
                                                miss_distance             => {
                                                    astronomical => '0.158563741',
                                                    kilometers   => '23720797.91283167',
                                                    lunar        => '61.681295249',
                                                    miles        => '14739420.347030246',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '68103.2928074069',
                                                    kilometers_per_second => '18.9175813354',
                                                    miles_per_hour        => '42316.7376891357',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2059-05-18',
                                                close_approach_date_full  => '2059-May-18 08:29',
                                                epoch_date_close_approach => '2820472140000',
                                                miss_distance             => {
                                                    astronomical => '0.0436342483',
                                                    kilometers   => '6527590.604731121',
                                                    lunar        => '16.9737225887',
                                                    miles        => '4056056.7199306298',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111777.4915260948',
                                                    kilometers_per_second => '31.0493032017',
                                                    miles_per_hour        => '69454.1863318671',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2059-07-26',
                                                close_approach_date_full  => '2059-Jul-26 08:27',
                                                epoch_date_close_approach => '2826433620000',
                                                miss_distance             => {
                                                    astronomical => '0.0159634684',
                                                    kilometers   => '2388100.870452308',
                                                    lunar        => '6.2097892076',
                                                    miles        => '1483897.0716775304',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '61259.4426068971',
                                                    kilometers_per_second => '17.0165118352',
                                                    miles_per_hour        => '38064.2353242689',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2061-01-26',
                                                close_approach_date_full  => '2061-Jan-26 23:41',
                                                epoch_date_close_approach => '2874008460000',
                                                miss_distance             => {
                                                    astronomical => '0.0868357901',
                                                    kilometers   => '12990449.238727087',
                                                    lunar        => '33.7791223489',
                                                    miles        => '8071890.8583923206',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101311.1619729415',
                                                    kilometers_per_second => '28.1419894369',
                                                    miles_per_hour        => '62950.8161714647',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2062-04-21',
                                                close_approach_date_full  => '2062-Apr-21 14:26',
                                                epoch_date_close_approach => '2912855160000',
                                                miss_distance             => {
                                                    astronomical => '0.05533293',
                                                    kilometers   => '8277688.4688591',
                                                    lunar        => '21.52450977',
                                                    miles        => '5143517.10649158',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '91958.3142473203',
                                                    kilometers_per_second => '25.5439761798',
                                                    miles_per_hour        => '57139.3203166197',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2062-08-26',
                                                close_approach_date_full  => '2062-Aug-26 22:02',
                                                epoch_date_close_approach => '2923855320000',
                                                miss_distance             => {
                                                    astronomical => '0.3881638716',
                                                    kilometers   => '58068488.402313492',
                                                    lunar        => '150.9957460524',
                                                    miles        => '36082085.5446585096',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '102649.8946724039',
                                                    kilometers_per_second => '28.5138596312',
                                                    miles_per_hour        => '63782.6526090834',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2063-08-13',
                                                close_approach_date_full  => '2063-Aug-13 06:27',
                                                epoch_date_close_approach => '2954212020000',
                                                miss_distance             => {
                                                    astronomical => '0.1441007005',
                                                    kilometers   => '21557157.860307935',
                                                    lunar        => '56.0551724945',
                                                    miles        => '13394996.760142103',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51409.4122797988',
                                                    kilometers_per_second => '14.2803922999',
                                                    miles_per_hour        => '31943.809535745',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2064-08-03',
                                                close_approach_date_full  => '2064-Aug-03 12:34',
                                                epoch_date_close_approach => '2984992440000',
                                                miss_distance             => {
                                                    astronomical => '0.3671915689',
                                                    kilometers   => '54931076.589398243',
                                                    lunar        => '142.8375203021',
                                                    miles        => '34132588.2435040334',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '105072.2181157446',
                                                    kilometers_per_second => '29.1867272544',
                                                    miles_per_hour        => '65287.7901953081',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2067-09-03',
                                                close_approach_date_full  => '2067-Sep-03 04:17',
                                                epoch_date_close_approach => '3082249020000',
                                                miss_distance             => {
                                                    astronomical => '0.1289645304',
                                                    kilometers   => '19292819.053390248',
                                                    lunar        => '50.1672023256',
                                                    miles        => '11988001.8687435024',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '59031.345575979',
                                                    kilometers_per_second => '16.3975959933',
                                                    miles_per_hour        => '36679.7824774743',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2068-07-25',
                                                close_approach_date_full  => '2068-Jul-25 16:22',
                                                epoch_date_close_approach => '3110458920000',
                                                miss_distance             => {
                                                    astronomical => '0.0952645521',
                                                    kilometers   => '14251374.080664027',
                                                    lunar        => '37.0579107669',
                                                    miles        => '8855393.2236844926',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '71076.6923236394',
                                                    kilometers_per_second => '19.7435256455',
                                                    miles_per_hour        => '44164.2925163192',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2069-01-25',
                                                close_approach_date_full  => '2069-Jan-25 23:05',
                                                epoch_date_close_approach => '3126380700000',
                                                miss_distance             => {
                                                    astronomical => '0.0576069442',
                                                    kilometers   => '8617876.149528854',
                                                    lunar        => '22.4091012938',
                                                    miles        => '5354899.9293080252',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89149.8948773386',
                                                    kilometers_per_second => '24.7638596881',
                                                    miles_per_hour        => '55394.2777364218',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2071-08-31',
                                                close_approach_date_full  => '2071-Aug-31 03:02',
                                                epoch_date_close_approach => '3208215720000',
                                                miss_distance             => {
                                                    astronomical => '0.2966900249',
                                                    kilometers   => '44384195.775286963',
                                                    lunar        => '115.4124196861',
                                                    miles        => '27579060.3967395694',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89747.0034950423',
                                                    kilometers_per_second => '24.9297231931',
                                                    miles_per_hour        => '55765.2978105722',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2072-08-03',
                                                close_approach_date_full  => '2072-Aug-03 17:18',
                                                epoch_date_close_approach => '3237470280000',
                                                miss_distance             => {
                                                    astronomical => '0.1143515268',
                                                    kilometers   => '17106744.840527916',
                                                    lunar        => '44.4827439252',
                                                    miles        => '10629638.3410246008',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52242.9132337992',
                                                    kilometers_per_second => '14.5119203427',
                                                    miles_per_hour        => '32461.7146146348',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2072-12-19',
                                                close_approach_date_full  => '2072-Dec-19 17:55',
                                                epoch_date_close_approach => '3249395700000',
                                                miss_distance             => {
                                                    astronomical => '0.0959291708',
                                                    kilometers   => '14350799.622546196',
                                                    lunar        => '37.3164474412',
                                                    miles        => '8917173.3906256648',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '87387.0896748773',
                                                    kilometers_per_second => '24.2741915764',
                                                    miles_per_hour        => '54298.9391371481',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2073-08-08',
                                                close_approach_date_full  => '2073-Aug-08 05:24',
                                                epoch_date_close_approach => '3269395440000',
                                                miss_distance             => {
                                                    astronomical => '0.4662803913',
                                                    kilometers   => '69754553.361246531',
                                                    lunar        => '181.3830722157',
                                                    miles        => '43343469.5952868878',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '118299.9654706306',
                                                    kilometers_per_second => '32.8611015196',
                                                    miles_per_hour        => '73506.9979892371',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2074-08-29',
                                                close_approach_date_full  => '2074-Aug-29 14:06',
                                                epoch_date_close_approach => '3302777160000',
                                                miss_distance             => {
                                                    astronomical => '0.0682964576',
                                                    kilometers   => '10217004.585505312',
                                                    lunar        => '26.5673220064',
                                                    miles        => '6348552.2631528256',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '103645.5636362126',
                                                    kilometers_per_second => '28.7904343434',
                                                    miles_per_hour        => '64401.3225827345',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2075-11-02',
                                                close_approach_date_full  => '2075-Nov-02 09:54',
                                                epoch_date_close_approach => '3339914040000',
                                                miss_distance             => {
                                                    astronomical => '0.0635694282',
                                                    kilometers   => '9509851.055837934',
                                                    lunar        => '24.7285075698',
                                                    miles        => '5909147.4352901292',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '86749.8442088843',
                                                    kilometers_per_second => '24.0971789469',
                                                    miles_per_hour        => '53902.9795863481',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2076-05-08',
                                                close_approach_date_full  => '2076-May-08 02:41',
                                                epoch_date_close_approach => '3356131260000',
                                                miss_distance             => {
                                                    astronomical => '0.063092324',
                                                    kilometers   => '9438477.28374988',
                                                    lunar        => '24.542914036',
                                                    miles        => '5864797.829833144',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '119436.2242962656',
                                                    kilometers_per_second => '33.1767289712',
                                                    miles_per_hour        => '74213.0250356435',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2076-08-28',
                                                close_approach_date_full  => '2076-Aug-28 03:23',
                                                epoch_date_close_approach => '3365810580000',
                                                miss_distance             => {
                                                    astronomical => '0.1369608984',
                                                    kilometers   => '20489058.673926408',
                                                    lunar        => '53.2777894776',
                                                    miles        => '12731310.7012561104',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53537.3432327063',
                                                    kilometers_per_second => '14.8714842313',
                                                    miles_per_hour        => '33266.0230770113',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2077-07-28',
                                                close_approach_date_full  => '2077-Jul-28 06:12',
                                                epoch_date_close_approach => '3394678320000',
                                                miss_distance             => {
                                                    astronomical => '0.1914084625',
                                                    kilometers   => '28634298.289974875',
                                                    lunar        => '74.4578919125',
                                                    miles        => '17792527.906908275',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '82754.6895126367',
                                                    kilometers_per_second => '22.9874137535',
                                                    miles_per_hour        => '51420.545825227',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2078-01-15',
                                                close_approach_date_full  => '2078-Jan-15 10:46',
                                                epoch_date_close_approach => '3409469160000',
                                                miss_distance             => {
                                                    astronomical => '0.0825838726',
                                                    kilometers   => '12354371.437311362',
                                                    lunar        => '32.1251264414',
                                                    miles        => '7676650.4401343156',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '134576.6836417358',
                                                    kilometers_per_second => '37.3824121227',
                                                    miles_per_hour        => '83620.7176772775',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2080-09-02',
                                                close_approach_date_full  => '2080-Sep-02 09:44',
                                                epoch_date_close_approach => '3492495840000',
                                                miss_distance             => {
                                                    astronomical => '0.2134285036',
                                                    kilometers   => '31928449.535847332',
                                                    lunar        => '83.0236879004',
                                                    miles        => '19839418.5755119016',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '77448.132197176',
                                                    kilometers_per_second => '21.5133700548',
                                                    miles_per_hour        => '48123.2574755175',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2081-07-28',
                                                close_approach_date_full  => '2081-Jul-28 11:23',
                                                epoch_date_close_approach => '3520927380000',
                                                miss_distance             => {
                                                    astronomical => '0.0582126008',
                                                    kilometers   => '8708481.086840296',
                                                    lunar        => '22.6447017112',
                                                    miles        => '5411199.2267202448',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '55686.9339367596',
                                                    kilometers_per_second => '15.4685927602',
                                                    miles_per_hour        => '34601.695145316',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2082-06-27',
                                                close_approach_date_full  => '2082-Jun-27 15:28',
                                                epoch_date_close_approach => '3549799680000',
                                                miss_distance             => {
                                                    astronomical => '0.0936600339',
                                                    kilometers   => '14011341.575567793',
                                                    lunar        => '36.4337531871',
                                                    miles        => '8706243.9411618234',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '166565.7033776903',
                                                    kilometers_per_second => '46.2682509382',
                                                    miles_per_hour        => '103497.4505237654',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2082-08-08',
                                                close_approach_date_full  => '2082-Aug-08 20:22',
                                                epoch_date_close_approach => '3553446120000',
                                                miss_distance             => {
                                                    astronomical => '0.0750954144',
                                                    kilometers   => '11234114.041007328',
                                                    lunar        => '29.2121162016',
                                                    miles        => '6980554.7724560064',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '83752.6270100522',
                                                    kilometers_per_second => '23.2646186139',
                                                    miles_per_hour        => '52040.6253774405',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2084-03-06',
                                                close_approach_date_full  => '2084-Mar-06 02:52',
                                                epoch_date_close_approach => '3603149520000',
                                                miss_distance             => {
                                                    astronomical => '0.047454638',
                                                    kilometers   => '7099112.76642106',
                                                    lunar        => '18.459854182',
                                                    miles        => '4411184.123728228',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '137469.995380548',
                                                    kilometers_per_second => '38.1861098279',
                                                    miles_per_hour        => '85418.5090740966',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2084-08-22',
                                                close_approach_date_full  => '2084-Aug-22 20:40',
                                                epoch_date_close_approach => '3617815200000',
                                                miss_distance             => {
                                                    astronomical => '0.4670723089',
                                                    kilometers   => '69873022.547422043',
                                                    lunar        => '181.6911281621',
                                                    miles        => '43417082.9340804734',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '113586.7248622447',
                                                    kilometers_per_second => '31.5518680173',
                                                    miles_per_hour        => '70578.3735678764',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2085-08-20',
                                                close_approach_date_full  => '2085-Aug-20 17:22',
                                                epoch_date_close_approach => '3649166520000',
                                                miss_distance             => {
                                                    astronomical => '0.1482686924',
                                                    kilometers   => '22180680.570725188',
                                                    lunar        => '57.6765213436',
                                                    miles        => '13782435.8066080744',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51769.1783549693',
                                                    kilometers_per_second => '14.3803273208',
                                                    miles_per_hour        => '32167.354183953',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2085-11-14',
                                                close_approach_date_full  => '2085-Nov-14 00:11',
                                                epoch_date_close_approach => '3656535060000',
                                                miss_distance             => {
                                                    astronomical => '0.0438607021',
                                                    kilometers   => '6561467.610864527',
                                                    lunar        => '17.0618131169',
                                                    miles        => '4077106.9154313926',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111635.1264667799',
                                                    kilometers_per_second => '31.0097573519',
                                                    miles_per_hour        => '69365.7262204278',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2086-07-31',
                                                close_approach_date_full  => '2086-Jul-31 15:41',
                                                epoch_date_close_approach => '3678968460000',
                                                miss_distance             => {
                                                    astronomical => '0.281341759',
                                                    kilometers   => '42088127.88845333',
                                                    lunar        => '109.441944251',
                                                    miles        => '26152349.969302754',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '94005.6605090906',
                                                    kilometers_per_second => '26.1126834747',
                                                    miles_per_hour        => '58411.4616646625',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2087-07-26',
                                                close_approach_date_full  => '2087-Jul-26 07:44',
                                                epoch_date_close_approach => '3710043840000',
                                                miss_distance             => {
                                                    astronomical => '0.084303211',
                                                    kilometers   => '12611580.79976057',
                                                    lunar        => '32.793949079',
                                                    miles        => '7836472.926893066',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100963.7253891724',
                                                    kilometers_per_second => '28.0454792748',
                                                    miles_per_hour        => '62734.9325897332',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2089-05-15',
                                                close_approach_date_full  => '2089-May-15 07:30',
                                                epoch_date_close_approach => '3766980600000',
                                                miss_distance             => {
                                                    astronomical => '0.0981557638',
                                                    kilometers   => '14683893.192703106',
                                                    lunar        => '38.1825921182',
                                                    miles        => '9124148.1375746228',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '79394.0662875442',
                                                    kilometers_per_second => '22.0539073021',
                                                    miles_per_hour        => '49332.3852440576',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2089-09-03',
                                                close_approach_date_full  => '2089-Sep-03 22:14',
                                                epoch_date_close_approach => '3776624040000',
                                                miss_distance             => {
                                                    astronomical => '0.1566852273',
                                                    kilometers   => '23439776.264545851',
                                                    lunar        => '60.9505534197',
                                                    miles        => '14564801.5919647038',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '67545.892883304',
                                                    kilometers_per_second => '18.7627480231',
                                                    miles_per_hour        => '41970.3910529619',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2090-07-26',
                                                close_approach_date_full  => '2090-Jul-26 04:11',
                                                epoch_date_close_approach => '3804725460000',
                                                miss_distance             => {
                                                    astronomical => '0.0175272611',
                                                    kilometers   => '2622040.927493857',
                                                    lunar        => '6.8181045679',
                                                    miles        => '1629260.6825229466',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '61821.8011354061',
                                                    kilometers_per_second => '17.1727225376',
                                                    miles_per_hour        => '38413.6630443861',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2093-08-27',
                                                close_approach_date_full  => '2093-Aug-27 04:53',
                                                epoch_date_close_approach => '3902187180000',
                                                miss_distance             => {
                                                    astronomical => '0.3811785155',
                                                    kilometers   => '57023494.008561985',
                                                    lunar        => '148.2784425295',
                                                    miles        => '35432756.138185993',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101566.6807391428',
                                                    kilometers_per_second => '28.212966872',
                                                    miles_per_hour        => '63109.5855959412',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2094-08-12',
                                                close_approach_date_full  => '2094-Aug-12 07:11',
                                                epoch_date_close_approach => '3932435460000',
                                                miss_distance             => {
                                                    astronomical => '0.1428309562',
                                                    kilometers   => '21367206.817583294',
                                                    lunar        => '55.5612419618',
                                                    miles        => '13276966.6553216972',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51475.1550506042',
                                                    kilometers_per_second => '14.2986541807',
                                                    miles_per_hour        => '31984.6595368602',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2095-08-04',
                                                close_approach_date_full  => '2095-Aug-04 21:09',
                                                epoch_date_close_approach => '3963330540000',
                                                miss_distance             => {
                                                    astronomical => '0.3776836024',
                                                    kilometers   => '56500662.452966888',
                                                    lunar        => '146.9189213336',
                                                    miles        => '35107883.6740755344',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '106504.392296493',
                                                    kilometers_per_second => '29.5845534157',
                                                    miles_per_hour        => '66177.6875355626',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2096-02-19',
                                                close_approach_date_full  => '2096-Feb-19 23:36',
                                                epoch_date_close_approach => '3980532960000',
                                                miss_distance             => {
                                                    astronomical => '0.110057645',
                                                    kilometers   => '16464389.26921615',
                                                    lunar        => '42.812423905',
                                                    miles        => '10230497.09743687',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '77513.7776034683',
                                                    kilometers_per_second => '21.5316048899',
                                                    miles_per_hour        => '48164.0469781106',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2098-09-02',
                                                close_approach_date_full  => '2098-Sep-02 17:14',
                                                epoch_date_close_approach => '4060516440000',
                                                miss_distance             => {
                                                    astronomical => '0.1292844781',
                                                    kilometers   => '19340682.547821647',
                                                    lunar        => '50.2916619809',
                                                    miles        => '12017742.8650748486',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '58127.1849403625',
                                                    kilometers_per_second => '16.1464402612',
                                                    miles_per_hour        => '36117.9722203047',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2099-06-18',
                                                close_approach_date_full  => '2099-Jun-18 04:38',
                                                epoch_date_close_approach => '4085440680000',
                                                miss_distance             => {
                                                    astronomical => '0.0982317715',
                                                    kilometers   => '14695263.782726705',
                                                    lunar        => '38.2121591135',
                                                    miles        => '9131213.494590329',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '86229.7794022162',
                                                    kilometers_per_second => '23.9527165006',
                                                    miles_per_hour        => '53579.831540227',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2099-07-26',
                                                close_approach_date_full  => '2099-Jul-26 18:38',
                                                epoch_date_close_approach => '4088774280000',
                                                miss_distance             => {
                                                    astronomical => '0.1060929324',
                                                    kilometers   => '15871276.709093988',
                                                    lunar        => '41.2701507036',
                                                    miles        => '9861954.0421455144',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '72389.0053988323',
                                                    kilometers_per_second => '20.1080570552',
                                                    miles_per_hour        => '44979.7128268467',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2101-02-26',
                                                close_approach_date_full  => '2101-Feb-26 04:13',
                                                epoch_date_close_approach => '4138834380000',
                                                miss_distance             => {
                                                    astronomical => '0.0683823049',
                                                    kilometers   => '10229847.158730563',
                                                    lunar        => '26.6007166061',
                                                    miles        => '6356532.2681172494',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '103487.0797690441',
                                                    kilometers_per_second => '28.746411047',
                                                    miles_per_hour        => '64302.8468709374',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2102-09-01',
                                                close_approach_date_full  => '2102-Sep-01 12:31',
                                                epoch_date_close_approach => '4186557060000',
                                                miss_distance             => {
                                                    astronomical => '0.285022386',
                                                    kilometers   => '42638741.84791782',
                                                    lunar        => '110.873708154',
                                                    miles        => '26494485.618673116',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '88024.3327957288',
                                                    kilometers_per_second => '24.4512035544',
                                                    miles_per_hour        => '54694.8972307682',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2102-11-05',
                                                close_approach_date_full  => '2102-Nov-05 19:36',
                                                epoch_date_close_approach => '4192198560000',
                                                miss_distance             => {
                                                    astronomical => '0.0637183785',
                                                    kilometers   => '9532133.703453795',
                                                    lunar        => '24.7864492365',
                                                    miles        => '5922993.230480571',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '120367.81513345',
                                                    kilometers_per_second => '33.4355042037',
                                                    miles_per_hour        => '74791.8793533373',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2102-11-27',
                                                close_approach_date_full  => '2102-Nov-27 17:14',
                                                epoch_date_close_approach => '4194090840000',
                                                miss_distance             => {
                                                    astronomical => '0.1194096712',
                                                    kilometers   => '17863432.468920344',
                                                    lunar        => '46.4503620968',
                                                    miles        => '11099822.2305909872',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '76154.567257715',
                                                    kilometers_per_second => '21.1540464605',
                                                    miles_per_hour        => '47319.4865274397',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2103-08-04',
                                                close_approach_date_full  => '2103-Aug-04 11:42',
                                                epoch_date_close_approach => '4215670920000',
                                                miss_distance             => {
                                                    astronomical => '0.1078638713',
                                                    kilometers   => '16136205.396434131',
                                                    lunar        => '41.9590459357',
                                                    miles        => '10026573.0949717678',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52593.064412702',
                                                    kilometers_per_second => '14.6091845591',
                                                    miles_per_hour        => '32679.2849402148',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2104-07-15',
                                                close_approach_date_full  => '2104-Jul-15 05:15',
                                                epoch_date_close_approach => '4245542100000',
                                                miss_distance             => {
                                                    astronomical => '0.0854925732',
                                                    kilometers   => '12789506.851539084',
                                                    lunar        => '33.2566109748',
                                                    miles        => '7947031.0488199992',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '136146.7682963294',
                                                    kilometers_per_second => '37.818546749',
                                                    miles_per_hour        => '84596.3072227943',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2104-08-09',
                                                close_approach_date_full  => '2104-Aug-09 19:00',
                                                epoch_date_close_approach => '4247751600000',
                                                miss_distance             => {
                                                    astronomical => '0.4798609885',
                                                    kilometers   => '71786181.775694495',
                                                    lunar        => '186.6659245265',
                                                    miles        => '44605864.953974231',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '120039.8452202628',
                                                    kilometers_per_second => '33.3444014501',
                                                    miles_per_hour        => '74588.0916036683',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2107-08-28',
                                                close_approach_date_full  => '2107-Aug-28 21:57',
                                                epoch_date_close_approach => '4344011820000',
                                                miss_distance             => {
                                                    astronomical => '0.1400169186',
                                                    kilometers   => '20946232.786523382',
                                                    lunar        => '54.4665813354',
                                                    miles        => '13015385.5220993916',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52985.0709984629',
                                                    kilometers_per_second => '14.7180752774',
                                                    miles_per_hour        => '32922.862587906',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2108-07-29',
                                                close_approach_date_full  => '2108-Jul-29 15:39',
                                                epoch_date_close_approach => '4373019540000',
                                                miss_distance             => {
                                                    astronomical => '0.2071043291',
                                                    kilometers   => '30982366.501139017',
                                                    lunar        => '80.5635840199',
                                                    miles        => '19251549.8375797546',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '84657.1095092477',
                                                    kilometers_per_second => '23.5158637526',
                                                    miles_per_hour        => '52602.6356281211',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2108-12-25',
                                                close_approach_date_full  => '2108-Dec-25 14:32',
                                                epoch_date_close_approach => '4385889120000',
                                                miss_distance             => {
                                                    astronomical => '0.0833685149',
                                                    kilometers   => '12471752.254103263',
                                                    lunar        => '32.4303522961',
                                                    miles        => '7749587.4975525094',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '160587.4964039215',
                                                    kilometers_per_second => '44.60763789',
                                                    miles_per_hour        => '99782.8251960922',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2109-09-03',
                                                close_approach_date_full  => '2109-Sep-03 12:02',
                                                epoch_date_close_approach => '4407652920000',
                                                miss_distance             => {
                                                    astronomical => '0.1314008985',
                                                    kilometers   => '19657294.531686195',
                                                    lunar        => '51.1149495165',
                                                    miles        => '12214476.429191691',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '74558.2885884364',
                                                    kilometers_per_second => '20.710635719',
                                                    miles_per_hour        => '46327.6210398537',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2110-09-04',
                                                close_approach_date_full  => '2110-Sep-04 10:34',
                                                epoch_date_close_approach => '4439270040000',
                                                miss_distance             => {
                                                    astronomical => '0.0375962532',
                                                    kilometers   => '5624319.398700684',
                                                    lunar        => '14.6249424948',
                                                    miles        => '3494790.0187860792',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '127423.0285346725',
                                                    kilometers_per_second => '35.3952857041',
                                                    miles_per_hour        => '79175.7145914469',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2111-09-04',
                                                close_approach_date_full  => '2111-Sep-04 16:53',
                                                epoch_date_close_approach => '4470828780000',
                                                miss_distance             => {
                                                    astronomical => '0.2016434115',
                                                    kilometers   => '30165424.859933505',
                                                    lunar        => '78.4392870735',
                                                    miles        => '18743925.840572169',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '75467.9328508224',
                                                    kilometers_per_second => '20.9633146808',
                                                    miles_per_hour        => '46892.8386094457',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2112-05-15',
                                                close_approach_date_full  => '2112-May-15 02:28',
                                                epoch_date_close_approach => '4492722480000',
                                                miss_distance             => {
                                                    astronomical => '0.0620997766',
                                                    kilometers   => '9289994.306835842',
                                                    lunar        => '24.1568130974',
                                                    miles        => '5772534.7862729396',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '102968.9597718176',
                                                    kilometers_per_second => '28.6024888255',
                                                    miles_per_hour        => '63980.9072537719',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2112-07-28',
                                                close_approach_date_full  => '2112-Jul-28 14:51',
                                                epoch_date_close_approach => '4499160660000',
                                                miss_distance             => {
                                                    astronomical => '0.0464126554',
                                                    kilometers   => '6943234.388883998',
                                                    lunar        => '18.0545229506',
                                                    miles        => '4314325.7913072524',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '56708.5524544588',
                                                    kilometers_per_second => '15.7523756818',
                                                    miles_per_hour        => '35236.4891626052',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2115-08-25',
                                                close_approach_date_full  => '2115-Aug-25 14:46',
                                                epoch_date_close_approach => '4596187560000',
                                                miss_distance             => {
                                                    astronomical => '0.4501343815',
                                                    kilometers   => '67339144.686167405',
                                                    lunar        => '175.1022744035',
                                                    miles        => '41842604.240643989',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111144.0087663199',
                                                    kilometers_per_second => '30.8733357684',
                                                    miles_per_hour        => '69060.5647803836',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2116-08-19',
                                                close_approach_date_full  => '2116-Aug-19 21:23',
                                                epoch_date_close_approach => '4627315380000',
                                                miss_distance             => {
                                                    astronomical => '0.1493197315',
                                                    kilometers   => '22337913.781371905',
                                                    lunar        => '58.0853755535',
                                                    miles        => '13880135.993286089',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51543.5632938338',
                                                    kilometers_per_second => '14.3176564705',
                                                    miles_per_hour        => '32027.1657588825',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2117-08-02',
                                                close_approach_date_full  => '2117-Aug-02 07:27',
                                                epoch_date_close_approach => '4657332420000',
                                                miss_distance             => {
                                                    astronomical => '0.3003484569',
                                                    kilometers   => '44931489.410026803',
                                                    lunar        => '116.8355497341',
                                                    miles        => '27919132.8919957614',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '96517.1982660368',
                                                    kilometers_per_second => '26.8103328517',
                                                    miles_per_hour        => '59972.0335559161',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2120-09-04',
                                                close_approach_date_full  => '2120-Sep-04 20:41',
                                                epoch_date_close_approach => '4754925660000',
                                                miss_distance             => {
                                                    astronomical => '0.1481816971',
                                                    kilometers   => '22167666.259145177',
                                                    lunar        => '57.6426801719',
                                                    miles        => '13774349.0883783626',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '65418.2953122989',
                                                    kilometers_per_second => '18.1717486979',
                                                    miles_per_hour        => '40648.3846622448',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2121-07-26',
                                                close_approach_date_full  => '2121-Jul-26 20:53',
                                                epoch_date_close_approach => '4783006380000',
                                                miss_distance             => {
                                                    astronomical => '0.0308557208',
                                                    kilometers   => '4615950.108994696',
                                                    lunar        => '12.0028753912',
                                                    miles        => '2868218.3966749648',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '63640.4033458336',
                                                    kilometers_per_second => '17.6778898183',
                                                    miles_per_hour        => '39543.6717345264',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2124-08-28',
                                                close_approach_date_full  => '2124-Aug-28 23:15',
                                                epoch_date_close_approach => '4880560500000',
                                                miss_distance             => {
                                                    astronomical => '0.3619003183',
                                                    kilometers   => '54139516.770002021',
                                                    lunar        => '140.7792238187',
                                                    miles        => '33640735.7792330498',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '98864.9493020521',
                                                    kilometers_per_second => '27.4624859172',
                                                    miles_per_hour        => '61430.8347482668',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2125-08-11',
                                                close_approach_date_full  => '2125-Aug-11 07:21',
                                                epoch_date_close_approach => '4910570460000',
                                                miss_distance             => {
                                                    astronomical => '0.1387252289',
                                                    kilometers   => '20752998.758702443',
                                                    lunar        => '53.9641140421',
                                                    miles        => '12895315.4649339934',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51467.7639117737',
                                                    kilometers_per_second => '14.2966010866',
                                                    miles_per_hour        => '31980.066970624',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2125-12-16',
                                                close_approach_date_full  => '2125-Dec-16 09:00',
                                                epoch_date_close_approach => '4921549200000',
                                                miss_distance             => {
                                                    astronomical => '0.0896433614',
                                                    kilometers   => '13410455.925080218',
                                                    lunar        => '34.8712675846',
                                                    miles        => '8332870.9114862884',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '90355.399756961',
                                                    kilometers_per_second => '25.0987221547',
                                                    miles_per_hour        => '56143.3315878739',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2126-08-06',
                                                close_approach_date_full  => '2126-Aug-06 16:24',
                                                epoch_date_close_approach => '4941707040000',
                                                miss_distance             => {
                                                    astronomical => '0.3979732507',
                                                    kilometers   => '59535950.621696009',
                                                    lunar        => '154.8115945223',
                                                    miles        => '36993924.2852585642',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '109104.9576346879',
                                                    kilometers_per_second => '30.3069326763',
                                                    miles_per_hour        => '67793.5777036204',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2127-08-26',
                                                close_approach_date_full  => '2127-Aug-26 04:58',
                                                epoch_date_close_approach => '4974929880000',
                                                miss_distance             => {
                                                    astronomical => '0.064374585',
                                                    kilometers   => '9630300.79813395',
                                                    lunar        => '25.041713565',
                                                    miles        => '5983991.43459051',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107192.4034496598',
                                                    kilometers_per_second => '29.7756676249',
                                                    miles_per_hour        => '66605.1909101511',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2129-05-04',
                                                close_approach_date_full  => '2129-May-04 19:12',
                                                epoch_date_close_approach => '5028289920000',
                                                miss_distance             => {
                                                    astronomical => '0.0666681727',
                                                    kilometers   => '9973416.632712149',
                                                    lunar        => '25.9339191803',
                                                    miles        => '6197193.7278756962',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '123951.0448714378',
                                                    kilometers_per_second => '34.4308457976',
                                                    miles_per_hour        => '77018.3589646998',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2129-09-02',
                                                close_approach_date_full  => '2129-Sep-02 17:57',
                                                epoch_date_close_approach => '5038739820000',
                                                miss_distance             => {
                                                    astronomical => '0.1299554375',
                                                    kilometers   => '19441056.644918125',
                                                    lunar        => '50.5526651875',
                                                    miles        => '12080112.436895125',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '56628.364052628',
                                                    kilometers_per_second => '15.7301011257',
                                                    miles_per_hour        => '35186.6632081454',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2130-07-28',
                                                close_approach_date_full  => '2130-Jul-28 02:24',
                                                epoch_date_close_approach => '5067109440000',
                                                miss_distance             => {
                                                    astronomical => '0.127574085',
                                                    kilometers   => '19084811.38319895',
                                                    lunar        => '49.626319065',
                                                    miles        => '11858751.89588751',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '74916.0238351532',
                                                    kilometers_per_second => '20.8100066209',
                                                    miles_per_hour        => '46549.9038102373',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2131-01-12',
                                                close_approach_date_full  => '2131-Jan-12 05:54',
                                                epoch_date_close_approach => '5081637240000',
                                                miss_distance             => {
                                                    astronomical => '0.0937454101',
                                                    kilometers   => '14024113.673236487',
                                                    lunar        => '36.4669645289',
                                                    miles        => '8714180.1546460406',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '140364.8225975786',
                                                    kilometers_per_second => '38.9902284993',
                                                    miles_per_hour        => '87217.2421301455',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2133-09-02',
                                                close_approach_date_full  => '2133-Sep-02 05:39',
                                                epoch_date_close_approach => '5164925940000',
                                                miss_distance             => {
                                                    astronomical => '0.2652426956',
                                                    kilometers   => '39679742.294818372',
                                                    lunar        => '103.1794085884',
                                                    miles        => '24655848.5551106536',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '85146.7384033625',
                                                    kilometers_per_second => '23.6518717787',
                                                    miles_per_hour        => '52906.8719818004',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2134-08-02',
                                                close_approach_date_full  => '2134-Aug-02 15:25',
                                                epoch_date_close_approach => '5193818700000',
                                                miss_distance             => {
                                                    astronomical => '0.096183386',
                                                    kilometers   => '14388829.67498782',
                                                    lunar        => '37.415337154',
                                                    miles        => '8940804.169439116',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53120.4291315446',
                                                    kilometers_per_second => '14.7556747588',
                                                    miles_per_hour        => '33006.9688678756',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2135-06-24',
                                                close_approach_date_full  => '2135-Jun-24 22:43',
                                                epoch_date_close_approach => '5222011380000',
                                                miss_distance             => {
                                                    astronomical => '0.0622638665',
                                                    kilometers   => '9314541.806364355',
                                                    lunar        => '24.2206440685',
                                                    miles        => '5787787.895183899',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '147852.9566571899',
                                                    kilometers_per_second => '41.0702657381',
                                                    miles_per_hour        => '91870.0774295745',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2137-03-04',
                                                close_approach_date_full  => '2137-Mar-04 00:34',
                                                epoch_date_close_approach => '5275413240000',
                                                miss_distance             => {
                                                    astronomical => '0.0387525246',
                                                    kilometers   => '5797295.137282602',
                                                    lunar        => '15.0747320694',
                                                    miles        => '3602272.1587278276',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '115835.8067748187',
                                                    kilometers_per_second => '32.176612993',
                                                    miles_per_hour        => '71975.8656040533',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2138-08-26',
                                                close_approach_date_full  => '2138-Aug-26 20:50',
                                                epoch_date_close_approach => '5322142200000',
                                                miss_distance             => {
                                                    astronomical => '0.1440201185',
                                                    kilometers   => '21545102.964747595',
                                                    lunar        => '56.0238260965',
                                                    miles        => '13387506.195383011',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52434.7012503673',
                                                    kilometers_per_second => '14.5651947918',
                                                    miles_per_hour        => '32580.8842297074',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2138-11-13',
                                                close_approach_date_full  => '2138-Nov-13 12:07',
                                                epoch_date_close_approach => '5328936420000',
                                                miss_distance             => {
                                                    astronomical => '0.0815436076',
                                                    kilometers   => '12198750.009075812',
                                                    lunar        => '31.7204633564',
                                                    miles        => '7579951.7686057256',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100631.3983880774',
                                                    kilometers_per_second => '27.9531662189',
                                                    miles_per_hour        => '62528.4375150807',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2139-07-31',
                                                close_approach_date_full  => '2139-Jul-31 09:14',
                                                epoch_date_close_approach => '5351390040000',
                                                miss_distance             => {
                                                    astronomical => '0.2315440829',
                                                    kilometers   => '34638501.612943423',
                                                    lunar        => '90.0706482481',
                                                    miles        => '21523366.8505003174',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '87801.613063438',
                                                    kilometers_per_second => '24.3893369621',
                                                    miles_per_hour        => '54556.5078504457',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2142-09-05',
                                                close_approach_date_full  => '2142-Sep-05 02:47',
                                                epoch_date_close_approach => '5449171620000',
                                                miss_distance             => {
                                                    astronomical => '0.1829704186',
                                                    kilometers   => '27371984.895568382',
                                                    lunar        => '71.1754928354',
                                                    miles        => '17008162.7351203916',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '72241.5580901068',
                                                    kilometers_per_second => '20.0670994695',
                                                    miles_per_hour        => '44888.0948032666',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2143-07-28',
                                                close_approach_date_full  => '2143-Jul-28 12:48',
                                                epoch_date_close_approach => '5477374080000',
                                                miss_distance             => {
                                                    astronomical => '0.0266534299',
                                                    kilometers   => '3987296.341234313',
                                                    lunar        => '10.3681842311',
                                                    miles        => '2477591.0590189994',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '58509.3895326814',
                                                    kilometers_per_second => '16.2526082035',
                                                    miles_per_hour        => '36355.4592904597',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2146-08-26',
                                                close_approach_date_full  => '2146-Aug-26 16:03',
                                                epoch_date_close_approach => '5574585780000',
                                                miss_distance             => {
                                                    astronomical => '0.4257064723',
                                                    kilometers   => '63684781.501294001',
                                                    lunar        => '165.5998177247',
                                                    miles        => '39571888.2520631738',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107761.7914761348',
                                                    kilometers_per_second => '29.9338309656',
                                                    miles_per_hour        => '66958.986486935',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2147-08-18',
                                                close_approach_date_full  => '2147-Aug-18 10:56',
                                                epoch_date_close_approach => '5605412160000',
                                                miss_distance             => {
                                                    astronomical => '0.1490344185',
                                                    kilometers   => '22295231.564288595',
                                                    lunar        => '57.9743887965',
                                                    miles        => '13853614.493408811',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51451.791084284',
                                                    kilometers_per_second => '14.2921641901',
                                                    miles_per_hour        => '31970.1420767875',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2148-08-03',
                                                close_approach_date_full  => '2148-Aug-03 05:46',
                                                epoch_date_close_approach => '5635719960000',
                                                miss_distance             => {
                                                    astronomical => '0.3256919898',
                                                    kilometers   => '48722827.950141726',
                                                    lunar        => '126.6941840322',
                                                    miles        => '30274961.4196027788',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '99705.0518331214',
                                                    kilometers_per_second => '27.6958477314',
                                                    miles_per_hour        => '61952.8417904192',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2149-09-03',
                                                close_approach_date_full  => '2149-Sep-03 02:48',
                                                epoch_date_close_approach => '5669923680000',
                                                miss_distance             => {
                                                    astronomical => '0.1259206437',
                                                    kilometers   => '18837460.086548919',
                                                    lunar        => '48.9831303993',
                                                    miles        => '11705054.9271723222',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111711.7672866104',
                                                    kilometers_per_second => '31.0310464685',
                                                    miles_per_hour        => '69413.3478453941',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2151-09-05',
                                                close_approach_date_full  => '2151-Sep-05 14:27',
                                                epoch_date_close_approach => '5733210420000',
                                                miss_distance             => {
                                                    astronomical => '0.1394007327',
                                                    kilometers   => '20854052.688359349',
                                                    lunar        => '54.2268850203',
                                                    miles        => '12958107.4651190562',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '63031.0378731509',
                                                    kilometers_per_second => '17.5086216314',
                                                    miles_per_hour        => '39165.0357273476',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2152-06-14',
                                                close_approach_date_full  => '2152-Jun-14 15:56',
                                                epoch_date_close_approach => '5757666960000',
                                                miss_distance             => {
                                                    astronomical => '0.0797831276',
                                                    kilometers   => '11935385.950898212',
                                                    lunar        => '31.0356366364',
                                                    miles        => '7416304.9312588456',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '95577.6219494375',
                                                    kilometers_per_second => '26.5493394304',
                                                    miles_per_hour        => '59388.2173718602',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2152-07-26',
                                                close_approach_date_full  => '2152-Jul-26 17:38',
                                                epoch_date_close_approach => '5761301880000',
                                                miss_distance             => {
                                                    astronomical => '0.051185285',
                                                    kilometers   => '7657209.61134295',
                                                    lunar        => '19.911075865',
                                                    miles        => '4757969.42251471',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '66016.5985075342',
                                                    kilometers_per_second => '18.3379440299',
                                                    miles_per_hour        => '41020.1470004175',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2154-02-22',
                                                close_approach_date_full  => '2154-Feb-22 07:11',
                                                epoch_date_close_approach => '5811030660000',
                                                miss_distance             => {
                                                    astronomical => '0.0614628846',
                                                    kilometers   => '9194716.620215802',
                                                    lunar        => '23.9090621094',
                                                    miles        => '5713331.9770779876',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111527.3216206228',
                                                    kilometers_per_second => '30.9798115613',
                                                    miles_per_hour        => '69298.7404814364',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2155-08-30',
                                                close_approach_date_full  => '2155-Aug-30 18:22',
                                                epoch_date_close_approach => '5858936520000',
                                                miss_distance             => {
                                                    astronomical => '0.3416661635',
                                                    kilometers   => '51112530.310671745',
                                                    lunar        => '132.9081376015',
                                                    miles        => '31759853.611070281',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '96032.8964848734',
                                                    kilometers_per_second => '26.6758045791',
                                                    miles_per_hour        => '59671.1072630593',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2155-11-01',
                                                close_approach_date_full  => '2155-Nov-01 18:14',
                                                epoch_date_close_approach => '5864379240000',
                                                miss_distance             => {
                                                    astronomical => '0.0705717933',
                                                    kilometers   => '10557389.959760271',
                                                    lunar        => '27.4524275937',
                                                    miles        => '6560057.9270668998',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '127355.3126243924',
                                                    kilometers_per_second => '35.376475729',
                                                    miles_per_hour        => '79133.6385581954',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2156-06-09',
                                                close_approach_date_full  => '2156-Jun-09 03:14',
                                                epoch_date_close_approach => '5883419640000',
                                                miss_distance             => {
                                                    astronomical => '0.1058358292',
                                                    kilometers   => '15832814.618003804',
                                                    lunar        => '41.1701375588',
                                                    miles        => '9838054.8069643352',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '107652.9203202712',
                                                    kilometers_per_second => '29.9035889779',
                                                    miles_per_hour        => '66891.3381845596',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2156-08-09',
                                                close_approach_date_full  => '2156-Aug-09 07:55',
                                                epoch_date_close_approach => '5888706900000',
                                                miss_distance             => {
                                                    astronomical => '0.1332394103',
                                                    kilometers   => '19932331.980936061',
                                                    lunar        => '51.8301306067',
                                                    miles        => '12385376.7754012018',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51642.9982120972',
                                                    kilometers_per_second => '14.3452772811',
                                                    miles_per_hour        => '32088.9507501778',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2157-07-11',
                                                close_approach_date_full  => '2157-Jul-11 02:43',
                                                epoch_date_close_approach => '5917718580000',
                                                miss_distance             => {
                                                    astronomical => '0.0988459753',
                                                    kilometers   => '14787147.362952611',
                                                    lunar        => '38.4510843917',
                                                    miles        => '9188307.3038675918',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '142955.661287255',
                                                    kilometers_per_second => '39.7099059131',
                                                    miles_per_hour        => '88827.0885370724',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2157-08-07',
                                                close_approach_date_full  => '2157-Aug-07 11:35',
                                                epoch_date_close_approach => '5920083300000',
                                                miss_distance             => {
                                                    astronomical => '0.4178092163',
                                                    kilometers   => '62503368.824849281',
                                                    lunar        => '162.5277851407',
                                                    miles        => '38837792.4553948378',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '111848.0953746683',
                                                    kilometers_per_second => '31.0689153819',
                                                    miles_per_hour        => '69498.0568176654',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2160-09-01',
                                                close_approach_date_full  => '2160-Sep-01 18:24',
                                                epoch_date_close_approach => '6016962240000',
                                                miss_distance             => {
                                                    astronomical => '0.1315750801',
                                                    kilometers   => '19683351.728039387',
                                                    lunar        => '51.1827061589',
                                                    miles        => '12230667.6202100606',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '55635.2424240631',
                                                    kilometers_per_second => '15.4542340067',
                                                    miles_per_hour        => '34569.5760495519',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2161-07-28',
                                                close_approach_date_full  => '2161-Jul-28 09:10',
                                                epoch_date_close_approach => '6045441000000',
                                                miss_distance             => {
                                                    astronomical => '0.143775222',
                                                    kilometers   => '21508466.96997714',
                                                    lunar        => '55.928561358',
                                                    miles        => '13364741.643838932',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '76977.2125896026',
                                                    kilometers_per_second => '21.3825590527',
                                                    miles_per_hour        => '47830.6463449117',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2161-12-21',
                                                close_approach_date_full  => '2161-Dec-21 12:50',
                                                epoch_date_close_approach => '6058068600000',
                                                miss_distance             => {
                                                    astronomical => '0.0628406889',
                                                    kilometers   => '9400833.208772643',
                                                    lunar        => '24.4450279821',
                                                    miles        => '5841406.8862947534',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '148264.7407923859',
                                                    kilometers_per_second => '41.1846502201',
                                                    miles_per_hour        => '92125.9440773578',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2163-03-16',
                                                close_approach_date_full  => '2163-Mar-16 08:34',
                                                epoch_date_close_approach => '6096933240000',
                                                miss_distance             => {
                                                    astronomical => '0.0921591096',
                                                    kilometers   => '13786806.497256552',
                                                    lunar        => '35.8498936344',
                                                    miles        => '8566724.3131103376',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '104786.8852328122',
                                                    kilometers_per_second => '29.1074681202',
                                                    miles_per_hour        => '65110.4954381326',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2163-08-31',
                                                close_approach_date_full  => '2163-Aug-31 14:44',
                                                epoch_date_close_approach => '6111470640000',
                                                miss_distance             => {
                                                    astronomical => '0.0385096412',
                                                    kilometers   => '5760960.297984244',
                                                    lunar        => '14.9802504268',
                                                    miles        => '3579694.7365168072',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '116024.8091832104',
                                                    kilometers_per_second => '32.229113662',
                                                    miles_per_hour        => '72093.3043505343',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2164-09-02',
                                                close_approach_date_full  => '2164-Sep-02 15:03',
                                                epoch_date_close_approach => '6143266980000',
                                                miss_distance             => {
                                                    astronomical => '0.2522018513',
                                                    kilometers   => '37728859.764536731',
                                                    lunar        => '98.1065201557',
                                                    miles        => '23443626.3622836478',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '83181.9641709269',
                                                    kilometers_per_second => '23.1061011586',
                                                    miles_per_hour        => '51686.0376816518',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2165-05-12',
                                                close_approach_date_full  => '2165-May-12 04:16',
                                                epoch_date_close_approach => '6165000960000',
                                                miss_distance             => {
                                                    astronomical => '0.0821261548',
                                                    kilometers   => '12285897.829370276',
                                                    lunar        => '31.9470742172',
                                                    miles        => '7634102.9131147688',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '100601.2715538431',
                                                    kilometers_per_second => '27.9447976538',
                                                    miles_per_hour        => '62509.7178718866',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2165-08-01',
                                                close_approach_date_full  => '2165-Aug-01 13:30',
                                                epoch_date_close_approach => '6172032600000',
                                                miss_distance             => {
                                                    astronomical => '0.0879657562',
                                                    kilometers   => '13159489.760459294',
                                                    lunar        => '34.2186791618',
                                                    miles        => '8176927.7679704972',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53619.8449555595',
                                                    kilometers_per_second => '14.8944013765',
                                                    miles_per_hour        => '33317.2864391919',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2169-08-25',
                                                close_approach_date_full  => '2169-Aug-25 15:25',
                                                epoch_date_close_approach => '6300343500000',
                                                miss_distance             => {
                                                    astronomical => '0.1461586461',
                                                    kilometers   => '21865022.138643807',
                                                    lunar        => '56.8557133329',
                                                    miles        => '13586294.7520942566',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52220.1465870257',
                                                    kilometers_per_second => '14.5055962742',
                                                    miles_per_hour        => '32447.5683056994',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2169-12-20',
                                                close_approach_date_full  => '2169-Dec-20 15:51',
                                                epoch_date_close_approach => '6310453860000',
                                                miss_distance             => {
                                                    astronomical => '0.0807353119',
                                                    kilometers   => '12077830.694025653',
                                                    lunar        => '31.4060363291',
                                                    miles        => '7504815.9903258914',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '102265.5806975779',
                                                    kilometers_per_second => '28.4071057493',
                                                    miles_per_hour        => '63543.85485067',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2170-07-31',
                                                close_approach_date_full  => '2170-Jul-31 18:13',
                                                epoch_date_close_approach => '6329729580000',
                                                miss_distance             => {
                                                    astronomical => '0.2442449058',
                                                    kilometers   => '36538517.666030646',
                                                    lunar        => '95.0112683562',
                                                    miles        => '22703982.0800330748',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89356.5109861981',
                                                    kilometers_per_second => '24.8212530517',
                                                    miles_per_hour        => '55522.6609513963',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2173-09-05',
                                                close_approach_date_full  => '2173-Sep-05 05:11',
                                                epoch_date_close_approach => '6427487460000',
                                                miss_distance             => {
                                                    astronomical => '0.1754174124',
                                                    kilometers   => '26242071.255951588',
                                                    lunar        => '68.2373734236',
                                                    miles        => '16306066.9560763944',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '70924.5431491064',
                                                    kilometers_per_second => '19.7012619859',
                                                    miles_per_hour        => '44069.7529361767',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2174-07-28',
                                                close_approach_date_full  => '2174-Jul-28 02:52',
                                                epoch_date_close_approach => '6455645520000',
                                                miss_distance             => {
                                                    astronomical => '0.0185910373',
                                                    kilometers   => '2781179.581170551',
                                                    lunar        => '7.2319135097',
                                                    miles        => '1728144.8565975638',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '59487.8980590022',
                                                    kilometers_per_second => '16.5244161275',
                                                    miles_per_hour        => '36963.4664356061',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2176-09-25',
                                                close_approach_date_full  => '2176-Sep-25 20:14',
                                                epoch_date_close_approach => '6523964040000',
                                                miss_distance             => {
                                                    astronomical => '0.0674155682',
                                                    kilometers   => '10085225.407559734',
                                                    lunar        => '26.2246560298',
                                                    miles        => '6266668.4789789692',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '98919.7184402345',
                                                    kilometers_per_second => '27.4776995667',
                                                    miles_per_hour        => '61464.8661608224',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2177-08-27',
                                                close_approach_date_full  => '2177-Aug-27 01:42',
                                                epoch_date_close_approach => '6552927720000',
                                                miss_distance             => {
                                                    astronomical => '0.4157519974',
                                                    kilometers   => '62195613.259285538',
                                                    lunar        => '161.7275269886',
                                                    miles        => '38646562.0144269044',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '106347.023702014',
                                                    kilometers_per_second => '29.5408399172',
                                                    miles_per_hour        => '66079.9048108431',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2178-08-17',
                                                close_approach_date_full  => '2178-Aug-17 08:49',
                                                epoch_date_close_approach => '6583625340000',
                                                miss_distance             => {
                                                    astronomical => '0.1486289533',
                                                    kilometers   => '22234574.834009471',
                                                    lunar        => '57.8166628337',
                                                    miles        => '13815924.1489378598',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51454.0711191168',
                                                    kilometers_per_second => '14.2927975331',
                                                    miles_per_hour        => '31971.5588017645',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2178-12-12',
                                                close_approach_date_full  => '2178-Dec-12 14:34',
                                                epoch_date_close_approach => '6593754840000',
                                                miss_distance             => {
                                                    astronomical => '0.0750648416',
                                                    kilometers   => '11229540.415247392',
                                                    lunar        => '29.2002233824',
                                                    miles        => '6977712.8531903296',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '98306.9380842221',
                                                    kilometers_per_second => '27.3074828012',
                                                    miles_per_hour        => '61084.1082779434',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2179-08-04',
                                                close_approach_date_full  => '2179-Aug-04 12:48',
                                                epoch_date_close_approach => '6614052480000',
                                                miss_distance             => {
                                                    astronomical => '0.3351824616',
                                                    kilometers   => '50142582.316716792',
                                                    lunar        => '130.3859775624',
                                                    miles        => '31157155.8750920496',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '101037.92222857',
                                                    kilometers_per_second => '28.0660895079',
                                                    miles_per_hour        => '62781.0356203023',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2180-08-21',
                                                close_approach_date_full  => '2180-Aug-21 00:07',
                                                epoch_date_close_approach => '6647098020000',
                                                miss_distance             => {
                                                    astronomical => '0.0610131178',
                                                    kilometers   => '9127432.464939086',
                                                    lunar        => '23.7341028242',
                                                    miles        => '5671523.5416719468',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '112402.4766093475',
                                                    kilometers_per_second => '31.2229101693',
                                                    miles_per_hour        => '69842.5277576249',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2182-04-30',
                                                close_approach_date_full  => '2182-Apr-30 07:05',
                                                epoch_date_close_approach => '6700431900000',
                                                miss_distance             => {
                                                    astronomical => '0.0693084011',
                                                    kilometers   => '10368389.177665657',
                                                    lunar        => '26.9609680279',
                                                    miles        => '6442618.2868217866',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '126607.7524867045',
                                                    kilometers_per_second => '35.1688201352',
                                                    miles_per_hour        => '78669.1337604193',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2182-09-05',
                                                close_approach_date_full  => '2182-Sep-05 09:40',
                                                epoch_date_close_approach => '6711500400000',
                                                miss_distance             => {
                                                    astronomical => '0.1373929775',
                                                    kilometers   => '20553696.786957925',
                                                    lunar        => '53.4458682475',
                                                    miles        => '12771474.962252365',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '62109.0499247989',
                                                    kilometers_per_second => '17.252513868',
                                                    miles_per_hour        => '38592.1482713285',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2183-07-02',
                                                close_approach_date_full  => '2183-Jul-02 18:08',
                                                epoch_date_close_approach => '6737450880000',
                                                miss_distance             => {
                                                    astronomical => '0.0537010983',
                                                    kilometers   => '8033569.922340621',
                                                    lunar        => '20.8897272387',
                                                    miles        => '4991828.8755617298',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '93325.004534974',
                                                    kilometers_per_second => '25.9236123708',
                                                    miles_per_hour        => '57988.5285123009',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2183-07-27',
                                                close_approach_date_full  => '2183-Jul-27 16:07',
                                                epoch_date_close_approach => '6739603620000',
                                                miss_distance             => {
                                                    astronomical => '0.0587770786',
                                                    kilometers   => '8792925.763382582',
                                                    lunar        => '22.8642835754',
                                                    miles        => '5463670.7155883516',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '66970.1716154752',
                                                    kilometers_per_second => '18.6028254487',
                                                    miles_per_hour        => '41612.6602462934',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2184-01-07',
                                                close_approach_date_full  => '2184-Jan-07 12:34',
                                                epoch_date_close_approach => '6753760440000',
                                                miss_distance             => {
                                                    astronomical => '0.0944987293',
                                                    kilometers   => '14136808.620986591',
                                                    lunar        => '36.7600056977',
                                                    miles        => '8784205.5480573158',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '140924.9532792136',
                                                    kilometers_per_second => '39.1458203553',
                                                    miles_per_hour        => '87565.2855528536',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2186-08-30',
                                                close_approach_date_full  => '2186-Aug-30 23:06',
                                                epoch_date_close_approach => '6837260760000',
                                                miss_distance             => {
                                                    astronomical => '0.3348532657',
                                                    kilometers   => '50093335.311264059',
                                                    lunar        => '130.2579203573',
                                                    miles        => '31126555.2048756542',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '95023.5554913707',
                                                    kilometers_per_second => '26.3954320809',
                                                    miles_per_hour        => '59043.9420218464',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2187-08-09',
                                                close_approach_date_full  => '2187-Aug-09 13:32',
                                                epoch_date_close_approach => '6866947920000',
                                                miss_distance             => {
                                                    astronomical => '0.1311847704',
                                                    kilometers   => '19624962.228279048',
                                                    lunar        => '51.0308756856',
                                                    miles        => '12194386.0674569424',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '51733.3327082658',
                                                    kilometers_per_second => '14.3703701967',
                                                    miles_per_hour        => '32145.0810930888',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2188-06-18',
                                                close_approach_date_full  => '2188-Jun-18 18:11',
                                                epoch_date_close_approach => '6894094260000',
                                                miss_distance             => {
                                                    astronomical => '0.0737608509',
                                                    kilometers   => '11034466.184027583',
                                                    lunar        => '28.6929710001',
                                                    miles        => '6856499.3466553254',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '155028.7834611937',
                                                    kilometers_per_second => '43.0635509614',
                                                    miles_per_hour        => '96328.8571456512',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2188-08-07',
                                                close_approach_date_full  => '2188-Aug-07 17:05',
                                                epoch_date_close_approach => '6898410300000',
                                                miss_distance             => {
                                                    astronomical => '0.4243416088',
                                                    kilometers   => '63480600.828853256',
                                                    lunar        => '165.0688858232',
                                                    miles        => '39445016.2653406928',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '112666.8834775159',
                                                    kilometers_per_second => '31.2963565215',
                                                    miles_per_hour        => '70006.8199030154',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2190-02-26',
                                                close_approach_date_full  => '2190-Feb-26 12:44',
                                                epoch_date_close_approach => '6947469840000',
                                                miss_distance             => {
                                                    astronomical => '0.0359537239',
                                                    kilometers   => '5378600.514008093',
                                                    lunar        => '13.9859985971',
                                                    miles        => '3342107.3838259634',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '124129.5398132148',
                                                    kilometers_per_second => '34.4804277259',
                                                    miles_per_hour        => '77129.2687800501',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2190-04-08',
                                                close_approach_date_full  => '2190-Apr-08 00:43',
                                                epoch_date_close_approach => '6950968980000',
                                                miss_distance             => {
                                                    astronomical => '0.054381866',
                                                    kilometers   => '8135411.32022542',
                                                    lunar        => '21.154545874',
                                                    miles        => '5055110.185813996',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '89925.8539003193',
                                                    kilometers_per_second => '24.9794038612',
                                                    miles_per_hour        => '55876.4284971178',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2191-09-02',
                                                close_approach_date_full  => '2191-Sep-02 09:17',
                                                epoch_date_close_approach => '6995236620000',
                                                miss_distance             => {
                                                    astronomical => '0.1327626972',
                                                    kilometers   => '19861016.716574964',
                                                    lunar        => '51.6446892108',
                                                    miles        => '12341063.5249599432',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '55305.2787467144',
                                                    kilometers_per_second => '15.3625774296',
                                                    miles_per_hour        => '34364.5494523682',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2191-11-07',
                                                close_approach_date_full  => '2191-Nov-07 02:57',
                                                epoch_date_close_approach => '7000916220000',
                                                miss_distance             => {
                                                    astronomical => '0.0643044397',
                                                    kilometers   => '9619807.210663439',
                                                    lunar        => '25.0144270433',
                                                    miles        => '5977471.0216918982',
                                                },
                                                orbiting_body     => 'Merc',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '102310.3565751812',
                                                    kilometers_per_second => '28.4195434931',
                                                    miles_per_hour        => '63571.6768397286',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2192-07-28',
                                                close_approach_date_full  => '2192-Jul-28 09:17',
                                                epoch_date_close_approach => '7023748620000',
                                                miss_distance             => {
                                                    astronomical => '0.1470280684',
                                                    kilometers   => '21995085.862854308',
                                                    lunar        => '57.1939186076',
                                                    miles        => '13667112.6027451304',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '77335.231449267',
                                                    kilometers_per_second => '21.4820087359',
                                                    miles_per_hour        => '48053.1053413515',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2195-09-03',
                                                close_approach_date_full  => '2195-Sep-03 14:04',
                                                epoch_date_close_approach => '7121570640000',
                                                miss_distance             => {
                                                    astronomical => '0.2514726456',
                                                    kilometers   => '37619772.145024872',
                                                    lunar        => '97.8228591384',
                                                    miles        => '23375842.4587003536',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '83061.9165604532',
                                                    kilometers_per_second => '23.0727546001',
                                                    miles_per_hour        => '51611.4447650216',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2196-08-01',
                                                close_approach_date_full  => '2196-Aug-01 09:17',
                                                epoch_date_close_approach => '7150324620000',
                                                miss_distance             => {
                                                    astronomical => '0.0876420247',
                                                    kilometers   => '13111060.217607389',
                                                    lunar        => '34.0927476083',
                                                    miles        => '8146835.0454604082',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '53670.6595736892',
                                                    kilometers_per_second => '14.9085165482',
                                                    miles_per_hour        => '33348.8606667737',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2197-01-12',
                                                close_approach_date_full  => '2197-Jan-12 08:34',
                                                epoch_date_close_approach => '7164491640000',
                                                miss_distance             => {
                                                    astronomical => '0.0627000676',
                                                    kilometers   => '9379796.561816012',
                                                    lunar        => '24.3903262964',
                                                    miles        => '5828335.3200124856',
                                                },
                                                orbiting_body     => 'Venus',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '86498.6387327172',
                                                    kilometers_per_second => '24.027399648',
                                                    miles_per_hour        => '53746.8902725598',
                                                },
                                            },
                                            {
                                                close_approach_date       => '2200-08-27',
                                                close_approach_date_full  => '2200-Aug-27 00:50',
                                                epoch_date_close_approach => '7278684600000',
                                                miss_distance             => {
                                                    astronomical => '0.1459280246',
                                                    kilometers   => '21830521.653467602',
                                                    lunar        => '56.7660015694',
                                                    miles        => '13564857.1446808276',
                                                },
                                                orbiting_body     => 'Earth',
                                                relative_velocity => {
                                                    kilometers_per_hour   => '52252.4549096647',
                                                    kilometers_per_second => '14.5145708082',
                                                    miles_per_hour        => '32467.6434409525',
                                                },
                                            },
                                        ],
                                        designation        => '2010 PK9',
                                        estimated_diameter => {
                                            feet => {
                                                estimated_diameter_max => '824.1856145234',
                                                estimated_diameter_min => '368.5870120303',
                                            },
                                            kilometers => {
                                                estimated_diameter_max => '0.2512117673',
                                                estimated_diameter_min => '0.1123453177',
                                            },
                                            meters => {
                                                estimated_diameter_max => '251.2117672679',
                                                estimated_diameter_min => '112.3453176718',
                                            },
                                            miles => {
                                                estimated_diameter_max => '0.156095707',
                                                estimated_diameter_min => '0.0698081224',
                                            },
                                        },
                                        id                                => '3542519',
                                        is_potentially_hazardous_asteroid => 1,
                                        is_sentry_object                  => '',
                                        links                             => {
                                            self => 'http://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY',
                                        },
                                        name             => '(2010 PK9)',
                                        nasa_jpl_url     => 'http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3542519',
                                        neo_reference_id => '3542519',
                                        orbital_data     => {
                                            aphelion_distance           => '1.143004608224172',
                                            ascending_node_longitude    => '306.5280898357266',
                                            data_arc_in_days            => 3304,
                                            eccentricity                => '.6758397835550958',
                                            epoch_osculation            => '2460000.5',
                                            equinox                     => 'J2000',
                                            first_observation_date      => '2010-07-18',
                                            inclination                 => '12.59219906149941',
                                            jupiter_tisserand_invariant => '8.150',
                                            last_observation_date       => '2019-08-04',
                                            mean_anomaly                => '244.6247926221936',
                                            mean_motion                 => '1.749769515952095',
                                            minimum_orbit_intersection  => '.0156523',
                                            observations_used           => 106,
                                            orbit_class                 => {
                                                orbit_class_description => 'Near-Earth asteroid orbits similar to that of 2062 Aten',
                                                orbit_class_range       => 'a (semi-major axis) < 1.0 AU; q (perihelion) > 0.983 AU',
                                                orbit_class_type        => 'ATE',
                                            },
                                            orbit_determination_date => '2023-03-01 06:01:11',
                                            orbit_id                 => '26',
                                            orbit_uncertainty        => '0',
                                            orbital_period           => '205.7413829181466',
                                            perihelion_argument      => '195.6367907331395',
                                            perihelion_distance      => '.221093104982544',
                                            perihelion_time          => '2460066.437374223272',
                                            semi_major_axis          => '.6820488566033581',
                                        },
                                    },
                                    schema => {
                                        properties => {
                                            links => {
                                                properties => {
                                                    next => {
                                                        example => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=2&size=20&api_key=DEMO_KEY',
                                                        type    => 'string',
                                                    },
                                                    prev => {
                                                        example => 'http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=20&api_key=DEMO_KEY',
                                                        type    => 'string',
                                                    },
                                                    self => {
                                                        example => 1,
                                                        type    => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            near_earth_objects => {
                                                items => {
                                                    '$ref' => '#/components/schemas/ClosestApproachData',
                                                },
                                                type => 'array',
                                            },
                                            page => {
                                                properties => {
                                                    number => {
                                                        example => 1,
                                                        type    => 'integer',
                                                    },
                                                    size => {
                                                        example => 20,
                                                        type    => 'integer',
                                                    },
                                                    total_elements => {
                                                        example => 32803,
                                                        type    => 'integer',
                                                    },
                                                    total_pages => {
                                                        example => 1641,
                                                        type    => 'integer',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                        },
                                        type => 'object',
                                    },
                                },
                            },
                            description => 'successful operation',
                        },
                        400 => {
                            description => 'Bad request',
                        },
                    },
                    tags => [
                        'asteroids',
                    ],
                },
            },
            '/planetary/apod' => {
                get => {
                    description =>
                      'One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
The full documentation for this API can be found in the APOD API Github repository.
',
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
                                        properties => {
                                            date => {
                                                example => '2014-02-04T03:30:01.210000',
                                                format  => 'date-time',
                                                type    => 'string',
                                            },
                                            id => {
                                                example => 'LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204',
                                                type    => 'string',
                                            },
                                            resource => {
                                                properties => {
                                                    dataset => {
                                                        example => 'LANDSAT/LC08/C01/T1_SR',
                                                        type    => 'string',
                                                    },
                                                    planet => {
                                                        example => 'earth',
                                                        type    => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            service_version => {
                                                example => 'v5000',
                                                type    => 'string',
                                            },
                                            url => {
                                                example =>
                                                  'https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels',
                                                type => 'string',
                                            },
                                        },
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
                                    example => 'pretend this is binary content',
                                    schema  => {
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
            {
                description => 'APIs related to asteroids',
                name        => 'asteroids',
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
      contact:
        name: Curtis "Ovid" Poe
        email: curtis.poe@gmail.com
        url: https://ovid.github.io
      license:
        name: MIT
        url: https://opensource.org/license/mit/
    
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
                  example: pretend this is binary content
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
                    properties:
                      id:
                        type: string
                        example: LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204
                      date:
                        type: string
                        format: date-time
                        example: 2014-02-04T03:30:01.210000
                      resource:
                        type: object
                        properties:
                          dataset:
                            type: string
                            example: LANDSAT/LC08/C01/T1_SR
                          planet:
                            type: string
                            example: earth
                      service_version:
                        type: string
                        example: v5000
                      url:
                        type: string
                        example: https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels
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
              example: 2018-02-04
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
            - name: count
              in: query
              description: If this is specified then count randomly chosen images will be returned. Cannot be used with date or start_date and end_date.
              schema:
                type: integer
            - name: thumbs
              in: query
              description: Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.
              schema:
                type: boolean
          responses:
            "200":
              content:
                application/json:
                  schema:
                    oneOf:
                      - type: array
                        items:
                          $ref: '#/components/schemas/APODImage'
                        example: [{"copyright":"Petr Horalek","date":"2021-01-01","explanation":"The South Celestial Pole is easy to spot in star trail images of the southern sky.","hdurl":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.png","media_type":"image","service_version":"v1","title":"Galaxies and the South Celestial Pole","url":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.jpg"},{"copyright":"Mike Smolinsky","date":"2021-01-02","explanation":"In the mid 19th century, one of the first photographic technologies used to record the lunar surface was the wet-plate collodion process, notably employed by British astronomer Warren De la Rue.","hdurl":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO.jpg","media_type":"image","service_version":"v1","title":"21st Century Wet Collodion Moon","url":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO_1024.jpg"}]
                      - $ref: '#/components/schemas/APODImage'
                        example: {"copyright":"Tianyao Yang","date":"2023-06-12","explanation":"What\u2019s that near the Moon? It\u2019s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \u2014 it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.","hdurl":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg","media_type":"image","service_version":"v1","title":"The Largest Satellites of Earth","url":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg"}
              description: successful operation
            '400':
              description: Bad request
          security:
            - api_key: []
          summary: Returns Astronomy Picture of the Day images
          tags:
            - images
      /neo/rest/v1/neo/browse:
        get:
          description: Browse the overall Asteroid data-set
          parameters:
            - name: page
              in: query
              description: Page number of query
              schema:
                type: integer
                minimum: 0
            - name: size
              in: query
              description: Number of elements per page
              schema:
                type: integer
                minimum: 1
                maximum: 1000
          responses:
            "200":
              content:
                application/json:
                  schema:
                    type: object
                    properties:
                      links:
                        type: object
                        properties:
                          next:
                            type: string
                            example: http://api.nasa.gov/neo/rest/v1/neo/browse?page=2&size=20&api_key=DEMO_KEY
                          prev:
                            type: string
                            example: http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=20&api_key=DEMO_KEY
                          self:
                            type: string
                            example: 1
                      page:
                        type: object
                        properties:
                          size:
                            type: integer
                            example: 20
                          total_elements:
                            type: integer
                            example: 32803
                          total_pages:
                            type: integer
                            example: 1641
                          number:
                            type: integer
                            example: 1
                      near_earth_objects:
                        type: array
                        items:
                          type: object
                  example: {"links":{"next":"http://api.nasa.gov/neo/rest/v1/neo/browse?page=1&size=2&api_key=DEMO_KEY","self":"http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=2&api_key=DEMO_KEY"},"page":{"size":2,"total_elements":32803,"total_pages":1641,"number":0},"near_earth_objects":[{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2000433?api_key=DEMO_KEY"},"id":"2000433","neo_reference_id":"2000433","name":"433 Eros (A898 PA)","name_limited":"Eros","designation":"433","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000433","absolute_magnitude_h":10.31,"estimated_diameter":{"kilometers":{"estimated_diameter_min":23.0438466577,"estimated_diameter_max":51.5276075896},"meters":{"estimated_diameter_min":23043.8466576534,"estimated_diameter_max":51527.6075895943},"miles":{"estimated_diameter_min":14.3187780415,"estimated_diameter_max":32.0177610556},"feet":{"estimated_diameter_min":75603.1738682955,"estimated_diameter_max":169053.8360842445}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"1900-12-27","close_approach_date_full":"1900-Dec-27 01:30","epoch_date_close_approach":-2177879400000,"relative_velocity":{"kilometers_per_second":"5.5786191875","kilometers_per_hour":"20083.0290749201","miles_per_hour":"12478.8132604691"},"miss_distance":{"astronomical":"0.3149291693","lunar":"122.5074468577","kilometers":"47112732.928149391","miles":"29274494.7651919558"},"orbiting_body":"Earth"},{"close_approach_date":"1907-11-05","close_approach_date_full":"1907-Nov-05 03:31","epoch_date_close_approach":-1961526540000,"relative_velocity":{"kilometers_per_second":"4.3944908885","kilometers_per_hour":"15820.1671985367","miles_per_hour":"9830.0366684463"},"miss_distance":{"astronomical":"0.4714855425","lunar":"183.4078760325","kilometers":"70533232.893794475","miles":"43827318.620434755"},"orbiting_body":"Earth"},{"close_approach_date":"1917-04-20","close_approach_date_full":"1917-Apr-20 21:19","epoch_date_close_approach":-1663036860000,"relative_velocity":{"kilometers_per_second":"4.8167840184","kilometers_per_hour":"17340.4224662258","miles_per_hour":"10774.6641707501"},"miss_distance":{"astronomical":"0.499257206","lunar":"194.211053134","kilometers":"74687814.59975122","miles":"46408855.985038036"},"orbiting_body":"Earth"},{"close_approach_date":"1924-03-05","close_approach_date_full":"1924-Mar-05 22:13","epoch_date_close_approach":-1446083220000,"relative_velocity":{"kilometers_per_second":"4.5960548855","kilometers_per_hour":"16545.797587763","miles_per_hour":"10280.915173352"},"miss_distance":{"astronomical":"0.3597864889","lunar":"139.9569441821","kilometers":"53823292.394218643","miles":"33444243.0636095534"},"orbiting_body":"Earth"},{"close_approach_date":"1931-01-30","close_approach_date_full":"1931-Jan-30 04:07","epoch_date_close_approach":-1228247580000,"relative_velocity":{"kilometers_per_second":"5.9208185341","kilometers_per_hour":"21314.9467227704","miles_per_hour":"13244.2789789347"},"miss_distance":{"astronomical":"0.1740731458","lunar":"67.7144537162","kilometers":"26040971.835879446","miles":"16181109.5707945148"},"orbiting_body":"Earth"},{"close_approach_date":"1938-01-13","close_approach_date_full":"1938-Jan-13 22:04","epoch_date_close_approach":-1008726960000,"relative_velocity":{"kilometers_per_second":"6.0840524046","kilometers_per_hour":"21902.5886564605","miles_per_hour":"13609.4168237879"},"miss_distance":{"astronomical":"0.2150052405","lunar":"83.6370385545","kilometers":"32164326.017637735","miles":"19985985.424901343"},"orbiting_body":"Earth"},{"close_approach_date":"1944-11-27","close_approach_date_full":"1944-Nov-27 01:41","epoch_date_close_approach":-791936340000,"relative_velocity":{"kilometers_per_second":"3.626098636","kilometers_per_hour":"13053.9550896485","miles_per_hour":"8111.2200388986"},"miss_distance":{"astronomical":"0.4030090561","lunar":"156.7705228229","kilometers":"60289296.383270507","miles":"37462031.6350747166"},"orbiting_body":"Earth"},{"close_approach_date":"1961-04-04","close_approach_date_full":"1961-Apr-04 09:08","epoch_date_close_approach":-275928720000,"relative_velocity":{"kilometers_per_second":"3.7078364482","kilometers_per_hour":"13348.2112136055","miles_per_hour":"8294.0593510317"},"miss_distance":{"astronomical":"0.4424921301","lunar":"172.1294386089","kilometers":"66195880.154722887","miles":"41132212.6021023606"},"orbiting_body":"Earth"},{"close_approach_date":"1968-02-11","close_approach_date_full":"1968-Feb-11 13:46","epoch_date_close_approach":-59566440000,"relative_velocity":{"kilometers_per_second":"6.0668849725","kilometers_per_hour":"21840.7859008821","miles_per_hour":"13571.014994912"},"miss_distance":{"astronomical":"0.2662714057","lunar":"103.5795768173","kilometers":"39833635.134625859","miles":"24751473.1315964942"},"orbiting_body":"Earth"},{"close_approach_date":"1975-01-23","close_approach_date_full":"1975-Jan-23 07:39","epoch_date_close_approach":159694740000,"relative_velocity":{"kilometers_per_second":"5.8253076833","kilometers_per_hour":"20971.1076598791","miles_per_hour":"13030.6307567732"},"miss_distance":{"astronomical":"0.1511341909","lunar":"58.7912002601","kilometers":"22609353.042813383","miles":"14048800.5292673654"},"orbiting_body":"Earth"},{"close_approach_date":"1981-12-29","close_approach_date_full":"1981-Dec-29 08:05","epoch_date_close_approach":378461100000,"relative_velocity":{"kilometers_per_second":"5.6652718459","kilometers_per_hour":"20394.9786453535","miles_per_hour":"12672.6465921642"},"miss_distance":{"astronomical":"0.3084893271","lunar":"120.0023482419","kilometers":"46149346.251893277","miles":"28675874.0429781426"},"orbiting_body":"Earth"},{"close_approach_date":"1988-11-06","close_approach_date_full":"1988-Nov-06 14:56","epoch_date_close_approach":594831360000,"relative_velocity":{"kilometers_per_second":"4.305902138","kilometers_per_hour":"15501.2476969045","miles_per_hour":"9631.8724925571"},"miss_distance":{"astronomical":"0.4676402077","lunar":"181.9120407953","kilometers":"69957978.998277599","miles":"43469872.4247609062"},"orbiting_body":"Earth"},{"close_approach_date":"2005-03-08","close_approach_date_full":"2005-Mar-08 22:07","epoch_date_close_approach":1110319620000,"relative_velocity":{"kilometers_per_second":"4.4122923953","kilometers_per_hour":"15884.2526231559","miles_per_hour":"9869.8568590937"},"miss_distance":{"astronomical":"0.3655672222","lunar":"142.2056494358","kilometers":"54688077.782936714","miles":"33981595.7867820932"},"orbiting_body":"Earth"},{"close_approach_date":"2012-01-31","close_approach_date_full":"2012-Jan-31 11:01","epoch_date_close_approach":1328007660000,"relative_velocity":{"kilometers_per_second":"5.9451959021","kilometers_per_hour":"21402.705247412","miles_per_hour":"13298.8087133156"},"miss_distance":{"astronomical":"0.1786758136","lunar":"69.5048914904","kilometers":"26729521.135077032","miles":"16608954.2658937616"},"orbiting_body":"Earth"},{"close_approach_date":"2019-01-15","close_approach_date_full":"2019-Jan-15 06:01","epoch_date_close_approach":1547532060000,"relative_velocity":{"kilometers_per_second":"6.0449176185","kilometers_per_hour":"21761.7034264303","miles_per_hour":"13521.8762207172"},"miss_distance":{"astronomical":"0.2085986871","lunar":"81.1448892819","kilometers":"31205919.274956477","miles":"19390459.0899223026"},"orbiting_body":"Earth"},{"close_approach_date":"2025-11-30","close_approach_date_full":"2025-Nov-30 02:18","epoch_date_close_approach":1764469080000,"relative_velocity":{"kilometers_per_second":"3.7288508677","kilometers_per_hour":"13423.8631236067","miles_per_hour":"8341.0665058878"},"miss_distance":{"astronomical":"0.3976474744","lunar":"154.6848675416","kilometers":"59487215.181119528","miles":"36963641.4867163664"},"orbiting_body":"Earth"},{"close_approach_date":"2042-04-06","close_approach_date_full":"2042-Apr-06 19:02","epoch_date_close_approach":2280423720000,"relative_velocity":{"kilometers_per_second":"3.7252247205","kilometers_per_hour":"13410.8089939193","miles_per_hour":"8332.9551773606"},"miss_distance":{"astronomical":"0.4461417254","lunar":"173.5491311806","kilometers":"66741851.837964898","miles":"41471463.6747876724"},"orbiting_body":"Earth"},{"close_approach_date":"2049-02-12","close_approach_date_full":"2049-Feb-12 05:38","epoch_date_close_approach":2496721080000,"relative_velocity":{"kilometers_per_second":"6.0590645856","kilometers_per_hour":"21812.6325080767","miles_per_hour":"13553.5215714769"},"miss_distance":{"astronomical":"0.2725553389","lunar":"106.0240268321","kilometers":"40773698.156568143","miles":"25335601.2070526534"},"orbiting_body":"Earth"},{"close_approach_date":"2056-01-24","close_approach_date_full":"2056-Jan-24 11:03","epoch_date_close_approach":2715937380000,"relative_velocity":{"kilometers_per_second":"5.8207578574","kilometers_per_hour":"20954.7282866821","miles_per_hour":"13020.4532512442"},"miss_distance":{"astronomical":"0.1497821765","lunar":"58.2652666585","kilometers":"22407094.568364055","miles":"13923122.940991759"},"orbiting_body":"Earth"},{"close_approach_date":"2062-12-31","close_approach_date_full":"2062-Dec-31 08:25","epoch_date_close_approach":2934779100000,"relative_velocity":{"kilometers_per_second":"5.7322434825","kilometers_per_hour":"20636.0765370681","miles_per_hour":"12822.4554460466"},"miss_distance":{"astronomical":"0.3029535232","lunar":"117.8489205248","kilometers":"45321201.779715584","miles":"28161288.9295956992"},"orbiting_body":"Earth"},{"close_approach_date":"2069-11-08","close_approach_date_full":"2069-Nov-08 21:29","epoch_date_close_approach":3151171740000,"relative_velocity":{"kilometers_per_second":"4.2454176851","kilometers_per_hour":"15283.5036662481","miles_per_hour":"9496.5748197307"},"miss_distance":{"astronomical":"0.4647282185","lunar":"180.7792769965","kilometers":"69522351.616494595","miles":"43199186.121611611"},"orbiting_body":"Earth"},{"close_approach_date":"2086-03-11","close_approach_date_full":"2086-Mar-11 22:55","epoch_date_close_approach":3666725700000,"relative_velocity":{"kilometers_per_second":"4.2258643769","kilometers_per_hour":"15213.1117567663","miles_per_hour":"9452.8360246418"},"miss_distance":{"astronomical":"0.3713100271","lunar":"144.4396005419","kilometers":"55547189.163802277","miles":"34515422.8449623426"},"orbiting_body":"Earth"},{"close_approach_date":"2093-01-31","close_approach_date_full":"2093-Jan-31 15:47","epoch_date_close_approach":3884255220000,"relative_velocity":{"kilometers_per_second":"5.9749136221","kilometers_per_hour":"21509.6890394877","miles_per_hour":"13365.2842812306"},"miss_distance":{"astronomical":"0.1824638842","lunar":"70.9784509538","kilometers":"27296208.428246654","miles":"16961077.4217016652"},"orbiting_body":"Earth"},{"close_approach_date":"2100-01-16","close_approach_date_full":"2100-Jan-16 11:39","epoch_date_close_approach":4103782740000,"relative_velocity":{"kilometers_per_second":"6.0149196633","kilometers_per_hour":"21653.7107877231","miles_per_hour":"13454.7737947383"},"miss_distance":{"astronomical":"0.2038791175","lunar":"79.3089767075","kilometers":"30499881.715479725","miles":"18951747.693781205"},"orbiting_body":"Earth"},{"close_approach_date":"2106-12-04","close_approach_date_full":"2106-Dec-04 02:22","epoch_date_close_approach":4320872520000,"relative_velocity":{"kilometers_per_second":"3.8530305141","kilometers_per_hour":"13870.9098509079","miles_per_hour":"8618.8439570822"},"miss_distance":{"astronomical":"0.3922912542","lunar":"152.6012978838","kilometers":"58685936.047948554","miles":"36465749.7209118852"},"orbiting_body":"Earth"},{"close_approach_date":"2123-04-10","close_approach_date_full":"2123-Apr-10 05:51","epoch_date_close_approach":4836779460000,"relative_velocity":{"kilometers_per_second":"3.7537243254","kilometers_per_hour":"13513.4075714592","miles_per_hour":"8396.7059434992"},"miss_distance":{"astronomical":"0.4497028378","lunar":"174.9344039042","kilometers":"67274586.667835486","miles":"41802489.7481862668"},"orbiting_body":"Earth"},{"close_approach_date":"2130-02-14","close_approach_date_full":"2130-Feb-14 22:11","epoch_date_close_approach":5053011060000,"relative_velocity":{"kilometers_per_second":"6.0381849282","kilometers_per_hour":"21737.4657416866","miles_per_hour":"13506.8158659941"},"miss_distance":{"astronomical":"0.2781645724","lunar":"108.2060186636","kilometers":"41612827.540500788","miles":"25857012.0280873544"},"orbiting_body":"Earth"},{"close_approach_date":"2137-01-25","close_approach_date_full":"2137-Jan-25 14:12","epoch_date_close_approach":5272179120000,"relative_velocity":{"kilometers_per_second":"5.8142759703","kilometers_per_hour":"20931.393493074","miles_per_hour":"13005.9539179604"},"miss_distance":{"astronomical":"0.1494623094","lunar":"58.1408383566","kilometers":"22359243.131520978","miles":"13893389.4368983764"},"orbiting_body":"Earth"},{"close_approach_date":"2144-01-03","close_approach_date_full":"2144-Jan-03 10:26","epoch_date_close_approach":5491103160000,"relative_velocity":{"kilometers_per_second":"5.7943538473","kilometers_per_hour":"20859.6738502169","miles_per_hour":"12961.3901209861"},"miss_distance":{"astronomical":"0.296580393","lunar":"115.369772877","kilometers":"44367795.07656291","miles":"27568869.475111758"},"orbiting_body":"Earth"},{"close_approach_date":"2150-11-12","close_approach_date_full":"2150-Nov-12 07:12","epoch_date_close_approach":5707523520000,"relative_velocity":{"kilometers_per_second":"4.1745035914","kilometers_per_hour":"15028.2129289863","miles_per_hour":"9337.9470835693"},"miss_distance":{"astronomical":"0.4609447583","lunar":"179.3075109787","kilometers":"68956354.029344821","miles":"42847491.5292516898"},"orbiting_body":"Earth"},{"close_approach_date":"2167-03-16","close_approach_date_full":"2167-Mar-16 05:30","epoch_date_close_approach":6223152600000,"relative_velocity":{"kilometers_per_second":"4.026253601","kilometers_per_hour":"14494.512963503","miles_per_hour":"9006.3266800166"},"miss_distance":{"astronomical":"0.3774337428","lunar":"146.8217259492","kilometers":"56463283.989007836","miles":"35084657.7735706968"},"orbiting_body":"Earth"},{"close_approach_date":"2174-02-03","close_approach_date_full":"2174-Feb-03 01:30","epoch_date_close_approach":6440520600000,"relative_velocity":{"kilometers_per_second":"6.0055431713","kilometers_per_hour":"21619.9554168322","miles_per_hour":"13433.7995199755"},"miss_distance":{"astronomical":"0.1884002692","lunar":"73.2877047188","kilometers":"28184278.979746604","miles":"17512898.8741029752"},"orbiting_body":"Earth"},{"close_approach_date":"2181-01-17","close_approach_date_full":"2181-Jan-17 20:55","epoch_date_close_approach":6660046500000,"relative_velocity":{"kilometers_per_second":"5.9898389294","kilometers_per_hour":"21563.4201458554","miles_per_hour":"13398.6707011844"},"miss_distance":{"astronomical":"0.1980108125","lunar":"77.0262060625","kilometers":"29621995.786969375","miles":"18406254.672652375"},"orbiting_body":"Earth"},{"close_approach_date":"2187-12-06","close_approach_date_full":"2187-Dec-06 23:28","epoch_date_close_approach":6877265280000,"relative_velocity":{"kilometers_per_second":"3.9833820614","kilometers_per_hour":"14340.1754211404","miles_per_hour":"8910.4273332081"},"miss_distance":{"astronomical":"0.3873137309","lunar":"150.6650413201","kilometers":"57941309.164393183","miles":"36003060.0306766054"},"orbiting_body":"Earth"}],"orbital_data":{"orbit_id":"659","orbit_determination_date":"2021-05-24 17:55:05","first_observation_date":"1893-10-29","last_observation_date":"2021-05-13","data_arc_in_days":46582,"observations_used":9130,"orbit_uncertainty":"0","minimum_orbit_intersection":".148662","jupiter_tisserand_invariant":"4.582","epoch_osculation":"2460000.5","eccentricity":".2227818894620597","semi_major_axis":"1.458129136101339","inclination":"10.82782330218545","ascending_node_longitude":"304.2870401191066","orbital_period":"643.1205824040848","perihelion_distance":"1.133284372081002","perihelion_argument":"178.9269951795186","aphelion_distance":"1.782973900121676","perihelion_time":"2459802.601698595905","mean_anomaly":"110.7776526746434","mean_motion":".5597706088868498","equinox":"J2000","orbit_class":{"orbit_class_type":"AMO","orbit_class_description":"Near-Earth asteroid orbits similar to that of 1221 Amor","orbit_class_range":"1.017 AU < q (perihelion) < 1.3 AU"}},"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2000719?api_key=DEMO_KEY"},"id":"2000719","neo_reference_id":"2000719","name":"719 Albert (A911 TB)","name_limited":"Albert","designation":"719","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000719","absolute_magnitude_h":15.59,"estimated_diameter":{"kilometers":{"estimated_diameter_min":2.0256060086,"estimated_diameter_max":4.529392731},"meters":{"estimated_diameter_min":2025.6060086475,"estimated_diameter_max":4529.3927309679},"miles":{"estimated_diameter_min":1.2586528312,"estimated_diameter_max":2.8144332906},"feet":{"estimated_diameter_min":6645.6892174112,"estimated_diameter_max":14860.2128474689}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"1909-08-21","close_approach_date_full":"1909-Aug-21 15:04","epoch_date_close_approach":-1904892960000,"relative_velocity":{"kilometers_per_second":"3.4460290151","kilometers_per_hour":"12405.7044543097","miles_per_hour":"7708.4223038459"},"miss_distance":{"astronomical":"1.7087741683","lunar":"664.7131514687","kilometers":"255628975.888701521","miles":"158840480.0863061498"},"orbiting_body":"Juptr"},{"close_approach_date":"1911-09-08","close_approach_date_full":"1911-Sep-08 08:15","epoch_date_close_approach":-1840290300000,"relative_velocity":{"kilometers_per_second":"7.1848430308","kilometers_per_hour":"25865.4349107149","miles_per_hour":"16071.7753754939"},"miss_distance":{"astronomical":"0.2054817435","lunar":"79.9323982215","kilometers":"30739631.151486345","miles":"19100721.085327761"},"orbiting_body":"Earth"},{"close_approach_date":"1941-09-08","close_approach_date_full":"1941-Sep-08 16:50","epoch_date_close_approach":-893488200000,"relative_velocity":{"kilometers_per_second":"7.3096055098","kilometers_per_hour":"26314.5798352299","miles_per_hour":"16350.8565648405"},"miss_distance":{"astronomical":"0.2056683545","lunar":"80.0049899005","kilometers":"30767547.759604915","miles":"19118067.661241227"},"orbiting_body":"Earth"},{"close_approach_date":"1956-09-12","close_approach_date_full":"1956-Sep-12 20:20","epoch_date_close_approach":-419744400000,"relative_velocity":{"kilometers_per_second":"3.2634606265","kilometers_per_hour":"11748.4582554323","miles_per_hour":"7300.0350754379"},"miss_distance":{"astronomical":"1.4171297569","lunar":"551.2634754341","kilometers":"211999593.145857803","miles":"131730438.7592235614"},"orbiting_body":"Juptr"},{"close_approach_date":"1971-09-06","close_approach_date_full":"1971-Sep-06 04:03","epoch_date_close_approach":52977780000,"relative_velocity":{"kilometers_per_second":"7.6655658653","kilometers_per_hour":"27596.0371152368","miles_per_hour":"17147.104284187"},"miss_distance":{"astronomical":"0.3147502333","lunar":"122.4378407537","kilometers":"47085964.483683071","miles":"29257861.6250895398"},"orbiting_body":"Earth"},{"close_approach_date":"2001-09-05","close_approach_date_full":"2001-Sep-05 00:40","epoch_date_close_approach":999650400000,"relative_velocity":{"kilometers_per_second":"7.6532216086","kilometers_per_hour":"27551.5977911354","miles_per_hour":"17119.4914163863"},"miss_distance":{"astronomical":"0.2846489809","lunar":"110.7284535701","kilometers":"42582881.240310683","miles":"26459775.4466381054"},"orbiting_body":"Earth"},{"close_approach_date":"2003-10-26","close_approach_date_full":"2003-Oct-26 03:46","epoch_date_close_approach":1067139960000,"relative_velocity":{"kilometers_per_second":"3.7241284848","kilometers_per_hour":"13406.8625452769","miles_per_hour":"8330.5030076472"},"miss_distance":{"astronomical":"1.4865987524","lunar":"578.2869146836","kilometers":"222392006.903697388","miles":"138187985.2279364344"},"orbiting_body":"Juptr"},{"close_approach_date":"2048-09-19","close_approach_date_full":"2048-Sep-19 10:28","epoch_date_close_approach":2484124080000,"relative_velocity":{"kilometers_per_second":"13.0394477911","kilometers_per_hour":"46942.0120478077","miles_per_hour":"29167.940763817"},"miss_distance":{"astronomical":"0.4256632516","lunar":"165.5830048724","kilometers":"63678315.776634092","miles":"39567870.6370587896"},"orbiting_body":"Earth"},{"close_approach_date":"2050-11-15","close_approach_date_full":"2050-Nov-15 11:59","epoch_date_close_approach":2552126340000,"relative_velocity":{"kilometers_per_second":"5.0048427673","kilometers_per_hour":"18017.4339623463","miles_per_hour":"11195.3327862146"},"miss_distance":{"astronomical":"1.9591584297","lunar":"762.1126291533","kilometers":"293085928.075664739","miles":"182115150.9144578382"},"orbiting_body":"Juptr"},{"close_approach_date":"2063-10-10","close_approach_date_full":"2063-Oct-10 19:16","epoch_date_close_approach":2959269360000,"relative_velocity":{"kilometers_per_second":"3.4163448465","kilometers_per_hour":"12298.8414475462","miles_per_hour":"7642.0217872267"},"miss_distance":{"astronomical":"1.563825951","lunar":"608.328294939","kilometers":"233945031.32032437","miles":"145366701.718921506"},"orbiting_body":"Juptr"},{"close_approach_date":"2078-09-10","close_approach_date_full":"2078-Sep-10 05:26","epoch_date_close_approach":3430013160000,"relative_velocity":{"kilometers_per_second":"7.5222545496","kilometers_per_hour":"27080.1163785251","miles_per_hour":"16826.5312019786"},"miss_distance":{"astronomical":"0.2134595996","lunar":"83.0357842444","kilometers":"31933101.431212852","miles":"19842309.1292552776"},"orbiting_body":"Earth"},{"close_approach_date":"2108-09-07","close_approach_date_full":"2108-Sep-07 18:36","epoch_date_close_approach":4376486160000,"relative_velocity":{"kilometers_per_second":"7.8186889132","kilometers_per_hour":"28147.2800874542","miles_per_hour":"17489.6252298962"},"miss_distance":{"astronomical":"0.2568612457","lunar":"99.9190245773","kilometers":"38425895.242266659","miles":"23876744.1242075342"},"orbiting_body":"Earth"},{"close_approach_date":"2110-11-08","close_approach_date_full":"2110-Nov-08 03:30","epoch_date_close_approach":4444860600000,"relative_velocity":{"kilometers_per_second":"3.4670013619","kilometers_per_hour":"12481.2049027845","miles_per_hour":"7755.3353463996"},"miss_distance":{"astronomical":"1.3899546635","lunar":"540.6923641015","kilometers":"207934257.056166745","miles":"129204356.049101281"},"orbiting_body":"Juptr"},{"close_approach_date":"2138-09-08","close_approach_date_full":"2138-Sep-08 23:41","epoch_date_close_approach":5323275660000,"relative_velocity":{"kilometers_per_second":"8.6062205832","kilometers_per_hour":"30982.3940994637","miles_per_hour":"19251.2548225251"},"miss_distance":{"astronomical":"0.367762384","lunar":"143.059567376","kilometers":"55016469.31252208","miles":"34185648.821201504"},"orbiting_body":"Earth"},{"close_approach_date":"2157-12-03","close_approach_date_full":"2157-Dec-03 17:48","epoch_date_close_approach":5930300880000,"relative_velocity":{"kilometers_per_second":"4.2458309082","kilometers_per_hour":"15284.991269407","miles_per_hour":"9497.4991584824"},"miss_distance":{"astronomical":"1.6444271204","lunar":"639.6821498356","kilometers":"246002794.582073548","miles":"152859048.3850410424"},"orbiting_body":"Juptr"},{"close_approach_date":"2170-11-10","close_approach_date_full":"2170-Nov-10 05:57","epoch_date_close_approach":6338498220000,"relative_velocity":{"kilometers_per_second":"3.752796571","kilometers_per_hour":"13510.0676557181","miles_per_hour":"8394.6306497433"},"miss_distance":{"astronomical":"1.8228425235","lunar":"709.0857416415","kilometers":"272693358.861024945","miles":"169443795.983016441"},"orbiting_body":"Juptr"},{"close_approach_date":"2185-09-13","close_approach_date_full":"2185-Sep-13 19:01","epoch_date_close_approach":6806919660000,"relative_velocity":{"kilometers_per_second":"8.3173750452","kilometers_per_hour":"29942.5501628245","miles_per_hour":"18605.1362386728"},"miss_distance":{"astronomical":"0.2200717468","lunar":"85.6079095052","kilometers":"32922264.568459316","miles":"20456946.6016219208"},"orbiting_body":"Earth"}],"orbital_data":{"orbit_id":"257","orbit_determination_date":"2023-03-01 06:08:09","first_observation_date":"1911-10-04","last_observation_date":"2022-08-05","data_arc_in_days":40483,"observations_used":2035,"orbit_uncertainty":"0","minimum_orbit_intersection":".200008","jupiter_tisserand_invariant":"3.141","epoch_osculation":"2460000.5","eccentricity":".5470449589266008","semi_major_axis":"2.637175327507462","inclination":"11.57600929611851","ascending_node_longitude":"183.8569896093903","orbital_period":"1564.252770506612","perihelion_distance":"1.194521858788897","perihelion_argument":"156.2503681890173","aphelion_distance":"4.079828796226027","perihelion_time":"2459956.023234763085","mean_anomaly":"10.23596428095426","mean_motion":".2301418330768929","equinox":"J2000","orbit_class":{"orbit_class_type":"AMO","orbit_class_description":"Near-Earth asteroid orbits similar to that of 1221 Amor","orbit_class_range":"1.017 AU < q (perihelion) < 1.3 AU"}},"is_sentry_object":false}]}
              description: successful operation
            '400':
              description: Bad request
          tags:
            - asteroids
      /neo/rest/v1/neo/{asteroidId}/:
        get:
          description: Lookup a specific Asteroid based on its NASA JPL small body (SPK-ID) ID
          parameters:
            - name: asteroidId
              in: path
              description: Asteroid SPK-ID correlates to the NASA JPL small body
              required: true
              schema:
                type: string
          responses:
            "200":
              content:
                application/json:
                  schema:
                    type: object
                    properties:
                      links:
                        type: object
                        properties:
                          next:
                            type: string
                            example: http://api.nasa.gov/neo/rest/v1/neo/browse?page=2&size=20&api_key=DEMO_KEY
                          prev:
                            type: string
                            example: http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=20&api_key=DEMO_KEY
                          self:
                            type: string
                            example: 1
                      page:
                        type: object
                        properties:
                          size:
                            type: integer
                            example: 20
                          total_elements:
                            type: integer
                            example: 32803
                          total_pages:
                            type: integer
                            example: 1641
                          number:
                            type: integer
                            example: 1
                      near_earth_objects:
                        type: array
                        items:
                          $ref: '#/components/schemas/ClosestApproachData'
                  example: {"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY"},"id":"3542519","neo_reference_id":"3542519","name":"(2010 PK9)","designation":"2010 PK9","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3542519","absolute_magnitude_h":21.87,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.1123453177,"estimated_diameter_max":0.2512117673},"meters":{"estimated_diameter_min":112.3453176718,"estimated_diameter_max":251.2117672679},"miles":{"estimated_diameter_min":0.0698081224,"estimated_diameter_max":0.156095707},"feet":{"estimated_diameter_min":368.5870120303,"estimated_diameter_max":824.1856145234}},"is_potentially_hazardous_asteroid":true,"close_approach_data":[{"close_approach_date":"1900-06-01","close_approach_date_full":"1900-Jun-01 16:40","epoch_date_close_approach":-2195882400000,"relative_velocity":{"kilometers_per_second":"30.9365597428","kilometers_per_hour":"111371.6150741711","miles_per_hour":"69201.9904887259"},"miss_distance":{"astronomical":"0.0445442688","lunar":"17.3277205632","kilometers":"6663727.733187456","miles":"4140648.4089846528"},"orbiting_body":"Merc"},{"close_approach_date":"1900-07-07","close_approach_date_full":"1900-Jul-07 22:08","epoch_date_close_approach":-2192752320000,"relative_velocity":{"kilometers_per_second":"31.7781465001","kilometers_per_hour":"114401.3274004396","miles_per_hour":"71084.5359061231"},"miss_distance":{"astronomical":"0.1416631157","lunar":"55.1069520073","kilometers":"21192500.366283559","miles":"13168409.1003647542"},"orbiting_body":"Venus"},{"close_approach_date":"1900-07-27","close_approach_date_full":"1900-Jul-27 20:47","epoch_date_close_approach":-2191029180000,"relative_velocity":{"kilometers_per_second":"23.8645245914","kilometers_per_hour":"85912.2885290242","miles_per_hour":"53382.5550584928"},"miss_distance":{"astronomical":"0.2177280037","lunar":"84.6961934393","kilometers":"32571645.592872119","miles":"20239082.0727044822"},"orbiting_body":"Earth"},{"close_approach_date":"1902-02-11","close_approach_date_full":"1902-Feb-11 06:38","epoch_date_close_approach":-2142350520000,"relative_velocity":{"kilometers_per_second":"28.165417574","kilometers_per_hour":"101395.5032664968","miles_per_hour":"63003.2225713408"},"miss_distance":{"astronomical":"0.0869542779","lunar":"33.8252141031","kilometers":"13008174.761228073","miles":"8082904.9873424874"},"orbiting_body":"Merc"},{"close_approach_date":"1903-09-02","close_approach_date_full":"1903-Sep-02 16:25","epoch_date_close_approach":-2093240100000,"relative_velocity":{"kilometers_per_second":"20.7059292084","kilometers_per_hour":"74541.3451500834","miles_per_hour":"46317.0930461727"},"miss_distance":{"astronomical":"0.1920513206","lunar":"74.7079637134","kilometers":"28730468.492447122","miles":"17852285.2997374036"},"orbiting_body":"Earth"},{"close_approach_date":"1904-07-26","close_approach_date_full":"1904-Jul-26 08:05","epoch_date_close_approach":-2064930900000,"relative_velocity":{"kilometers_per_second":"15.8484517107","kilometers_per_hour":"57054.4261586543","miles_per_hour":"35451.4016317483"},"miss_distance":{"astronomical":"0.0426656551","lunar":"16.5969398339","kilometers":"6382691.125114637","miles":"3966020.3583385106"},"orbiting_body":"Earth"},{"close_approach_date":"1907-04-13","close_approach_date_full":"1907-Apr-13 18:18","epoch_date_close_approach":-1979271720000,"relative_velocity":{"kilometers_per_second":"30.3953254477","kilometers_per_hour":"109423.1716115918","miles_per_hour":"67991.3034938805"},"miss_distance":{"astronomical":"0.1169638142","lunar":"45.4989237238","kilometers":"17497537.471395754","miles":"10872465.6217952452"},"orbiting_body":"Venus"},{"close_approach_date":"1907-08-23","close_approach_date_full":"1907-Aug-23 15:07","epoch_date_close_approach":-1967878380000,"relative_velocity":{"kilometers_per_second":"30.7221181691","kilometers_per_hour":"110599.6254088219","miles_per_hour":"68722.3061324983"},"miss_distance":{"astronomical":"0.444181105","lunar":"172.786449845","kilometers":"66448547.20224635","miles":"41289212.62524563"},"orbiting_body":"Earth"},{"close_approach_date":"1908-08-17","close_approach_date_full":"1908-Aug-17 14:30","epoch_date_close_approach":-1936776600000,"relative_velocity":{"kilometers_per_second":"14.3282633236","kilometers_per_hour":"51581.7479650468","miles_per_hour":"32050.8922286147"},"miss_distance":{"astronomical":"0.1463952026","lunar":"56.9477338114","kilometers":"21900410.487178462","miles":"13608284.0522162956"},"orbiting_body":"Earth"},{"close_approach_date":"1909-07-31","close_approach_date_full":"1909-Jul-31 06:55","epoch_date_close_approach":-1906736700000,"relative_velocity":{"kilometers_per_second":"26.8654235868","kilometers_per_hour":"96715.5249125574","miles_per_hour":"60095.266021361"},"miss_distance":{"astronomical":"0.3030546234","lunar":"117.8882485026","kilometers":"45336326.154292158","miles":"28170686.7801734604"},"orbiting_body":"Earth"},{"close_approach_date":"1912-09-02","close_approach_date_full":"1912-Sep-02 17:01","epoch_date_close_approach":-1809154740000,"relative_velocity":{"kilometers_per_second":"18.165630384","kilometers_per_hour":"65396.26938254","miles_per_hour":"40634.6986060566"},"miss_distance":{"astronomical":"0.1426727545","lunar":"55.4997015005","kilometers":"21343540.180232915","miles":"13262260.888787627"},"orbiting_body":"Earth"},{"close_approach_date":"1913-07-24","close_approach_date_full":"1913-Jul-24 19:43","epoch_date_close_approach":-1781065020000,"relative_velocity":{"kilometers_per_second":"17.6676656178","kilometers_per_hour":"63603.5962241934","miles_per_hour":"39520.8012205273"},"miss_distance":{"astronomical":"0.0341641274","lunar":"13.2898455586","kilometers":"5110880.689448638","miles":"3175753.9987536844"},"orbiting_body":"Earth"},{"close_approach_date":"1914-01-17","close_approach_date_full":"1914-Jan-17 12:19","epoch_date_close_approach":-1765798860000,"relative_velocity":{"kilometers_per_second":"28.8046425986","kilometers_per_hour":"103696.7133548884","miles_per_hour":"64433.1050287638"},"miss_distance":{"astronomical":"0.0904483787","lunar":"35.1844193143","kilometers":"13530884.798473369","miles":"8407701.9434517322"},"orbiting_body":"Venus"},{"close_approach_date":"1915-09-12","close_approach_date_full":"1915-Sep-12 10:16","epoch_date_close_approach":-1713707040000,"relative_velocity":{"kilometers_per_second":"25.4075629904","kilometers_per_hour":"91467.2267655487","miles_per_hour":"56834.1776532933"},"miss_distance":{"astronomical":"0.0884675943","lunar":"34.4138941827","kilometers":"13234563.671304141","miles":"8223576.5330375058"},"orbiting_body":"Merc"},{"close_approach_date":"1916-08-26","close_approach_date_full":"1916-Aug-26 18:08","epoch_date_close_approach":-1683525120000,"relative_velocity":{"kilometers_per_second":"27.5362401173","kilometers_per_hour":"99130.4644222811","miles_per_hour":"61595.815518389"},"miss_distance":{"astronomical":"0.3610820857","lunar":"140.4609313373","kilometers":"54017110.915877459","miles":"33564676.3084045742"},"orbiting_body":"Earth"},{"close_approach_date":"1917-05-22","close_approach_date_full":"1917-May-22 04:10","epoch_date_close_approach":-1660333800000,"relative_velocity":{"kilometers_per_second":"29.9180806622","kilometers_per_hour":"107705.0903840942","miles_per_hour":"66923.7546333834"},"miss_distance":{"astronomical":"0.0650604839","lunar":"25.3085282371","kilometers":"9732909.812609293","miles":"6047749.7196745234"},"orbiting_body":"Merc"},{"close_approach_date":"1917-08-09","close_approach_date_full":"1917-Aug-09 13:03","epoch_date_close_approach":-1653476220000,"relative_velocity":{"kilometers_per_second":"14.3091249281","kilometers_per_hour":"51512.8497411056","miles_per_hour":"32008.0815516331"},"miss_distance":{"astronomical":"0.1373528976","lunar":"53.4302771664","kilometers":"20547700.919288112","miles":"12767749.3028434656"},"orbiting_body":"Earth"},{"close_approach_date":"1918-08-04","close_approach_date_full":"1918-Aug-04 09:54","epoch_date_close_approach":-1622383560000,"relative_velocity":{"kilometers_per_second":"30.2104008787","kilometers_per_hour":"108757.4431633027","miles_per_hour":"67577.6457255533"},"miss_distance":{"astronomical":"0.3954025933","lunar":"153.8116087937","kilometers":"59151385.750156271","miles":"36754966.7546916998"},"orbiting_body":"Earth"},{"close_approach_date":"1919-01-29","close_approach_date_full":"1919-Jan-29 16:05","epoch_date_close_approach":-1606982100000,"relative_velocity":{"kilometers_per_second":"34.3380503627","kilometers_per_hour":"123616.9813057776","miles_per_hour":"76810.7848563594"},"miss_distance":{"astronomical":"0.0671039137","lunar":"26.1034224293","kilometers":"10038602.558183819","miles":"6237698.3837379422"},"orbiting_body":"Merc"},{"close_approach_date":"1920-10-08","close_approach_date_full":"1920-Oct-08 02:08","epoch_date_close_approach":-1553637120000,"relative_velocity":{"kilometers_per_second":"38.8094677371","kilometers_per_hour":"139714.0838534477","miles_per_hour":"86812.8983810492"},"miss_distance":{"astronomical":"0.0926211966","lunar":"36.0296454774","kilometers":"13855933.728211242","miles":"8609677.9826374596"},"orbiting_body":"Merc"},{"close_approach_date":"1920-10-23","close_approach_date_full":"1920-Oct-23 19:32","epoch_date_close_approach":-1552278480000,"relative_velocity":{"kilometers_per_second":"28.0905592487","kilometers_per_hour":"101126.0132953747","miles_per_hour":"62835.771983451"},"miss_distance":{"astronomical":"0.0795468188","lunar":"30.9437125132","kilometers":"11900034.657755956","miles":"7394338.6562899528"},"orbiting_body":"Venus"},{"close_approach_date":"1921-08-31","close_approach_date_full":"1921-Aug-31 19:42","epoch_date_close_approach":-1525321080000,"relative_velocity":{"kilometers_per_second":"15.8302908195","kilometers_per_hour":"56989.0469502745","miles_per_hour":"35410.7775341859"},"miss_distance":{"astronomical":"0.124625443","lunar":"48.479297327","kilometers":"18643700.82060641","miles":"11584658.502172058"},"orbiting_body":"Earth"},{"close_approach_date":"1922-07-25","close_approach_date_full":"1922-Jul-25 22:12","epoch_date_close_approach":-1496972880000,"relative_velocity":{"kilometers_per_second":"20.6686676263","kilometers_per_hour":"74407.2034548017","miles_per_hour":"46233.7426133461"},"miss_distance":{"astronomical":"0.1240044527","lunar":"48.2377321003","kilometers":"18550801.994435749","miles":"11526933.8483173762"},"orbiting_body":"Earth"},{"close_approach_date":"1925-03-20","close_approach_date_full":"1925-Mar-20 17:08","epoch_date_close_approach":-1413269520000,"relative_velocity":{"kilometers_per_second":"41.3053444827","kilometers_per_hour":"148699.2401375454","miles_per_hour":"92395.9250732431"},"miss_distance":{"astronomical":"0.0641673858","lunar":"24.9611130762","kilometers":"9599304.239148246","miles":"5964731.0659519548"},"orbiting_body":"Merc"},{"close_approach_date":"1925-08-30","close_approach_date_full":"1925-Aug-30 22:22","epoch_date_close_approach":-1399167480000,"relative_velocity":{"kilometers_per_second":"23.7993252012","kilometers_per_hour":"85677.5707243837","miles_per_hour":"53236.7105426039"},"miss_distance":{"astronomical":"0.2660682312","lunar":"103.5005419368","kilometers":"39803240.662187544","miles":"24732586.8821903472"},"orbiting_body":"Earth"},{"close_approach_date":"1926-08-01","close_approach_date_full":"1926-Aug-01 00:39","epoch_date_close_approach":-1370215260000,"relative_velocity":{"kilometers_per_second":"14.7278172645","kilometers_per_hour":"53020.1421520992","miles_per_hour":"32944.6544388974"},"miss_distance":{"astronomical":"0.0980278237","lunar":"38.1328234193","kilometers":"14664753.626255519","miles":"9112255.3624594022"},"orbiting_body":"Earth"},{"close_approach_date":"1926-11-28","close_approach_date_full":"1926-Nov-28 19:40","epoch_date_close_approach":-1359865200000,"relative_velocity":{"kilometers_per_second":"32.2194998271","kilometers_per_hour":"115990.199377501","miles_per_hour":"72071.7991632033"},"miss_distance":{"astronomical":"0.0394076589","lunar":"15.3295793121","kilometers":"5895301.833126543","miles":"3663170.6956225734"},"orbiting_body":"Merc"},{"close_approach_date":"1927-07-31","close_approach_date_full":"1927-Jul-31 06:22","epoch_date_close_approach":-1338745080000,"relative_velocity":{"kilometers_per_second":"27.6258398054","kilometers_per_hour":"99453.0232993144","miles_per_hour":"61796.2410606212"},"miss_distance":{"astronomical":"0.0730742942","lunar":"28.4259004438","kilometers":"10931758.764073354","miles":"6792679.9152421252"},"orbiting_body":"Venus"},{"close_approach_date":"1927-08-09","close_approach_date_full":"1927-Aug-09 10:59","epoch_date_close_approach":-1337950860000,"relative_velocity":{"kilometers_per_second":"34.0521256133","kilometers_per_hour":"122587.6522080424","miles_per_hour":"76171.1997844917"},"miss_distance":{"astronomical":"0.4986362008","lunar":"193.9694821112","kilometers":"74594913.544572296","miles":"46351129.9461418448"},"orbiting_body":"Earth"},{"close_approach_date":"1928-08-09","close_approach_date_full":"1928-Aug-09 11:29","epoch_date_close_approach":-1306326660000,"relative_velocity":{"kilometers_per_second":"28.0105463557","kilometers_per_hour":"100837.9668806831","miles_per_hour":"62656.7911431667"},"miss_distance":{"astronomical":"0.0829178955","lunar":"32.2550613495","kilometers":"12404340.551682585","miles":"7707699.808026273"},"orbiting_body":"Merc"},{"close_approach_date":"1930-08-25","close_approach_date_full":"1930-Aug-25 02:45","epoch_date_close_approach":-1241903700000,"relative_velocity":{"kilometers_per_second":"14.607629927","kilometers_per_hour":"52587.4677371968","miles_per_hour":"32675.8073837043"},"miss_distance":{"astronomical":"0.1398406063","lunar":"54.3979958507","kilometers":"20919856.841988581","miles":"12998996.2701451778"},"orbiting_body":"Earth"},{"close_approach_date":"1931-07-29","close_approach_date_full":"1931-Jul-29 03:54","epoch_date_close_approach":-1212696360000,"relative_velocity":{"kilometers_per_second":"24.2414478666","kilometers_per_hour":"87269.2123198349","miles_per_hour":"54225.6947328441"},"miss_distance":{"astronomical":"0.2285998411","lunar":"88.9253381879","kilometers":"34198049.310898457","miles":"21249682.4809224266"},"orbiting_body":"Earth"},{"close_approach_date":"1934-05-06","close_approach_date_full":"1934-May-06 18:45","epoch_date_close_approach":-1125206100000,"relative_velocity":{"kilometers_per_second":"27.2780651656","kilometers_per_hour":"98201.0345961809","miles_per_hour":"61018.3039689436"},"miss_distance":{"astronomical":"0.0687113318","lunar":"26.7287080702","kilometers":"10279068.882143266","miles":"6387117.2288024308"},"orbiting_body":"Venus"},{"close_approach_date":"1934-09-02","close_approach_date_full":"1934-Sep-02 23:18","epoch_date_close_approach":-1114908120000,"relative_velocity":{"kilometers_per_second":"20.1594551322","kilometers_per_hour":"72574.0384759571","miles_per_hour":"45094.6851852412"},"miss_distance":{"astronomical":"0.1802150587","lunar":"70.1036578343","kilometers":"26959788.923444969","miles":"16752036.0347958122"},"orbiting_body":"Earth"},{"close_approach_date":"1935-07-26","close_approach_date_full":"1935-Jul-26 13:52","epoch_date_close_approach":-1086689280000,"relative_velocity":{"kilometers_per_second":"16.2259241776","kilometers_per_hour":"58413.3270394543","miles_per_hour":"36295.769792932"},"miss_distance":{"astronomical":"0.0297594217","lunar":"11.5764150413","kilometers":"4451946.098751779","miles":"2766311.0302173902"},"orbiting_body":"Earth"},{"close_approach_date":"1938-08-24","close_approach_date_full":"1938-Aug-24 16:06","epoch_date_close_approach":-989481240000,"relative_velocity":{"kilometers_per_second":"29.8617583709","kilometers_per_hour":"107502.3301353008","miles_per_hour":"66797.767299904"},"miss_distance":{"astronomical":"0.4214233","lunar":"163.9336637","kilometers":"63044028.048371","miles":"39173742.5186798"},"orbiting_body":"Earth"},{"close_approach_date":"1939-08-16","close_approach_date_full":"1939-Aug-16 02:36","epoch_date_close_approach":-958685040000,"relative_velocity":{"kilometers_per_second":"14.310985093","kilometers_per_hour":"51519.5463347888","miles_per_hour":"32012.2425545248"},"miss_distance":{"astronomical":"0.1464445443","lunar":"56.9669277327","kilometers":"21907791.900400641","miles":"13612870.6497092058"},"orbiting_body":"Earth"},{"close_approach_date":"1940-07-02","close_approach_date_full":"1940-Jul-02 20:48","epoch_date_close_approach":-930885120000,"relative_velocity":{"kilometers_per_second":"24.6226064539","kilometers_per_hour":"88641.3832339439","miles_per_hour":"55078.3083766692"},"miss_distance":{"astronomical":"0.0938520165","lunar":"36.5084344185","kilometers":"14040061.763604855","miles":"8724089.838482799"},"orbiting_body":"Merc"},{"close_approach_date":"1940-08-01","close_approach_date_full":"1940-Aug-01 07:16","epoch_date_close_approach":-928341840000,"relative_velocity":{"kilometers_per_second":"27.8639988114","kilometers_per_hour":"100310.3957209219","miles_per_hour":"62328.9789411473"},"miss_distance":{"astronomical":"0.3306427076","lunar":"128.6200132564","kilometers":"49463444.787992812","miles":"30735159.3829803256"},"orbiting_body":"Earth"},{"close_approach_date":"1941-02-10","close_approach_date_full":"1941-Feb-10 01:07","epoch_date_close_approach":-911688780000,"relative_velocity":{"kilometers_per_second":"26.448486871","kilometers_per_hour":"95214.5527356936","miles_per_hour":"59162.6202817981"},"miss_distance":{"astronomical":"0.0607131274","lunar":"23.6174065586","kilometers":"9082554.540078638","miles":"5643637.6922476844"},"orbiting_body":"Venus"},{"close_approach_date":"1942-03-12","close_approach_date_full":"1942-Mar-12 15:28","epoch_date_close_approach":-877509120000,"relative_velocity":{"kilometers_per_second":"29.0537682813","kilometers_per_hour":"104593.5658125983","miles_per_hour":"64990.3742683892"},"miss_distance":{"astronomical":"0.0678058792","lunar":"26.3764870088","kilometers":"10143615.101797304","miles":"6302950.1525746352"},"orbiting_body":"Merc"},{"close_approach_date":"1943-09-03","close_approach_date_full":"1943-Sep-03 09:06","epoch_date_close_approach":-830876040000,"relative_velocity":{"kilometers_per_second":"17.2807490757","kilometers_per_hour":"62210.6966726737","miles_per_hour":"38655.3076075288"},"miss_distance":{"astronomical":"0.1319184324","lunar":"51.3162702036","kilometers":"19734716.500778988","miles":"12262584.2099985144"},"orbiting_body":"Earth"},{"close_approach_date":"1943-11-20","close_approach_date_full":"1943-Nov-20 03:23","epoch_date_close_approach":-824157420000,"relative_velocity":{"kilometers_per_second":"33.3886906597","kilometers_per_hour":"120199.2863749722","miles_per_hour":"74687.1621367154"},"miss_distance":{"astronomical":"0.063934424","lunar":"24.870490936","kilometers":"9564453.65007688","miles":"5943075.914065744"},"orbiting_body":"Merc"},{"close_approach_date":"1944-07-24","close_approach_date_full":"1944-Jul-24 16:51","epoch_date_close_approach":-802768140000,"relative_velocity":{"kilometers_per_second":"18.6254706268","kilometers_per_hour":"67051.6942563806","miles_per_hour":"41663.3152450272"},"miss_distance":{"astronomical":"0.0617486757","lunar":"24.0202348473","kilometers":"9237470.360040759","miles":"5739897.9191261142"},"orbiting_body":"Earth"},{"close_approach_date":"1945-07-29","close_approach_date_full":"1945-Jul-29 14:42","epoch_date_close_approach":-770807880000,"relative_velocity":{"kilometers_per_second":"37.9634813297","kilometers_per_hour":"136668.5327868854","miles_per_hour":"84920.5113863845"},"miss_distance":{"astronomical":"0.0865839436","lunar":"33.6811540604","kilometers":"12952773.538760132","miles":"8048480.2639965416"},"orbiting_body":"Merc"},{"close_approach_date":"1947-08-29","close_approach_date_full":"1947-Aug-29 03:56","epoch_date_close_approach":-705096240000,"relative_velocity":{"kilometers_per_second":"26.1762939617","kilometers_per_hour":"94234.6582621438","miles_per_hour":"58553.7519629415"},"miss_distance":{"astronomical":"0.3266238591","lunar":"127.0566811899","kilometers":"48862233.612540117","miles":"30361584.0814709346"},"orbiting_body":"Earth"},{"close_approach_date":"1947-11-17","close_approach_date_full":"1947-Nov-17 11:29","epoch_date_close_approach":-698157060000,"relative_velocity":{"kilometers_per_second":"25.8724519651","kilometers_per_hour":"93140.8270742801","miles_per_hour":"57874.0878006825"},"miss_distance":{"astronomical":"0.057583754","lunar":"22.400080306","kilometers":"8614406.94500398","miles":"5352744.265575724"},"orbiting_body":"Venus"},{"close_approach_date":"1948-08-06","close_approach_date_full":"1948-Aug-06 01:01","epoch_date_close_approach":-675471540000,"relative_velocity":{"kilometers_per_second":"14.4029674308","kilometers_per_hour":"51850.6827507994","miles_per_hour":"32217.9978459064"},"miss_distance":{"astronomical":"0.1269910769","lunar":"49.3995289141","kilometers":"18997594.613246203","miles":"11804557.9080474814"},"orbiting_body":"Earth"},{"close_approach_date":"1949-08-06","close_approach_date_full":"1949-Aug-06 01:15","epoch_date_close_approach":-643934700000,"relative_velocity":{"kilometers_per_second":"31.6065064009","kilometers_per_hour":"113783.4230433728","miles_per_hour":"70700.5941682558"},"miss_distance":{"astronomical":"0.433206521","lunar":"168.517336669","kilometers":"64806772.81171027","miles":"40269061.324010926"},"orbiting_body":"Earth"},{"close_approach_date":"1950-01-09","close_approach_date_full":"1950-Jan-09 05:27","epoch_date_close_approach":-630441180000,"relative_velocity":{"kilometers_per_second":"42.8383435774","kilometers_per_hour":"154218.0368787872","miles_per_hour":"95825.0907483775"},"miss_distance":{"astronomical":"0.0729563461","lunar":"28.3800186329","kilometers":"10914113.979542807","miles":"6781715.9545404566"},"orbiting_body":"Merc"},{"close_approach_date":"1951-09-19","close_approach_date_full":"1951-Sep-19 06:17","epoch_date_close_approach":-577042980000,"relative_velocity":{"kilometers_per_second":"33.4285708921","kilometers_per_hour":"120342.8552115046","miles_per_hour":"74776.370228504"},"miss_distance":{"astronomical":"0.0369852829","lunar":"14.3872750481","kilometers":"5532919.543187423","miles":"3437996.7821075174"},"orbiting_body":"Merc"},{"close_approach_date":"1952-08-29","close_approach_date_full":"1952-Aug-29 14:03","epoch_date_close_approach":-547207020000,"relative_velocity":{"kilometers_per_second":"15.185629044","kilometers_per_hour":"54668.2645583521","miles_per_hour":"33968.7336084938"},"miss_distance":{"astronomical":"0.1293959855","lunar":"50.3350383595","kilometers":"19357363.817350885","miles":"12028108.125316813"},"orbiting_body":"Earth"},{"close_approach_date":"1953-05-30","close_approach_date_full":"1953-May-30 15:18","epoch_date_close_approach":-523528920000,"relative_velocity":{"kilometers_per_second":"27.9568594088","kilometers_per_hour":"100644.6938718107","miles_per_hour":"62536.6988116259"},"miss_distance":{"astronomical":"0.0762818096","lunar":"29.6736239344","kilometers":"11411596.235905552","miles":"7090837.0945065376"},"orbiting_body":"Merc"},{"close_approach_date":"1953-07-26","close_approach_date_full":"1953-Jul-26 18:46","epoch_date_close_approach":-518591640000,"relative_velocity":{"kilometers_per_second":"21.9943751075","kilometers_per_hour":"79179.7503869489","miles_per_hour":"49199.217677935"},"miss_distance":{"astronomical":"0.1634473566","lunar":"63.5810217174","kilometers":"24451376.404490442","miles":"15193380.7713224196"},"orbiting_body":"Earth"},{"close_approach_date":"1954-08-24","close_approach_date_full":"1954-Aug-24 00:16","epoch_date_close_approach":-484616640000,"relative_velocity":{"kilometers_per_second":"25.5165348423","kilometers_per_hour":"91859.5254322141","miles_per_hour":"57077.9367886999"},"miss_distance":{"astronomical":"0.0568520477","lunar":"22.1154465553","kilometers":"8504945.241058399","miles":"5284727.9167039462"},"orbiting_body":"Venus"},{"close_approach_date":"1956-09-01","close_approach_date_full":"1956-Sep-01 03:24","epoch_date_close_approach":-420755760000,"relative_velocity":{"kilometers_per_second":"22.3660548812","kilometers_per_hour":"80517.797572387","miles_per_hour":"50030.6281637979"},"miss_distance":{"astronomical":"0.2307062226","lunar":"89.7447205914","kilometers":"34513159.496705862","miles":"21445482.8709984156"},"orbiting_body":"Earth"},{"close_approach_date":"1957-07-29","close_approach_date_full":"1957-Jul-29 03:29","epoch_date_close_approach":-392157060000,"relative_velocity":{"kilometers_per_second":"15.1637246238","kilometers_per_hour":"54589.4086457696","miles_per_hour":"33919.7356110339"},"miss_distance":{"astronomical":"0.0738072531","lunar":"28.7110214559","kilometers":"11041407.854310897","miles":"6860812.7005564986"},"orbiting_body":"Earth"},{"close_approach_date":"1960-08-21","close_approach_date_full":"1960-Aug-21 12:01","epoch_date_close_approach":-295444740000,"relative_velocity":{"kilometers_per_second":"32.1585580511","kilometers_per_hour":"115770.8089841198","miles_per_hour":"71935.4785046049"},"miss_distance":{"astronomical":"0.4813451086","lunar":"187.2432472454","kilometers":"72008202.981478682","miles":"44743822.5340705316"},"orbiting_body":"Earth"},{"close_approach_date":"1961-05-30","close_approach_date_full":"1961-May-30 13:13","epoch_date_close_approach":-271075620000,"relative_velocity":{"kilometers_per_second":"25.1343042546","kilometers_per_hour":"90483.4953164398","miles_per_hour":"56222.92518704"},"miss_distance":{"astronomical":"0.0573281652","lunar":"22.3006562628","kilometers":"8576171.404928124","miles":"5328985.8026671512"},"orbiting_body":"Venus"},{"close_approach_date":"1961-08-21","close_approach_date_full":"1961-Aug-21 09:27","epoch_date_close_approach":-263917980000,"relative_velocity":{"kilometers_per_second":"14.404393544","kilometers_per_hour":"51855.8167583849","miles_per_hour":"32221.1879185642"},"miss_distance":{"astronomical":"0.14564259","lunar":"56.65496751","kilometers":"21787821.2452833","miles":"13538324.34137754"},"orbiting_body":"Earth"},{"close_approach_date":"1962-07-30","close_approach_date_full":"1962-Jul-30 12:58","epoch_date_close_approach":-234270120000,"relative_velocity":{"kilometers_per_second":"25.7004512103","kilometers_per_hour":"92521.6243571286","miles_per_hour":"57489.3393123503"},"miss_distance":{"astronomical":"0.2695664827","lunar":"104.8613617703","kilometers":"40326571.635311849","miles":"25057769.6699635562"},"orbiting_body":"Earth"},{"close_approach_date":"1965-04-23","close_approach_date_full":"1965-Apr-23 18:22","epoch_date_close_approach":-148023480000,"relative_velocity":{"kilometers_per_second":"24.7710804847","kilometers_per_hour":"89175.8897450964","miles_per_hour":"55410.429936335"},"miss_distance":{"astronomical":"0.0925840502","lunar":"36.0151955278","kilometers":"13850376.705893074","miles":"8606225.0090854612"},"orbiting_body":"Merc"},{"close_approach_date":"1965-09-03","close_approach_date_full":"1965-Sep-03 06:57","epoch_date_close_approach":-136573380000,"relative_velocity":{"kilometers_per_second":"18.9137884185","kilometers_per_hour":"68089.6383065719","miles_per_hour":"42308.2533133252"},"miss_distance":{"astronomical":"0.1565258475","lunar":"60.8885546775","kilometers":"23415933.385944825","miles":"14549986.314195585"},"orbiting_body":"Earth"},{"close_approach_date":"1966-07-25","close_approach_date_full":"1966-Jul-25 14:11","epoch_date_close_approach":-108467340000,"relative_velocity":{"kilometers_per_second":"17.0920883129","kilometers_per_hour":"61531.517926346","miles_per_hour":"38233.2923470676"},"miss_distance":{"astronomical":"0.0189281294","lunar":"7.3630423366","kilometers":"2831607.841324378","miles":"1759479.5244492964"},"orbiting_body":"Earth"},{"close_approach_date":"1967-01-01","close_approach_date_full":"1967-Jan-01 16:07","epoch_date_close_approach":-94636380000,"relative_velocity":{"kilometers_per_second":"29.5401654423","kilometers_per_hour":"106344.5955922138","miles_per_hour":"66078.3960778397"},"miss_distance":{"astronomical":"0.0660229798","lunar":"25.6829391422","kilometers":"9876897.149133026","miles":"6137219.3018307188"},"orbiting_body":"Merc"},{"close_approach_date":"1968-03-06","close_approach_date_full":"1968-Mar-06 02:39","epoch_date_close_approach":-57532860000,"relative_velocity":{"kilometers_per_second":"24.7936655982","kilometers_per_hour":"89257.1961534836","miles_per_hour":"55460.950576591"},"miss_distance":{"astronomical":"0.05893016","lunar":"22.92383224","kilometers":"8815826.4147592","miles":"5477900.52050896"},"orbiting_body":"Venus"},{"close_approach_date":"1968-09-10","close_approach_date_full":"1968-Sep-10 10:21","epoch_date_close_approach":-41261940000,"relative_velocity":{"kilometers_per_second":"34.618957389","kilometers_per_hour":"124628.2466004954","miles_per_hour":"77439.1457835134"},"miss_distance":{"astronomical":"0.0680973113","lunar":"26.4898540957","kilometers":"10187212.723206931","miles":"6330040.4583244078"},"orbiting_body":"Merc"},{"close_approach_date":"1969-08-26","close_approach_date_full":"1969-Aug-26 14:37","epoch_date_close_approach":-11006580000,"relative_velocity":{"kilometers_per_second":"28.1479627091","kilometers_per_hour":"101332.665752823","miles_per_hour":"62964.1777840249"},"miss_distance":{"astronomical":"0.3781109054","lunar":"147.0851422006","kilometers":"56564586.071611498","miles":"35147603.9688467524"},"orbiting_body":"Earth"},{"close_approach_date":"1970-05-21","close_approach_date_full":"1970-May-21 00:03","epoch_date_close_approach":12096180000,"relative_velocity":{"kilometers_per_second":"39.5401884268","kilometers_per_hour":"142344.6783363756","miles_per_hour":"88447.447491844"},"miss_distance":{"astronomical":"0.0980744678","lunar":"38.1509679742","kilometers":"14671731.484263586","miles":"9116591.2023700468"},"orbiting_body":"Merc"},{"close_approach_date":"1970-08-11","close_approach_date_full":"1970-Aug-11 11:32","epoch_date_close_approach":19222320000,"relative_velocity":{"kilometers_per_second":"14.2920387298","kilometers_per_hour":"51451.3394274132","miles_per_hour":"31969.8614347724"},"miss_distance":{"astronomical":"0.1413539753","lunar":"54.9866963917","kilometers":"21146253.620912611","miles":"13139672.7053155918"},"orbiting_body":"Earth"},{"close_approach_date":"1971-08-04","close_approach_date_full":"1971-Aug-04 09:19","epoch_date_close_approach":50145540000,"relative_velocity":{"kilometers_per_second":"29.7057609638","kilometers_per_hour":"106940.7394696141","miles_per_hour":"66448.8166998833"},"miss_distance":{"astronomical":"0.3816618707","lunar":"148.4664677023","kilometers":"57095802.916935409","miles":"35477686.8103862842"},"orbiting_body":"Earth"},{"close_approach_date":"1974-09-01","close_approach_date_full":"1974-Sep-01 17:21","epoch_date_close_approach":147288060000,"relative_velocity":{"kilometers_per_second":"15.9538661919","kilometers_per_hour":"57433.9182909725","miles_per_hour":"35687.2032847434"},"miss_distance":{"astronomical":"0.1260045787","lunar":"49.0157811143","kilometers":"18850016.583767369","miles":"11712857.1727489322"},"orbiting_body":"Earth"},{"close_approach_date":"1974-11-01","close_approach_date_full":"1974-Nov-01 03:23","epoch_date_close_approach":152508180000,"relative_velocity":{"kilometers_per_second":"37.9261111942","kilometers_per_hour":"136534.0002990962","miles_per_hour":"84836.9181302912"},"miss_distance":{"astronomical":"0.046588102","lunar":"18.122771678","kilometers":"6969480.82654274","miles":"4330634.571420212"},"orbiting_body":"Merc"},{"close_approach_date":"1974-12-11","close_approach_date_full":"1974-Dec-11 20:29","epoch_date_close_approach":156025740000,"relative_velocity":{"kilometers_per_second":"24.8719697518","kilometers_per_hour":"89539.0911063817","miles_per_hour":"55636.1091377404"},"miss_distance":{"astronomical":"0.0582880573","lunar":"22.6740542897","kilometers":"8719769.218517951","miles":"5418213.3464956838"},"orbiting_body":"Venus"},{"close_approach_date":"1975-07-26","close_approach_date_full":"1975-Jul-26 07:58","epoch_date_close_approach":175593480000,"relative_velocity":{"kilometers_per_second":"20.4395411227","kilometers_per_hour":"73582.3480417798","miles_per_hour":"45721.2095374048"},"miss_distance":{"astronomical":"0.1173612882","lunar":"45.6535411098","kilometers":"17556998.735176134","miles":"10909413.1378292892"},"orbiting_body":"Earth"},{"close_approach_date":"1976-07-11","close_approach_date_full":"1976-Jul-11 20:13","epoch_date_close_approach":205963980000,"relative_velocity":{"kilometers_per_second":"29.3323710108","kilometers_per_hour":"105596.5356389236","miles_per_hour":"65613.5807140856"},"miss_distance":{"astronomical":"0.0547077333","lunar":"21.2813082537","kilometers":"8184160.374208071","miles":"5085401.4433345398"},"orbiting_body":"Merc"},{"close_approach_date":"1978-08-31","close_approach_date_full":"1978-Aug-31 09:50","epoch_date_close_approach":273405000000,"relative_velocity":{"kilometers_per_second":"23.9253789632","kilometers_per_hour":"86131.3642674437","miles_per_hour":"53518.6802027347"},"miss_distance":{"astronomical":"0.2695817677","lunar":"104.8673076353","kilometers":"40328858.238754799","miles":"25059190.4994582662"},"orbiting_body":"Earth"},{"close_approach_date":"1979-08-01","close_approach_date_full":"1979-Aug-01 15:01","epoch_date_close_approach":302367660000,"relative_velocity":{"kilometers_per_second":"14.7215241387","kilometers_per_hour":"52997.486899352","miles_per_hour":"32930.5773458779"},"miss_distance":{"astronomical":"0.0991684927","lunar":"38.5765436603","kilometers":"14835395.279030549","miles":"9218287.1687336162"},"orbiting_body":"Earth"},{"close_approach_date":"1980-08-08","close_approach_date_full":"1980-Aug-08 23:43","epoch_date_close_approach":334626180000,"relative_velocity":{"kilometers_per_second":"34.0644215038","kilometers_per_hour":"122631.9174136346","miles_per_hour":"76198.704461822"},"miss_distance":{"astronomical":"0.4985857843","lunar":"193.9498700927","kilometers":"74587371.343559441","miles":"46346443.4397486458"},"orbiting_body":"Earth"},{"close_approach_date":"1981-09-17","close_approach_date_full":"1981-Sep-17 14:22","epoch_date_close_approach":369584520000,"relative_velocity":{"kilometers_per_second":"24.9886099251","kilometers_per_hour":"89958.995730436","miles_per_hour":"55897.0215415034"},"miss_distance":{"astronomical":"0.0576368877","lunar":"22.4207493153","kilometers":"8622355.633349199","miles":"5357683.3514849862"},"orbiting_body":"Venus"},{"close_approach_date":"1983-08-25","close_approach_date_full":"1983-Aug-25 10:04","epoch_date_close_approach":430653840000,"relative_velocity":{"kilometers_per_second":"14.5663704246","kilometers_per_hour":"52438.9335285179","miles_per_hour":"32583.5140027616"},"miss_distance":{"astronomical":"0.141438527","lunar":"55.019587003","kilometers":"21158902.37513749","miles":"13147532.276737762"},"orbiting_body":"Earth"},{"close_approach_date":"1984-07-28","close_approach_date_full":"1984-Jul-28 19:34","epoch_date_close_approach":459891240000,"relative_velocity":{"kilometers_per_second":"24.3861428843","kilometers_per_hour":"87790.1143834037","miles_per_hour":"54549.3630178432"},"miss_distance":{"astronomical":"0.2321235568","lunar":"90.2960635952","kilometers":"34725189.674104016","miles":"21577232.3139307808"},"orbiting_body":"Earth"},{"close_approach_date":"1987-09-03","close_approach_date_full":"1987-Sep-03 14:29","epoch_date_close_approach":557677740000,"relative_velocity":{"kilometers_per_second":"19.9365168231","kilometers_per_hour":"71771.4605630498","miles_per_hour":"44595.9944815239"},"miss_distance":{"astronomical":"0.1774120376","lunar":"69.0132826264","kilometers":"26540462.937319912","miles":"16491478.9492103056"},"orbiting_body":"Earth"},{"close_approach_date":"1988-06-06","close_approach_date_full":"1988-Jun-06 23:45","epoch_date_close_approach":581643900000,"relative_velocity":{"kilometers_per_second":"25.1345232441","kilometers_per_hour":"90484.2836788464","miles_per_hour":"56223.415044781"},"miss_distance":{"astronomical":"0.0899538906","lunar":"34.9920634434","kilometers":"13456910.431973022","miles":"8361736.4035588236"},"orbiting_body":"Merc"},{"close_approach_date":"1988-06-24","close_approach_date_full":"1988-Jun-24 07:25","epoch_date_close_approach":583140300000,"relative_velocity":{"kilometers_per_second":"24.996568812","kilometers_per_hour":"89987.6477230585","miles_per_hour":"55914.8247754749"},"miss_distance":{"astronomical":"0.0574258071","lunar":"22.3386389619","kilometers":"8590778.425190877","miles":"5338062.1841810226"},"orbiting_body":"Venus"},{"close_approach_date":"1988-07-25","close_approach_date_full":"1988-Jul-25 21:10","epoch_date_close_approach":585868200000,"relative_velocity":{"kilometers_per_second":"16.3625962329","kilometers_per_hour":"58905.3464383702","miles_per_hour":"36601.4915133306"},"miss_distance":{"astronomical":"0.0249765049","lunar":"9.7158604061","kilometers":"3736431.933084563","miles":"2321711.1440424494"},"orbiting_body":"Earth"},{"close_approach_date":"1990-02-14","close_approach_date_full":"1990-Feb-14 16:04","epoch_date_close_approach":635011440000,"relative_velocity":{"kilometers_per_second":"29.4293530626","kilometers_per_hour":"105945.6710253985","miles_per_hour":"65830.5198657539"},"miss_distance":{"astronomical":"0.0663244253","lunar":"25.8002014417","kilometers":"9921992.753854111","miles":"6165240.4112482918"},"orbiting_body":"Merc"},{"close_approach_date":"1991-08-25","close_approach_date_full":"1991-Aug-25 11:17","epoch_date_close_approach":683119020000,"relative_velocity":{"kilometers_per_second":"29.6044920347","kilometers_per_hour":"106576.1713248869","miles_per_hour":"66222.2882323999"},"miss_distance":{"astronomical":"0.4160151619","lunar":"161.8298979791","kilometers":"62234982.107945153","miles":"38671024.6826349914"},"orbiting_body":"Earth"},{"close_approach_date":"1991-10-25","close_approach_date_full":"1991-Oct-25 03:28","epoch_date_close_approach":688361280000,"relative_velocity":{"kilometers_per_second":"33.7436173361","kilometers_per_hour":"121477.0224101209","miles_per_hour":"75481.0976192221"},"miss_distance":{"astronomical":"0.0648821168","lunar":"25.2391434352","kilometers":"9706226.474371216","miles":"6031169.4621301408"},"orbiting_body":"Merc"},{"close_approach_date":"1992-08-15","close_approach_date_full":"1992-Aug-15 00:22","epoch_date_close_approach":713838120000,"relative_velocity":{"kilometers_per_second":"14.2838689806","kilometers_per_hour":"51421.9283300092","miles_per_hour":"31951.5865226104"},"miss_distance":{"astronomical":"0.1468751771","lunar":"57.1344438919","kilometers":"21972213.650032777","miles":"13652900.4687232426"},"orbiting_body":"Earth"},{"close_approach_date":"1993-07-03","close_approach_date_full":"1993-Jul-03 12:07","epoch_date_close_approach":741701220000,"relative_velocity":{"kilometers_per_second":"38.0351693657","kilometers_per_hour":"136926.6097164178","miles_per_hour":"85080.8703540708"},"miss_distance":{"astronomical":"0.0870631688","lunar":"33.8675726632","kilometers":"13024464.607930456","miles":"8093027.0287180528"},"orbiting_body":"Merc"},{"close_approach_date":"1993-08-02","close_approach_date_full":"1993-Aug-02 02:58","epoch_date_close_approach":744260280000,"relative_velocity":{"kilometers_per_second":"28.0973219059","kilometers_per_hour":"101150.3588611324","miles_per_hour":"62850.8993712408"},"miss_distance":{"astronomical":"0.3370928157","lunar":"131.1291053073","kilometers":"50428367.221022559","miles":"31334734.3802029542"},"orbiting_body":"Earth"},{"close_approach_date":"1995-03-31","close_approach_date_full":"1995-Mar-31 16:06","epoch_date_close_approach":796665960000,"relative_velocity":{"kilometers_per_second":"24.1345628095","kilometers_per_hour":"86884.4261143422","miles_per_hour":"53986.6035486589"},"miss_distance":{"astronomical":"0.0641788867","lunar":"24.9655869263","kilometers":"9601024.749291329","miles":"5965800.1413811802"},"orbiting_body":"Venus"},{"close_approach_date":"1996-09-02","close_approach_date_full":"1996-Sep-02 19:20","epoch_date_close_approach":841692000000,"relative_velocity":{"kilometers_per_second":"17.1327763206","kilometers_per_hour":"61677.9947542482","miles_per_hour":"38324.3073516049"},"miss_distance":{"astronomical":"0.1321741893","lunar":"51.4157596377","kilometers":"19772977.188256791","miles":"12286358.2987780758"},"orbiting_body":"Earth"},{"close_approach_date":"1997-07-25","close_approach_date_full":"1997-Jul-25 06:04","epoch_date_close_approach":869810640000,"relative_velocity":{"kilometers_per_second":"18.7564153822","kilometers_per_hour":"67523.095375762","miles_per_hour":"41956.225568345"},"miss_distance":{"astronomical":"0.0658904655","lunar":"25.6313910795","kilometers":"9857073.292108485","miles":"6124901.328267693"},"orbiting_body":"Earth"},{"close_approach_date":"1997-12-13","close_approach_date_full":"1997-Dec-13 16:06","epoch_date_close_approach":882029160000,"relative_velocity":{"kilometers_per_second":"45.0721797853","kilometers_per_hour":"162259.8472270872","miles_per_hour":"100821.958961742"},"miss_distance":{"astronomical":"0.086362055","lunar":"33.594839395","kilometers":"12919579.47682285","miles":"8027854.43034133"},"orbiting_body":"Merc"},{"close_approach_date":"1999-08-23","close_approach_date_full":"1999-Aug-23 12:15","epoch_date_close_approach":935410500000,"relative_velocity":{"kilometers_per_second":"35.7445058615","kilometers_per_hour":"128680.221101378","miles_per_hour":"79956.8851615757"},"miss_distance":{"astronomical":"0.0388161927","lunar":"15.0994989603","kilometers":"5806819.749429549","miles":"3608190.4782798162"},"orbiting_body":"Merc"},{"close_approach_date":"2000-08-28","close_approach_date_full":"2000-Aug-28 19:27","epoch_date_close_approach":967490820000,"relative_velocity":{"kilometers_per_second":"26.0907495942","kilometers_per_hour":"93926.6985390599","miles_per_hour":"58362.3977672286"},"miss_distance":{"astronomical":"0.3248797203","lunar":"126.3782111967","kilometers":"48601314.163075761","miles":"30199456.2535410618"},"orbiting_body":"Earth"},{"close_approach_date":"2001-05-03","close_approach_date_full":"2001-May-03 05:18","epoch_date_close_approach":988867080000,"relative_velocity":{"kilometers_per_second":"28.6554227711","kilometers_per_hour":"103159.5219760277","miles_per_hour":"64099.3151967156"},"miss_distance":{"astronomical":"0.0616532199","lunar":"23.9831025411","kilometers":"9223190.375681613","miles":"5731024.7482997394"},"orbiting_body":"Merc"},{"close_approach_date":"2001-08-06","close_approach_date_full":"2001-Aug-06 07:55","epoch_date_close_approach":997084500000,"relative_velocity":{"kilometers_per_second":"14.3848838874","kilometers_per_hour":"51785.5819946008","miles_per_hour":"32177.5467677007"},"miss_distance":{"astronomical":"0.1265868535","lunar":"49.2422860115","kilometers":"18937123.653602045","miles":"11766982.996096421"},"orbiting_body":"Earth"},{"close_approach_date":"2002-01-05","close_approach_date_full":"2002-Jan-05 03:17","epoch_date_close_approach":1010200620000,"relative_velocity":{"kilometers_per_second":"23.4089478953","kilometers_per_hour":"84272.2124231887","miles_per_hour":"52363.4755470641"},"miss_distance":{"astronomical":"0.0736151088","lunar":"28.6362773232","kilometers":"11012663.476298256","miles":"6842951.7722816928"},"orbiting_body":"Venus"},{"close_approach_date":"2002-08-06","close_approach_date_full":"2002-Aug-06 15:09","epoch_date_close_approach":1028646540000,"relative_velocity":{"kilometers_per_second":"31.6672060398","kilometers_per_hour":"114001.9417432829","miles_per_hour":"70836.3731904304"},"miss_distance":{"astronomical":"0.4345788356","lunar":"169.0511670484","kilometers":"65012068.152840172","miles":"40396625.9337394936"},"orbiting_body":"Earth"},{"close_approach_date":"2005-08-30","close_approach_date_full":"2005-Aug-30 06:32","epoch_date_close_approach":1125383520000,"relative_velocity":{"kilometers_per_second":"15.2437459555","kilometers_per_hour":"54877.4854398662","miles_per_hour":"34098.7353278991"},"miss_distance":{"astronomical":"0.1303453291","lunar":"50.7043330199","kilometers":"19499383.597809017","miles":"12116355.1248257546"},"orbiting_body":"Earth"},{"close_approach_date":"2006-07-27","close_approach_date_full":"2006-Jul-27 04:50","epoch_date_close_approach":1153975800000,"relative_velocity":{"kilometers_per_second":"21.8838677292","kilometers_per_hour":"78781.9238252744","miles_per_hour":"48952.0237235434"},"miss_distance":{"astronomical":"0.1594837579","lunar":"62.0391818231","kilometers":"23858430.481435673","miles":"14824941.2595033674"},"orbiting_body":"Earth"},{"close_approach_date":"2008-10-11","close_approach_date_full":"2008-Oct-11 15:40","epoch_date_close_approach":1223739600000,"relative_velocity":{"kilometers_per_second":"22.6803649711","kilometers_per_hour":"81649.31389614","miles_per_hour":"50733.7084039654"},"miss_distance":{"astronomical":"0.0860557123","lunar":"33.4756720847","kilometers":"12873751.261412801","miles":"7999378.0977506138"},"orbiting_body":"Venus"},{"close_approach_date":"2009-09-01","close_approach_date_full":"2009-Sep-01 09:51","epoch_date_close_approach":1251798660000,"relative_velocity":{"kilometers_per_second":"22.6130437596","kilometers_per_hour":"81406.9575344498","miles_per_hour":"50583.1175857808"},"miss_distance":{"astronomical":"0.2382803161","lunar":"92.6910429629","kilometers":"35646227.751486707","miles":"22149538.8370102766"},"orbiting_body":"Earth"},{"close_approach_date":"2010-07-30","close_approach_date_full":"2010-Jul-30 05:23","epoch_date_close_approach":1280467380000,"relative_velocity":{"kilometers_per_second":"15.0279647281","kilometers_per_hour":"54100.673021052","miles_per_hour":"33616.0543002198"},"miss_distance":{"astronomical":"0.079673681","lunar":"30.993061909","kilometers":"11919012.97265947","miles":"7406131.234341886"},"orbiting_body":"Earth"},{"close_approach_date":"2013-08-21","close_approach_date_full":"2013-Aug-21 07:22","epoch_date_close_approach":1377069720000,"relative_velocity":{"kilometers_per_second":"32.6907038727","kilometers_per_hour":"117686.5339415965","miles_per_hour":"73125.8354927659"},"miss_distance":{"astronomical":"0.4961923092","lunar":"193.0188082788","kilometers":"74229312.566701404","miles":"46123956.0326872152"},"orbiting_body":"Earth"},{"close_approach_date":"2014-08-23","close_approach_date_full":"2014-Aug-23 08:41","epoch_date_close_approach":1408783260000,"relative_velocity":{"kilometers_per_second":"14.4814182913","kilometers_per_hour":"52133.1058486818","miles_per_hour":"32393.4845758101"},"miss_distance":{"astronomical":"0.1446197138","lunar":"56.2570686682","kilometers":"21634801.144489606","miles":"13443242.0597683228"},"orbiting_body":"Earth"},{"close_approach_date":"2014-12-04","close_approach_date_full":"2014-Dec-04 13:36","epoch_date_close_approach":1417700160000,"relative_velocity":{"kilometers_per_second":"25.0670237051","kilometers_per_hour":"90241.2853383744","miles_per_hour":"56072.4253259471"},"miss_distance":{"astronomical":"0.090404715","lunar":"35.167434135","kilometers":"13524352.80195705","miles":"8403643.14902529"},"orbiting_body":"Merc"},{"close_approach_date":"2015-07-19","close_approach_date_full":"2015-Jul-19 05:52","epoch_date_close_approach":1437285120000,"relative_velocity":{"kilometers_per_second":"21.7513645228","kilometers_per_hour":"78304.9122820058","miles_per_hour":"48655.6273010052"},"miss_distance":{"astronomical":"0.1053744325","lunar":"40.9906542425","kilometers":"15763790.654458775","miles":"9795165.304830095"},"orbiting_body":"Venus"},{"close_approach_date":"2015-07-30","close_approach_date_full":"2015-Jul-30 10:21","epoch_date_close_approach":1438251660000,"relative_velocity":{"kilometers_per_second":"25.0600247601","kilometers_per_hour":"90216.0891362556","miles_per_hour":"56056.7693858028"},"miss_distance":{"astronomical":"0.2516130894","lunar":"97.8774917766","kilometers":"37640782.238359578","miles":"23388897.5253270564"},"orbiting_body":"Earth"},{"close_approach_date":"2016-08-13","close_approach_date_full":"2016-Aug-13 04:21","epoch_date_close_approach":1471062060000,"relative_velocity":{"kilometers_per_second":"29.1946932028","kilometers_per_hour":"105100.8955301621","miles_per_hour":"65305.6092253943"},"miss_distance":{"astronomical":"0.0668617355","lunar":"26.0092151095","kilometers":"10002373.215303385","miles":"6215186.513961313"},"orbiting_body":"Merc"},{"close_approach_date":"2018-04-22","close_approach_date_full":"2018-Apr-22 13:15","epoch_date_close_approach":1524402900000,"relative_velocity":{"kilometers_per_second":"33.2218784702","kilometers_per_hour":"119598.7624928255","miles_per_hour":"74314.0199500559"},"miss_distance":{"astronomical":"0.0632976359","lunar":"24.6227803651","kilometers":"9469191.506675533","miles":"5883882.7629790354"},"orbiting_body":"Merc"},{"close_approach_date":"2018-09-03","close_approach_date_full":"2018-Sep-03 13:36","epoch_date_close_approach":1535981760000,"relative_velocity":{"kilometers_per_second":"19.6774015159","kilometers_per_hour":"70838.6454572706","miles_per_hour":"44016.3794509357"},"miss_distance":{"astronomical":"0.1721372249","lunar":"66.9613804861","kilometers":"25751362.192750963","miles":"16001154.4831827694"},"orbiting_body":"Earth"},{"close_approach_date":"2019-07-26","close_approach_date_full":"2019-Jul-26 15:04","epoch_date_close_approach":1564153440000,"relative_velocity":{"kilometers_per_second":"16.4909557685","kilometers_per_hour":"59367.4407665503","miles_per_hour":"36888.6189585268"},"miss_distance":{"astronomical":"0.0210717866","lunar":"8.1969249874","kilometers":"3152294.392454542","miles":"1958744.9072629996"},"orbiting_body":"Earth"},{"close_approach_date":"2019-12-30","close_approach_date_full":"2019-Dec-30 17:39","epoch_date_close_approach":1577727540000,"relative_velocity":{"kilometers_per_second":"36.9899086887","kilometers_per_hour":"133163.6712794345","miles_per_hour":"82742.7267458242"},"miss_distance":{"astronomical":"0.0800948661","lunar":"31.1569029129","kilometers":"11982021.366495207","miles":"7445282.8347875766"},"orbiting_body":"Merc"},{"close_approach_date":"2022-04-25","close_approach_date_full":"2022-Apr-25 02:39","epoch_date_close_approach":1650854340000,"relative_velocity":{"kilometers_per_second":"20.5915436552","kilometers_per_hour":"74129.5571586052","miles_per_hour":"46061.2240022455"},"miss_distance":{"astronomical":"0.1354750163","lunar":"52.6997813407","kilometers":"20266773.876695281","miles":"12593189.3330296378"},"orbiting_body":"Venus"},{"close_approach_date":"2022-08-25","close_approach_date_full":"2022-Aug-25 05:02","epoch_date_close_approach":1661403720000,"relative_velocity":{"kilometers_per_second":"29.7283974816","kilometers_per_hour":"107022.230933612","miles_per_hour":"66499.4523264991"},"miss_distance":{"astronomical":"0.4190750573","lunar":"163.0201972897","kilometers":"62692735.942207951","miles":"38955459.7258176838"},"orbiting_body":"Earth"},{"close_approach_date":"2023-08-16","close_approach_date_full":"2023-Aug-16 11:36","epoch_date_close_approach":1692185760000,"relative_velocity":{"kilometers_per_second":"14.3080496891","kilometers_per_hour":"51508.9788808378","miles_per_hour":"32005.6763495961"},"miss_distance":{"astronomical":"0.1470728362","lunar":"57.2113332818","kilometers":"22001783.030378894","miles":"13671274.0296769772"},"orbiting_body":"Earth"},{"close_approach_date":"2024-08-01","close_approach_date_full":"2024-Aug-01 14:16","epoch_date_close_approach":1722521760000,"relative_velocity":{"kilometers_per_second":"27.7344109552","kilometers_per_hour":"99843.8794386538","miles_per_hour":"62039.1038656457"},"miss_distance":{"astronomical":"0.3268193058","lunar":"127.1327099562","kilometers":"48891472.022558646","miles":"30379751.9869994748"},"orbiting_body":"Earth"},{"close_approach_date":"2026-02-17","close_approach_date_full":"2026-Feb-17 01:37","epoch_date_close_approach":1771292220000,"relative_velocity":{"kilometers_per_second":"45.0013671541","kilometers_per_hour":"162004.9217546376","miles_per_hour":"100663.5581869302"},"miss_distance":{"astronomical":"0.0859102769","lunar":"33.4190977141","kilometers":"12851994.435350203","miles":"7985859.0329226814"},"orbiting_body":"Merc"},{"close_approach_date":"2027-09-03","close_approach_date_full":"2027-Sep-03 22:29","epoch_date_close_approach":1820010540000,"relative_velocity":{"kilometers_per_second":"17.647867454","kilometers_per_hour":"63532.3228345332","miles_per_hour":"39476.5147079354"},"miss_distance":{"astronomical":"0.1384016312","lunar":"53.8382345368","kilometers":"20704589.232045544","miles":"12865235.1799107472"},"orbiting_body":"Earth"},{"close_approach_date":"2027-10-27","close_approach_date_full":"2027-Oct-27 08:34","epoch_date_close_approach":1824626040000,"relative_velocity":{"kilometers_per_second":"37.9112424643","kilometers_per_hour":"136480.4728715624","miles_per_hour":"84803.6582684439"},"miss_distance":{"astronomical":"0.0464755868","lunar":"18.0790032652","kilometers":"6952648.792280116","miles":"4320175.6303169608"},"orbiting_body":"Merc"},{"close_approach_date":"2028-07-25","close_approach_date_full":"2028-Jul-25 02:35","epoch_date_close_approach":1848105300000,"relative_velocity":{"kilometers_per_second":"18.145395743","kilometers_per_hour":"65323.4246746204","miles_per_hour":"40589.4357374051"},"miss_distance":{"astronomical":"0.0460533054","lunar":"17.9147358006","kilometers":"6889476.394299498","miles":"4280922.1224211524"},"orbiting_body":"Earth"},{"close_approach_date":"2029-07-06","close_approach_date_full":"2029-Jul-06 02:17","epoch_date_close_approach":1877998620000,"relative_velocity":{"kilometers_per_second":"31.2632884917","kilometers_per_hour":"112547.8385701351","miles_per_hour":"69932.8500270931"},"miss_distance":{"astronomical":"0.04282169","lunar":"16.65763741","kilometers":"6406033.6138003","miles":"3980524.70823214"},"orbiting_body":"Merc"},{"close_approach_date":"2031-03-17","close_approach_date_full":"2031-Mar-17 00:49","epoch_date_close_approach":1931474940000,"relative_velocity":{"kilometers_per_second":"27.9823106024","kilometers_per_hour":"100736.318168762","miles_per_hour":"62593.6305865844"},"miss_distance":{"astronomical":"0.0796441489","lunar":"30.9815739221","kilometers":"11914595.033402843","miles":"7403386.0541835134"},"orbiting_body":"Merc"},{"close_approach_date":"2031-08-28","close_approach_date_full":"2031-Aug-28 10:32","epoch_date_close_approach":1945679520000,"relative_velocity":{"kilometers_per_second":"27.1867957919","kilometers_per_hour":"97872.4648506989","miles_per_hour":"60814.1435068134"},"miss_distance":{"astronomical":"0.3539190723","lunar":"137.6745191247","kilometers":"52945539.368456001","miles":"32898832.6244187738"},"orbiting_body":"Earth"},{"close_approach_date":"2032-08-09","close_approach_date_full":"2032-Aug-09 05:03","epoch_date_close_approach":1975640580000,"relative_velocity":{"kilometers_per_second":"14.3317632995","kilometers_per_hour":"51594.3478783357","miles_per_hour":"32058.7213247359"},"miss_distance":{"astronomical":"0.1365572263","lunar":"53.1207610307","kilometers":"20428670.187587981","miles":"12693787.0358408978"},"orbiting_body":"Earth"},{"close_approach_date":"2033-08-04","close_approach_date_full":"2033-Aug-04 23:21","epoch_date_close_approach":2006810460000,"relative_velocity":{"kilometers_per_second":"30.3614006406","kilometers_per_hour":"109301.0423062885","miles_per_hour":"67915.417093038"},"miss_distance":{"astronomical":"0.3990271424","lunar":"155.2215583936","kilometers":"59693610.575226688","miles":"37091889.6376687744"},"orbiting_body":"Earth"},{"close_approach_date":"2035-03-31","close_approach_date_full":"2035-Mar-31 08:59","epoch_date_close_approach":2058944340000,"relative_velocity":{"kilometers_per_second":"31.8623894272","kilometers_per_hour":"114704.6019378966","miles_per_hour":"71272.9789096891"},"miss_distance":{"astronomical":"0.1418642403","lunar":"55.1851894767","kilometers":"21222588.178048161","miles":"13187104.7996641818"},"orbiting_body":"Venus"},{"close_approach_date":"2036-09-01","close_approach_date_full":"2036-Sep-01 06:49","epoch_date_close_approach":2103864540000,"relative_velocity":{"kilometers_per_second":"15.8741360332","kilometers_per_hour":"57146.8897195546","miles_per_hour":"35508.8548926866"},"miss_distance":{"astronomical":"0.127172464","lunar":"49.470088496","kilometers":"19024729.73705168","miles":"11821418.892125984"},"orbiting_body":"Earth"},{"close_approach_date":"2037-07-26","close_approach_date_full":"2037-Jul-26 03:24","epoch_date_close_approach":2132191440000,"relative_velocity":{"kilometers_per_second":"20.4506369579","kilometers_per_hour":"73622.2930485818","miles_per_hour":"45746.0298112146"},"miss_distance":{"astronomical":"0.1170882875","lunar":"45.5473438375","kilometers":"17516158.411947625","miles":"10884036.137722225"},"orbiting_body":"Earth"},{"close_approach_date":"2040-08-30","close_approach_date_full":"2040-Aug-30 18:25","epoch_date_close_approach":2229963900000,"relative_velocity":{"kilometers_per_second":"24.3488992017","kilometers_per_hour":"87656.0371261715","miles_per_hour":"54466.0526243147"},"miss_distance":{"astronomical":"0.2809129708","lunar":"109.2751456412","kilometers":"42023982.087052196","miles":"26112491.6165684648"},"orbiting_body":"Earth"},{"close_approach_date":"2041-08-02","close_approach_date_full":"2041-Aug-02 14:58","epoch_date_close_approach":2259068280000,"relative_velocity":{"kilometers_per_second":"14.6157341675","kilometers_per_hour":"52616.643002919","miles_per_hour":"32693.9357592304"},"miss_distance":{"astronomical":"0.1070525931","lunar":"41.6434587159","kilometers":"16014839.905736697","miles":"9951160.0760005386"},"orbiting_body":"Earth"},{"close_approach_date":"2042-01-04","close_approach_date_full":"2042-Jan-04 00:08","epoch_date_close_approach":2272406880000,"relative_velocity":{"kilometers_per_second":"30.14926689","kilometers_per_hour":"108537.360803978","miles_per_hour":"67440.8951062274"},"miss_distance":{"astronomical":"0.1112658659","lunar":"43.2824218351","kilometers":"16645136.542345633","miles":"10342808.2450224154"},"orbiting_body":"Venus"},{"close_approach_date":"2042-08-08","close_approach_date_full":"2042-Aug-08 21:09","epoch_date_close_approach":2291144940000,"relative_velocity":{"kilometers_per_second":"33.3039907871","kilometers_per_hour":"119894.3668336468","miles_per_hour":"74497.6969917179"},"miss_distance":{"astronomical":"0.4787006082","lunar":"186.2145365898","kilometers":"71612591.354424534","miles":"44498000.8679212092"},"orbiting_body":"Earth"},{"close_approach_date":"2045-08-27","close_approach_date_full":"2045-Aug-27 17:08","epoch_date_close_approach":2387466480000,"relative_velocity":{"kilometers_per_second":"14.7934942439","kilometers_per_hour":"53256.57927786","miles_per_hour":"33091.5672740681"},"miss_distance":{"astronomical":"0.1371397313","lunar":"53.3473554757","kilometers":"20515811.694852331","miles":"12747934.2576149278"},"orbiting_body":"Earth"},{"close_approach_date":"2046-06-24","close_approach_date_full":"2046-Jun-24 11:35","epoch_date_close_approach":2413452900000,"relative_velocity":{"kilometers_per_second":"27.1290078615","kilometers_per_hour":"97664.4283013597","miles_per_hour":"60684.8776853643"},"miss_distance":{"astronomical":"0.076774935","lunar":"29.865449715","kilometers":"11485366.74538845","miles":"7136675.96352261"},"orbiting_body":"Merc"},{"close_approach_date":"2046-07-28","close_approach_date_full":"2046-Jul-28 11:52","epoch_date_close_approach":2416391520000,"relative_velocity":{"kilometers_per_second":"23.1600788974","kilometers_per_hour":"83376.2840307527","miles_per_hour":"51806.7804856641"},"miss_distance":{"astronomical":"0.1968900856","lunar":"76.5902432984","kilometers":"29454337.429877672","miles":"18302076.6003569936"},"orbiting_body":"Earth"},{"close_approach_date":"2048-03-02","close_approach_date_full":"2048-Mar-02 22:03","epoch_date_close_approach":2466799380000,"relative_velocity":{"kilometers_per_second":"31.1272878357","kilometers_per_hour":"112058.2362085056","miles_per_hour":"69628.6301596684"},"miss_distance":{"astronomical":"0.0618477281","lunar":"24.0587662309","kilometers":"9252288.388099147","miles":"5749105.4148043486"},"orbiting_body":"Merc"},{"close_approach_date":"2048-10-09","close_approach_date_full":"2048-Oct-09 17:38","epoch_date_close_approach":2485877880000,"relative_velocity":{"kilometers_per_second":"28.5207832608","kilometers_per_hour":"102674.819738768","miles_per_hour":"63798.140076014"},"miss_distance":{"astronomical":"0.0841197486","lunar":"32.7225822054","kilometers":"12584135.215495482","miles":"7819419.0316303716"},"orbiting_body":"Venus"},{"close_approach_date":"2049-09-02","close_approach_date_full":"2049-Sep-02 11:47","epoch_date_close_approach":2514196020000,"relative_velocity":{"kilometers_per_second":"21.4771079427","kilometers_per_hour":"77317.5885936646","miles_per_hour":"48042.1427569912"},"miss_distance":{"astronomical":"0.2117602028","lunar":"82.3747188892","kilometers":"31678875.289648036","miles":"19684340.3299974568"},"orbiting_body":"Earth"},{"close_approach_date":"2049-11-10","close_approach_date_full":"2049-Nov-10 05:33","epoch_date_close_approach":2520135180000,"relative_velocity":{"kilometers_per_second":"35.1246255049","kilometers_per_hour":"126448.6518177671","miles_per_hour":"78570.2747919898"},"miss_distance":{"astronomical":"0.0696046574","lunar":"27.0762117286","kilometers":"10412708.489119738","miles":"6470157.0299708644"},"orbiting_body":"Merc"},{"close_approach_date":"2050-07-28","close_approach_date_full":"2050-Jul-28 14:11","epoch_date_close_approach":2542630260000,"relative_velocity":{"kilometers_per_second":"15.4691610282","kilometers_per_hour":"55688.979701628","miles_per_hour":"34602.9663040477"},"miss_distance":{"astronomical":"0.0585971115","lunar":"22.7942763735","kilometers":"8766003.068552505","miles":"5446941.728754369"},"orbiting_body":"Earth"},{"close_approach_date":"2051-07-20","close_approach_date_full":"2051-Jul-20 08:50","epoch_date_close_approach":2573455800000,"relative_velocity":{"kilometers_per_second":"38.8464989626","kilometers_per_hour":"139847.396265482","miles_per_hour":"86895.7335295158"},"miss_distance":{"astronomical":"0.0923955594","lunar":"35.9418726066","kilometers":"13822178.883698478","miles":"8588703.6948478764"},"orbiting_body":"Merc"},{"close_approach_date":"2053-08-22","close_approach_date_full":"2053-Aug-22 19:46","epoch_date_close_approach":2639504760000,"relative_velocity":{"kilometers_per_second":"31.6425914149","kilometers_per_hour":"113913.3290937642","miles_per_hour":"70781.312736067"},"miss_distance":{"astronomical":"0.4692609284","lunar":"182.5425011476","kilometers":"70200435.362862508","miles":"43620527.8237302904"},"orbiting_body":"Earth"},{"close_approach_date":"2054-08-21","close_approach_date_full":"2054-Aug-21 03:23","epoch_date_close_approach":2670895380000,"relative_velocity":{"kilometers_per_second":"14.3683341468","kilometers_per_hour":"51726.0029283752","miles_per_hour":"32140.5266529118"},"miss_distance":{"astronomical":"0.1474042211","lunar":"57.3402420079","kilometers":"22051357.505569057","miles":"13702078.1801527066"},"orbiting_body":"Earth"},{"close_approach_date":"2055-07-16","close_approach_date_full":"2055-Jul-16 12:04","epoch_date_close_approach":2699352240000,"relative_velocity":{"kilometers_per_second":"26.8011856029","kilometers_per_hour":"96484.268170413","miles_per_hour":"59951.5720751102"},"miss_distance":{"astronomical":"0.0616360723","lunar":"23.9764321247","kilometers":"9220625.131246001","miles":"5729430.7793207738"},"orbiting_body":"Venus"},{"close_approach_date":"2055-07-31","close_approach_date_full":"2055-Jul-31 13:58","epoch_date_close_approach":2700655080000,"relative_velocity":{"kilometers_per_second":"25.9819381496","kilometers_per_hour":"93534.9773387296","miles_per_hour":"58118.9974469456"},"miss_distance":{"astronomical":"0.2772139937","lunar":"107.8362435493","kilometers":"41470622.991713419","miles":"25768650.2188624222"},"orbiting_body":"Earth"},{"close_approach_date":"2055-12-30","close_approach_date_full":"2055-Dec-30 00:31","epoch_date_close_approach":2713739460000,"relative_velocity":{"kilometers_per_second":"46.2013370162","kilometers_per_hour":"166324.8132583913","miles_per_hour":"103347.7707715821"},"miss_distance":{"astronomical":"0.0932708405","lunar":"36.2823569545","kilometers":"13953119.071909735","miles":"8670066.154974943"},"orbiting_body":"Merc"},{"close_approach_date":"2057-09-07","close_approach_date_full":"2057-Sep-07 11:45","epoch_date_close_approach":2767088700000,"relative_velocity":{"kilometers_per_second":"38.1654552775","kilometers_per_hour":"137395.6389990392","miles_per_hour":"85372.3069102641"},"miss_distance":{"astronomical":"0.0474420501","lunar":"18.4549574889","kilometers":"7097229.643393287","miles":"4410014.0053378806"},"orbiting_body":"Merc"},{"close_approach_date":"2058-09-03","close_approach_date_full":"2058-Sep-03 23:45","epoch_date_close_approach":2798322300000,"relative_velocity":{"kilometers_per_second":"18.9175813354","kilometers_per_hour":"68103.2928074069","miles_per_hour":"42316.7376891357"},"miss_distance":{"astronomical":"0.158563741","lunar":"61.681295249","kilometers":"23720797.91283167","miles":"14739420.347030246"},"orbiting_body":"Earth"},{"close_approach_date":"2059-05-18","close_approach_date_full":"2059-May-18 08:29","epoch_date_close_approach":2820472140000,"relative_velocity":{"kilometers_per_second":"31.0493032017","kilometers_per_hour":"111777.4915260948","miles_per_hour":"69454.1863318671"},"miss_distance":{"astronomical":"0.0436342483","lunar":"16.9737225887","kilometers":"6527590.604731121","miles":"4056056.7199306298"},"orbiting_body":"Merc"},{"close_approach_date":"2059-07-26","close_approach_date_full":"2059-Jul-26 08:27","epoch_date_close_approach":2826433620000,"relative_velocity":{"kilometers_per_second":"17.0165118352","kilometers_per_hour":"61259.4426068971","miles_per_hour":"38064.2353242689"},"miss_distance":{"astronomical":"0.0159634684","lunar":"6.2097892076","kilometers":"2388100.870452308","miles":"1483897.0716775304"},"orbiting_body":"Earth"},{"close_approach_date":"2061-01-26","close_approach_date_full":"2061-Jan-26 23:41","epoch_date_close_approach":2874008460000,"relative_velocity":{"kilometers_per_second":"28.1419894369","kilometers_per_hour":"101311.1619729415","miles_per_hour":"62950.8161714647"},"miss_distance":{"astronomical":"0.0868357901","lunar":"33.7791223489","kilometers":"12990449.238727087","miles":"8071890.8583923206"},"orbiting_body":"Merc"},{"close_approach_date":"2062-04-21","close_approach_date_full":"2062-Apr-21 14:26","epoch_date_close_approach":2912855160000,"relative_velocity":{"kilometers_per_second":"25.5439761798","kilometers_per_hour":"91958.3142473203","miles_per_hour":"57139.3203166197"},"miss_distance":{"astronomical":"0.05533293","lunar":"21.52450977","kilometers":"8277688.4688591","miles":"5143517.10649158"},"orbiting_body":"Venus"},{"close_approach_date":"2062-08-26","close_approach_date_full":"2062-Aug-26 22:02","epoch_date_close_approach":2923855320000,"relative_velocity":{"kilometers_per_second":"28.5138596312","kilometers_per_hour":"102649.8946724039","miles_per_hour":"63782.6526090834"},"miss_distance":{"astronomical":"0.3881638716","lunar":"150.9957460524","kilometers":"58068488.402313492","miles":"36082085.5446585096"},"orbiting_body":"Earth"},{"close_approach_date":"2063-08-13","close_approach_date_full":"2063-Aug-13 06:27","epoch_date_close_approach":2954212020000,"relative_velocity":{"kilometers_per_second":"14.2803922999","kilometers_per_hour":"51409.4122797988","miles_per_hour":"31943.809535745"},"miss_distance":{"astronomical":"0.1441007005","lunar":"56.0551724945","kilometers":"21557157.860307935","miles":"13394996.760142103"},"orbiting_body":"Earth"},{"close_approach_date":"2064-08-03","close_approach_date_full":"2064-Aug-03 12:34","epoch_date_close_approach":2984992440000,"relative_velocity":{"kilometers_per_second":"29.1867272544","kilometers_per_hour":"105072.2181157446","miles_per_hour":"65287.7901953081"},"miss_distance":{"astronomical":"0.3671915689","lunar":"142.8375203021","kilometers":"54931076.589398243","miles":"34132588.2435040334"},"orbiting_body":"Earth"},{"close_approach_date":"2067-09-03","close_approach_date_full":"2067-Sep-03 04:17","epoch_date_close_approach":3082249020000,"relative_velocity":{"kilometers_per_second":"16.3975959933","kilometers_per_hour":"59031.345575979","miles_per_hour":"36679.7824774743"},"miss_distance":{"astronomical":"0.1289645304","lunar":"50.1672023256","kilometers":"19292819.053390248","miles":"11988001.8687435024"},"orbiting_body":"Earth"},{"close_approach_date":"2068-07-25","close_approach_date_full":"2068-Jul-25 16:22","epoch_date_close_approach":3110458920000,"relative_velocity":{"kilometers_per_second":"19.7435256455","kilometers_per_hour":"71076.6923236394","miles_per_hour":"44164.2925163192"},"miss_distance":{"astronomical":"0.0952645521","lunar":"37.0579107669","kilometers":"14251374.080664027","miles":"8855393.2236844926"},"orbiting_body":"Earth"},{"close_approach_date":"2069-01-25","close_approach_date_full":"2069-Jan-25 23:05","epoch_date_close_approach":3126380700000,"relative_velocity":{"kilometers_per_second":"24.7638596881","kilometers_per_hour":"89149.8948773386","miles_per_hour":"55394.2777364218"},"miss_distance":{"astronomical":"0.0576069442","lunar":"22.4091012938","kilometers":"8617876.149528854","miles":"5354899.9293080252"},"orbiting_body":"Venus"},{"close_approach_date":"2071-08-31","close_approach_date_full":"2071-Aug-31 03:02","epoch_date_close_approach":3208215720000,"relative_velocity":{"kilometers_per_second":"24.9297231931","kilometers_per_hour":"89747.0034950423","miles_per_hour":"55765.2978105722"},"miss_distance":{"astronomical":"0.2966900249","lunar":"115.4124196861","kilometers":"44384195.775286963","miles":"27579060.3967395694"},"orbiting_body":"Earth"},{"close_approach_date":"2072-08-03","close_approach_date_full":"2072-Aug-03 17:18","epoch_date_close_approach":3237470280000,"relative_velocity":{"kilometers_per_second":"14.5119203427","kilometers_per_hour":"52242.9132337992","miles_per_hour":"32461.7146146348"},"miss_distance":{"astronomical":"0.1143515268","lunar":"44.4827439252","kilometers":"17106744.840527916","miles":"10629638.3410246008"},"orbiting_body":"Earth"},{"close_approach_date":"2072-12-19","close_approach_date_full":"2072-Dec-19 17:55","epoch_date_close_approach":3249395700000,"relative_velocity":{"kilometers_per_second":"24.2741915764","kilometers_per_hour":"87387.0896748773","miles_per_hour":"54298.9391371481"},"miss_distance":{"astronomical":"0.0959291708","lunar":"37.3164474412","kilometers":"14350799.622546196","miles":"8917173.3906256648"},"orbiting_body":"Merc"},{"close_approach_date":"2073-08-08","close_approach_date_full":"2073-Aug-08 05:24","epoch_date_close_approach":3269395440000,"relative_velocity":{"kilometers_per_second":"32.8611015196","kilometers_per_hour":"118299.9654706306","miles_per_hour":"73506.9979892371"},"miss_distance":{"astronomical":"0.4662803913","lunar":"181.3830722157","kilometers":"69754553.361246531","miles":"43343469.5952868878"},"orbiting_body":"Earth"},{"close_approach_date":"2074-08-29","close_approach_date_full":"2074-Aug-29 14:06","epoch_date_close_approach":3302777160000,"relative_velocity":{"kilometers_per_second":"28.7904343434","kilometers_per_hour":"103645.5636362126","miles_per_hour":"64401.3225827345"},"miss_distance":{"astronomical":"0.0682964576","lunar":"26.5673220064","kilometers":"10217004.585505312","miles":"6348552.2631528256"},"orbiting_body":"Merc"},{"close_approach_date":"2075-11-02","close_approach_date_full":"2075-Nov-02 09:54","epoch_date_close_approach":3339914040000,"relative_velocity":{"kilometers_per_second":"24.0971789469","kilometers_per_hour":"86749.8442088843","miles_per_hour":"53902.9795863481"},"miss_distance":{"astronomical":"0.0635694282","lunar":"24.7285075698","kilometers":"9509851.055837934","miles":"5909147.4352901292"},"orbiting_body":"Venus"},{"close_approach_date":"2076-05-08","close_approach_date_full":"2076-May-08 02:41","epoch_date_close_approach":3356131260000,"relative_velocity":{"kilometers_per_second":"33.1767289712","kilometers_per_hour":"119436.2242962656","miles_per_hour":"74213.0250356435"},"miss_distance":{"astronomical":"0.063092324","lunar":"24.542914036","kilometers":"9438477.28374988","miles":"5864797.829833144"},"orbiting_body":"Merc"},{"close_approach_date":"2076-08-28","close_approach_date_full":"2076-Aug-28 03:23","epoch_date_close_approach":3365810580000,"relative_velocity":{"kilometers_per_second":"14.8714842313","kilometers_per_hour":"53537.3432327063","miles_per_hour":"33266.0230770113"},"miss_distance":{"astronomical":"0.1369608984","lunar":"53.2777894776","kilometers":"20489058.673926408","miles":"12731310.7012561104"},"orbiting_body":"Earth"},{"close_approach_date":"2077-07-28","close_approach_date_full":"2077-Jul-28 06:12","epoch_date_close_approach":3394678320000,"relative_velocity":{"kilometers_per_second":"22.9874137535","kilometers_per_hour":"82754.6895126367","miles_per_hour":"51420.545825227"},"miss_distance":{"astronomical":"0.1914084625","lunar":"74.4578919125","kilometers":"28634298.289974875","miles":"17792527.906908275"},"orbiting_body":"Earth"},{"close_approach_date":"2078-01-15","close_approach_date_full":"2078-Jan-15 10:46","epoch_date_close_approach":3409469160000,"relative_velocity":{"kilometers_per_second":"37.3824121227","kilometers_per_hour":"134576.6836417358","miles_per_hour":"83620.7176772775"},"miss_distance":{"astronomical":"0.0825838726","lunar":"32.1251264414","kilometers":"12354371.437311362","miles":"7676650.4401343156"},"orbiting_body":"Merc"},{"close_approach_date":"2080-09-02","close_approach_date_full":"2080-Sep-02 09:44","epoch_date_close_approach":3492495840000,"relative_velocity":{"kilometers_per_second":"21.5133700548","kilometers_per_hour":"77448.132197176","miles_per_hour":"48123.2574755175"},"miss_distance":{"astronomical":"0.2134285036","lunar":"83.0236879004","kilometers":"31928449.535847332","miles":"19839418.5755119016"},"orbiting_body":"Earth"},{"close_approach_date":"2081-07-28","close_approach_date_full":"2081-Jul-28 11:23","epoch_date_close_approach":3520927380000,"relative_velocity":{"kilometers_per_second":"15.4685927602","kilometers_per_hour":"55686.9339367596","miles_per_hour":"34601.695145316"},"miss_distance":{"astronomical":"0.0582126008","lunar":"22.6447017112","kilometers":"8708481.086840296","miles":"5411199.2267202448"},"orbiting_body":"Earth"},{"close_approach_date":"2082-06-27","close_approach_date_full":"2082-Jun-27 15:28","epoch_date_close_approach":3549799680000,"relative_velocity":{"kilometers_per_second":"46.2682509382","kilometers_per_hour":"166565.7033776903","miles_per_hour":"103497.4505237654"},"miss_distance":{"astronomical":"0.0936600339","lunar":"36.4337531871","kilometers":"14011341.575567793","miles":"8706243.9411618234"},"orbiting_body":"Merc"},{"close_approach_date":"2082-08-08","close_approach_date_full":"2082-Aug-08 20:22","epoch_date_close_approach":3553446120000,"relative_velocity":{"kilometers_per_second":"23.2646186139","kilometers_per_hour":"83752.6270100522","miles_per_hour":"52040.6253774405"},"miss_distance":{"astronomical":"0.0750954144","lunar":"29.2121162016","kilometers":"11234114.041007328","miles":"6980554.7724560064"},"orbiting_body":"Venus"},{"close_approach_date":"2084-03-06","close_approach_date_full":"2084-Mar-06 02:52","epoch_date_close_approach":3603149520000,"relative_velocity":{"kilometers_per_second":"38.1861098279","kilometers_per_hour":"137469.995380548","miles_per_hour":"85418.5090740966"},"miss_distance":{"astronomical":"0.047454638","lunar":"18.459854182","kilometers":"7099112.76642106","miles":"4411184.123728228"},"orbiting_body":"Merc"},{"close_approach_date":"2084-08-22","close_approach_date_full":"2084-Aug-22 20:40","epoch_date_close_approach":3617815200000,"relative_velocity":{"kilometers_per_second":"31.5518680173","kilometers_per_hour":"113586.7248622447","miles_per_hour":"70578.3735678764"},"miss_distance":{"astronomical":"0.4670723089","lunar":"181.6911281621","kilometers":"69873022.547422043","miles":"43417082.9340804734"},"orbiting_body":"Earth"},{"close_approach_date":"2085-08-20","close_approach_date_full":"2085-Aug-20 17:22","epoch_date_close_approach":3649166520000,"relative_velocity":{"kilometers_per_second":"14.3803273208","kilometers_per_hour":"51769.1783549693","miles_per_hour":"32167.354183953"},"miss_distance":{"astronomical":"0.1482686924","lunar":"57.6765213436","kilometers":"22180680.570725188","miles":"13782435.8066080744"},"orbiting_body":"Earth"},{"close_approach_date":"2085-11-14","close_approach_date_full":"2085-Nov-14 00:11","epoch_date_close_approach":3656535060000,"relative_velocity":{"kilometers_per_second":"31.0097573519","kilometers_per_hour":"111635.1264667799","miles_per_hour":"69365.7262204278"},"miss_distance":{"astronomical":"0.0438607021","lunar":"17.0618131169","kilometers":"6561467.610864527","miles":"4077106.9154313926"},"orbiting_body":"Merc"},{"close_approach_date":"2086-07-31","close_approach_date_full":"2086-Jul-31 15:41","epoch_date_close_approach":3678968460000,"relative_velocity":{"kilometers_per_second":"26.1126834747","kilometers_per_hour":"94005.6605090906","miles_per_hour":"58411.4616646625"},"miss_distance":{"astronomical":"0.281341759","lunar":"109.441944251","kilometers":"42088127.88845333","miles":"26152349.969302754"},"orbiting_body":"Earth"},{"close_approach_date":"2087-07-26","close_approach_date_full":"2087-Jul-26 07:44","epoch_date_close_approach":3710043840000,"relative_velocity":{"kilometers_per_second":"28.0454792748","kilometers_per_hour":"100963.7253891724","miles_per_hour":"62734.9325897332"},"miss_distance":{"astronomical":"0.084303211","lunar":"32.793949079","kilometers":"12611580.79976057","miles":"7836472.926893066"},"orbiting_body":"Merc"},{"close_approach_date":"2089-05-15","close_approach_date_full":"2089-May-15 07:30","epoch_date_close_approach":3766980600000,"relative_velocity":{"kilometers_per_second":"22.0539073021","kilometers_per_hour":"79394.0662875442","miles_per_hour":"49332.3852440576"},"miss_distance":{"astronomical":"0.0981557638","lunar":"38.1825921182","kilometers":"14683893.192703106","miles":"9124148.1375746228"},"orbiting_body":"Venus"},{"close_approach_date":"2089-09-03","close_approach_date_full":"2089-Sep-03 22:14","epoch_date_close_approach":3776624040000,"relative_velocity":{"kilometers_per_second":"18.7627480231","kilometers_per_hour":"67545.892883304","miles_per_hour":"41970.3910529619"},"miss_distance":{"astronomical":"0.1566852273","lunar":"60.9505534197","kilometers":"23439776.264545851","miles":"14564801.5919647038"},"orbiting_body":"Earth"},{"close_approach_date":"2090-07-26","close_approach_date_full":"2090-Jul-26 04:11","epoch_date_close_approach":3804725460000,"relative_velocity":{"kilometers_per_second":"17.1727225376","kilometers_per_hour":"61821.8011354061","miles_per_hour":"38413.6630443861"},"miss_distance":{"astronomical":"0.0175272611","lunar":"6.8181045679","kilometers":"2622040.927493857","miles":"1629260.6825229466"},"orbiting_body":"Earth"},{"close_approach_date":"2093-08-27","close_approach_date_full":"2093-Aug-27 04:53","epoch_date_close_approach":3902187180000,"relative_velocity":{"kilometers_per_second":"28.212966872","kilometers_per_hour":"101566.6807391428","miles_per_hour":"63109.5855959412"},"miss_distance":{"astronomical":"0.3811785155","lunar":"148.2784425295","kilometers":"57023494.008561985","miles":"35432756.138185993"},"orbiting_body":"Earth"},{"close_approach_date":"2094-08-12","close_approach_date_full":"2094-Aug-12 07:11","epoch_date_close_approach":3932435460000,"relative_velocity":{"kilometers_per_second":"14.2986541807","kilometers_per_hour":"51475.1550506042","miles_per_hour":"31984.6595368602"},"miss_distance":{"astronomical":"0.1428309562","lunar":"55.5612419618","kilometers":"21367206.817583294","miles":"13276966.6553216972"},"orbiting_body":"Earth"},{"close_approach_date":"2095-08-04","close_approach_date_full":"2095-Aug-04 21:09","epoch_date_close_approach":3963330540000,"relative_velocity":{"kilometers_per_second":"29.5845534157","kilometers_per_hour":"106504.392296493","miles_per_hour":"66177.6875355626"},"miss_distance":{"astronomical":"0.3776836024","lunar":"146.9189213336","kilometers":"56500662.452966888","miles":"35107883.6740755344"},"orbiting_body":"Earth"},{"close_approach_date":"2096-02-19","close_approach_date_full":"2096-Feb-19 23:36","epoch_date_close_approach":3980532960000,"relative_velocity":{"kilometers_per_second":"21.5316048899","kilometers_per_hour":"77513.7776034683","miles_per_hour":"48164.0469781106"},"miss_distance":{"astronomical":"0.110057645","lunar":"42.812423905","kilometers":"16464389.26921615","miles":"10230497.09743687"},"orbiting_body":"Venus"},{"close_approach_date":"2098-09-02","close_approach_date_full":"2098-Sep-02 17:14","epoch_date_close_approach":4060516440000,"relative_velocity":{"kilometers_per_second":"16.1464402612","kilometers_per_hour":"58127.1849403625","miles_per_hour":"36117.9722203047"},"miss_distance":{"astronomical":"0.1292844781","lunar":"50.2916619809","kilometers":"19340682.547821647","miles":"12017742.8650748486"},"orbiting_body":"Earth"},{"close_approach_date":"2099-06-18","close_approach_date_full":"2099-Jun-18 04:38","epoch_date_close_approach":4085440680000,"relative_velocity":{"kilometers_per_second":"23.9527165006","kilometers_per_hour":"86229.7794022162","miles_per_hour":"53579.831540227"},"miss_distance":{"astronomical":"0.0982317715","lunar":"38.2121591135","kilometers":"14695263.782726705","miles":"9131213.494590329"},"orbiting_body":"Merc"},{"close_approach_date":"2099-07-26","close_approach_date_full":"2099-Jul-26 18:38","epoch_date_close_approach":4088774280000,"relative_velocity":{"kilometers_per_second":"20.1080570552","kilometers_per_hour":"72389.0053988323","miles_per_hour":"44979.7128268467"},"miss_distance":{"astronomical":"0.1060929324","lunar":"41.2701507036","kilometers":"15871276.709093988","miles":"9861954.0421455144"},"orbiting_body":"Earth"},{"close_approach_date":"2101-02-26","close_approach_date_full":"2101-Feb-26 04:13","epoch_date_close_approach":4138834380000,"relative_velocity":{"kilometers_per_second":"28.746411047","kilometers_per_hour":"103487.0797690441","miles_per_hour":"64302.8468709374"},"miss_distance":{"astronomical":"0.0683823049","lunar":"26.6007166061","kilometers":"10229847.158730563","miles":"6356532.2681172494"},"orbiting_body":"Merc"},{"close_approach_date":"2102-09-01","close_approach_date_full":"2102-Sep-01 12:31","epoch_date_close_approach":4186557060000,"relative_velocity":{"kilometers_per_second":"24.4512035544","kilometers_per_hour":"88024.3327957288","miles_per_hour":"54694.8972307682"},"miss_distance":{"astronomical":"0.285022386","lunar":"110.873708154","kilometers":"42638741.84791782","miles":"26494485.618673116"},"orbiting_body":"Earth"},{"close_approach_date":"2102-11-05","close_approach_date_full":"2102-Nov-05 19:36","epoch_date_close_approach":4192198560000,"relative_velocity":{"kilometers_per_second":"33.4355042037","kilometers_per_hour":"120367.81513345","miles_per_hour":"74791.8793533373"},"miss_distance":{"astronomical":"0.0637183785","lunar":"24.7864492365","kilometers":"9532133.703453795","miles":"5922993.230480571"},"orbiting_body":"Merc"},{"close_approach_date":"2102-11-27","close_approach_date_full":"2102-Nov-27 17:14","epoch_date_close_approach":4194090840000,"relative_velocity":{"kilometers_per_second":"21.1540464605","kilometers_per_hour":"76154.567257715","miles_per_hour":"47319.4865274397"},"miss_distance":{"astronomical":"0.1194096712","lunar":"46.4503620968","kilometers":"17863432.468920344","miles":"11099822.2305909872"},"orbiting_body":"Venus"},{"close_approach_date":"2103-08-04","close_approach_date_full":"2103-Aug-04 11:42","epoch_date_close_approach":4215670920000,"relative_velocity":{"kilometers_per_second":"14.6091845591","kilometers_per_hour":"52593.064412702","miles_per_hour":"32679.2849402148"},"miss_distance":{"astronomical":"0.1078638713","lunar":"41.9590459357","kilometers":"16136205.396434131","miles":"10026573.0949717678"},"orbiting_body":"Earth"},{"close_approach_date":"2104-07-15","close_approach_date_full":"2104-Jul-15 05:15","epoch_date_close_approach":4245542100000,"relative_velocity":{"kilometers_per_second":"37.818546749","kilometers_per_hour":"136146.7682963294","miles_per_hour":"84596.3072227943"},"miss_distance":{"astronomical":"0.0854925732","lunar":"33.2566109748","kilometers":"12789506.851539084","miles":"7947031.0488199992"},"orbiting_body":"Merc"},{"close_approach_date":"2104-08-09","close_approach_date_full":"2104-Aug-09 19:00","epoch_date_close_approach":4247751600000,"relative_velocity":{"kilometers_per_second":"33.3444014501","kilometers_per_hour":"120039.8452202628","miles_per_hour":"74588.0916036683"},"miss_distance":{"astronomical":"0.4798609885","lunar":"186.6659245265","kilometers":"71786181.775694495","miles":"44605864.953974231"},"orbiting_body":"Earth"},{"close_approach_date":"2107-08-28","close_approach_date_full":"2107-Aug-28 21:57","epoch_date_close_approach":4344011820000,"relative_velocity":{"kilometers_per_second":"14.7180752774","kilometers_per_hour":"52985.0709984629","miles_per_hour":"32922.862587906"},"miss_distance":{"astronomical":"0.1400169186","lunar":"54.4665813354","kilometers":"20946232.786523382","miles":"13015385.5220993916"},"orbiting_body":"Earth"},{"close_approach_date":"2108-07-29","close_approach_date_full":"2108-Jul-29 15:39","epoch_date_close_approach":4373019540000,"relative_velocity":{"kilometers_per_second":"23.5158637526","kilometers_per_hour":"84657.1095092477","miles_per_hour":"52602.6356281211"},"miss_distance":{"astronomical":"0.2071043291","lunar":"80.5635840199","kilometers":"30982366.501139017","miles":"19251549.8375797546"},"orbiting_body":"Earth"},{"close_approach_date":"2108-12-25","close_approach_date_full":"2108-Dec-25 14:32","epoch_date_close_approach":4385889120000,"relative_velocity":{"kilometers_per_second":"44.60763789","kilometers_per_hour":"160587.4964039215","miles_per_hour":"99782.8251960922"},"miss_distance":{"astronomical":"0.0833685149","lunar":"32.4303522961","kilometers":"12471752.254103263","miles":"7749587.4975525094"},"orbiting_body":"Merc"},{"close_approach_date":"2109-09-03","close_approach_date_full":"2109-Sep-03 12:02","epoch_date_close_approach":4407652920000,"relative_velocity":{"kilometers_per_second":"20.710635719","kilometers_per_hour":"74558.2885884364","miles_per_hour":"46327.6210398537"},"miss_distance":{"astronomical":"0.1314008985","lunar":"51.1149495165","kilometers":"19657294.531686195","miles":"12214476.429191691"},"orbiting_body":"Venus"},{"close_approach_date":"2110-09-04","close_approach_date_full":"2110-Sep-04 10:34","epoch_date_close_approach":4439270040000,"relative_velocity":{"kilometers_per_second":"35.3952857041","kilometers_per_hour":"127423.0285346725","miles_per_hour":"79175.7145914469"},"miss_distance":{"astronomical":"0.0375962532","lunar":"14.6249424948","kilometers":"5624319.398700684","miles":"3494790.0187860792"},"orbiting_body":"Merc"},{"close_approach_date":"2111-09-04","close_approach_date_full":"2111-Sep-04 16:53","epoch_date_close_approach":4470828780000,"relative_velocity":{"kilometers_per_second":"20.9633146808","kilometers_per_hour":"75467.9328508224","miles_per_hour":"46892.8386094457"},"miss_distance":{"astronomical":"0.2016434115","lunar":"78.4392870735","kilometers":"30165424.859933505","miles":"18743925.840572169"},"orbiting_body":"Earth"},{"close_approach_date":"2112-05-15","close_approach_date_full":"2112-May-15 02:28","epoch_date_close_approach":4492722480000,"relative_velocity":{"kilometers_per_second":"28.6024888255","kilometers_per_hour":"102968.9597718176","miles_per_hour":"63980.9072537719"},"miss_distance":{"astronomical":"0.0620997766","lunar":"24.1568130974","kilometers":"9289994.306835842","miles":"5772534.7862729396"},"orbiting_body":"Merc"},{"close_approach_date":"2112-07-28","close_approach_date_full":"2112-Jul-28 14:51","epoch_date_close_approach":4499160660000,"relative_velocity":{"kilometers_per_second":"15.7523756818","kilometers_per_hour":"56708.5524544588","miles_per_hour":"35236.4891626052"},"miss_distance":{"astronomical":"0.0464126554","lunar":"18.0545229506","kilometers":"6943234.388883998","miles":"4314325.7913072524"},"orbiting_body":"Earth"},{"close_approach_date":"2115-08-25","close_approach_date_full":"2115-Aug-25 14:46","epoch_date_close_approach":4596187560000,"relative_velocity":{"kilometers_per_second":"30.8733357684","kilometers_per_hour":"111144.0087663199","miles_per_hour":"69060.5647803836"},"miss_distance":{"astronomical":"0.4501343815","lunar":"175.1022744035","kilometers":"67339144.686167405","miles":"41842604.240643989"},"orbiting_body":"Earth"},{"close_approach_date":"2116-08-19","close_approach_date_full":"2116-Aug-19 21:23","epoch_date_close_approach":4627315380000,"relative_velocity":{"kilometers_per_second":"14.3176564705","kilometers_per_hour":"51543.5632938338","miles_per_hour":"32027.1657588825"},"miss_distance":{"astronomical":"0.1493197315","lunar":"58.0853755535","kilometers":"22337913.781371905","miles":"13880135.993286089"},"orbiting_body":"Earth"},{"close_approach_date":"2117-08-02","close_approach_date_full":"2117-Aug-02 07:27","epoch_date_close_approach":4657332420000,"relative_velocity":{"kilometers_per_second":"26.8103328517","kilometers_per_hour":"96517.1982660368","miles_per_hour":"59972.0335559161"},"miss_distance":{"astronomical":"0.3003484569","lunar":"116.8355497341","kilometers":"44931489.410026803","miles":"27919132.8919957614"},"orbiting_body":"Earth"},{"close_approach_date":"2120-09-04","close_approach_date_full":"2120-Sep-04 20:41","epoch_date_close_approach":4754925660000,"relative_velocity":{"kilometers_per_second":"18.1717486979","kilometers_per_hour":"65418.2953122989","miles_per_hour":"40648.3846622448"},"miss_distance":{"astronomical":"0.1481816971","lunar":"57.6426801719","kilometers":"22167666.259145177","miles":"13774349.0883783626"},"orbiting_body":"Earth"},{"close_approach_date":"2121-07-26","close_approach_date_full":"2121-Jul-26 20:53","epoch_date_close_approach":4783006380000,"relative_velocity":{"kilometers_per_second":"17.6778898183","kilometers_per_hour":"63640.4033458336","miles_per_hour":"39543.6717345264"},"miss_distance":{"astronomical":"0.0308557208","lunar":"12.0028753912","kilometers":"4615950.108994696","miles":"2868218.3966749648"},"orbiting_body":"Earth"},{"close_approach_date":"2124-08-28","close_approach_date_full":"2124-Aug-28 23:15","epoch_date_close_approach":4880560500000,"relative_velocity":{"kilometers_per_second":"27.4624859172","kilometers_per_hour":"98864.9493020521","miles_per_hour":"61430.8347482668"},"miss_distance":{"astronomical":"0.3619003183","lunar":"140.7792238187","kilometers":"54139516.770002021","miles":"33640735.7792330498"},"orbiting_body":"Earth"},{"close_approach_date":"2125-08-11","close_approach_date_full":"2125-Aug-11 07:21","epoch_date_close_approach":4910570460000,"relative_velocity":{"kilometers_per_second":"14.2966010866","kilometers_per_hour":"51467.7639117737","miles_per_hour":"31980.066970624"},"miss_distance":{"astronomical":"0.1387252289","lunar":"53.9641140421","kilometers":"20752998.758702443","miles":"12895315.4649339934"},"orbiting_body":"Earth"},{"close_approach_date":"2125-12-16","close_approach_date_full":"2125-Dec-16 09:00","epoch_date_close_approach":4921549200000,"relative_velocity":{"kilometers_per_second":"25.0987221547","kilometers_per_hour":"90355.399756961","miles_per_hour":"56143.3315878739"},"miss_distance":{"astronomical":"0.0896433614","lunar":"34.8712675846","kilometers":"13410455.925080218","miles":"8332870.9114862884"},"orbiting_body":"Merc"},{"close_approach_date":"2126-08-06","close_approach_date_full":"2126-Aug-06 16:24","epoch_date_close_approach":4941707040000,"relative_velocity":{"kilometers_per_second":"30.3069326763","kilometers_per_hour":"109104.9576346879","miles_per_hour":"67793.5777036204"},"miss_distance":{"astronomical":"0.3979732507","lunar":"154.8115945223","kilometers":"59535950.621696009","miles":"36993924.2852585642"},"orbiting_body":"Earth"},{"close_approach_date":"2127-08-26","close_approach_date_full":"2127-Aug-26 04:58","epoch_date_close_approach":4974929880000,"relative_velocity":{"kilometers_per_second":"29.7756676249","kilometers_per_hour":"107192.4034496598","miles_per_hour":"66605.1909101511"},"miss_distance":{"astronomical":"0.064374585","lunar":"25.041713565","kilometers":"9630300.79813395","miles":"5983991.43459051"},"orbiting_body":"Merc"},{"close_approach_date":"2129-05-04","close_approach_date_full":"2129-May-04 19:12","epoch_date_close_approach":5028289920000,"relative_velocity":{"kilometers_per_second":"34.4308457976","kilometers_per_hour":"123951.0448714378","miles_per_hour":"77018.3589646998"},"miss_distance":{"astronomical":"0.0666681727","lunar":"25.9339191803","kilometers":"9973416.632712149","miles":"6197193.7278756962"},"orbiting_body":"Merc"},{"close_approach_date":"2129-09-02","close_approach_date_full":"2129-Sep-02 17:57","epoch_date_close_approach":5038739820000,"relative_velocity":{"kilometers_per_second":"15.7301011257","kilometers_per_hour":"56628.364052628","miles_per_hour":"35186.6632081454"},"miss_distance":{"astronomical":"0.1299554375","lunar":"50.5526651875","kilometers":"19441056.644918125","miles":"12080112.436895125"},"orbiting_body":"Earth"},{"close_approach_date":"2130-07-28","close_approach_date_full":"2130-Jul-28 02:24","epoch_date_close_approach":5067109440000,"relative_velocity":{"kilometers_per_second":"20.8100066209","kilometers_per_hour":"74916.0238351532","miles_per_hour":"46549.9038102373"},"miss_distance":{"astronomical":"0.127574085","lunar":"49.626319065","kilometers":"19084811.38319895","miles":"11858751.89588751"},"orbiting_body":"Earth"},{"close_approach_date":"2131-01-12","close_approach_date_full":"2131-Jan-12 05:54","epoch_date_close_approach":5081637240000,"relative_velocity":{"kilometers_per_second":"38.9902284993","kilometers_per_hour":"140364.8225975786","miles_per_hour":"87217.2421301455"},"miss_distance":{"astronomical":"0.0937454101","lunar":"36.4669645289","kilometers":"14024113.673236487","miles":"8714180.1546460406"},"orbiting_body":"Merc"},{"close_approach_date":"2133-09-02","close_approach_date_full":"2133-Sep-02 05:39","epoch_date_close_approach":5164925940000,"relative_velocity":{"kilometers_per_second":"23.6518717787","kilometers_per_hour":"85146.7384033625","miles_per_hour":"52906.8719818004"},"miss_distance":{"astronomical":"0.2652426956","lunar":"103.1794085884","kilometers":"39679742.294818372","miles":"24655848.5551106536"},"orbiting_body":"Earth"},{"close_approach_date":"2134-08-02","close_approach_date_full":"2134-Aug-02 15:25","epoch_date_close_approach":5193818700000,"relative_velocity":{"kilometers_per_second":"14.7556747588","kilometers_per_hour":"53120.4291315446","miles_per_hour":"33006.9688678756"},"miss_distance":{"astronomical":"0.096183386","lunar":"37.415337154","kilometers":"14388829.67498782","miles":"8940804.169439116"},"orbiting_body":"Earth"},{"close_approach_date":"2135-06-24","close_approach_date_full":"2135-Jun-24 22:43","epoch_date_close_approach":5222011380000,"relative_velocity":{"kilometers_per_second":"41.0702657381","kilometers_per_hour":"147852.9566571899","miles_per_hour":"91870.0774295745"},"miss_distance":{"astronomical":"0.0622638665","lunar":"24.2206440685","kilometers":"9314541.806364355","miles":"5787787.895183899"},"orbiting_body":"Merc"},{"close_approach_date":"2137-03-04","close_approach_date_full":"2137-Mar-04 00:34","epoch_date_close_approach":5275413240000,"relative_velocity":{"kilometers_per_second":"32.176612993","kilometers_per_hour":"115835.8067748187","miles_per_hour":"71975.8656040533"},"miss_distance":{"astronomical":"0.0387525246","lunar":"15.0747320694","kilometers":"5797295.137282602","miles":"3602272.1587278276"},"orbiting_body":"Merc"},{"close_approach_date":"2138-08-26","close_approach_date_full":"2138-Aug-26 20:50","epoch_date_close_approach":5322142200000,"relative_velocity":{"kilometers_per_second":"14.5651947918","kilometers_per_hour":"52434.7012503673","miles_per_hour":"32580.8842297074"},"miss_distance":{"astronomical":"0.1440201185","lunar":"56.0238260965","kilometers":"21545102.964747595","miles":"13387506.195383011"},"orbiting_body":"Earth"},{"close_approach_date":"2138-11-13","close_approach_date_full":"2138-Nov-13 12:07","epoch_date_close_approach":5328936420000,"relative_velocity":{"kilometers_per_second":"27.9531662189","kilometers_per_hour":"100631.3983880774","miles_per_hour":"62528.4375150807"},"miss_distance":{"astronomical":"0.0815436076","lunar":"31.7204633564","kilometers":"12198750.009075812","miles":"7579951.7686057256"},"orbiting_body":"Merc"},{"close_approach_date":"2139-07-31","close_approach_date_full":"2139-Jul-31 09:14","epoch_date_close_approach":5351390040000,"relative_velocity":{"kilometers_per_second":"24.3893369621","kilometers_per_hour":"87801.613063438","miles_per_hour":"54556.5078504457"},"miss_distance":{"astronomical":"0.2315440829","lunar":"90.0706482481","kilometers":"34638501.612943423","miles":"21523366.8505003174"},"orbiting_body":"Earth"},{"close_approach_date":"2142-09-05","close_approach_date_full":"2142-Sep-05 02:47","epoch_date_close_approach":5449171620000,"relative_velocity":{"kilometers_per_second":"20.0670994695","kilometers_per_hour":"72241.5580901068","miles_per_hour":"44888.0948032666"},"miss_distance":{"astronomical":"0.1829704186","lunar":"71.1754928354","kilometers":"27371984.895568382","miles":"17008162.7351203916"},"orbiting_body":"Earth"},{"close_approach_date":"2143-07-28","close_approach_date_full":"2143-Jul-28 12:48","epoch_date_close_approach":5477374080000,"relative_velocity":{"kilometers_per_second":"16.2526082035","kilometers_per_hour":"58509.3895326814","miles_per_hour":"36355.4592904597"},"miss_distance":{"astronomical":"0.0266534299","lunar":"10.3681842311","kilometers":"3987296.341234313","miles":"2477591.0590189994"},"orbiting_body":"Earth"},{"close_approach_date":"2146-08-26","close_approach_date_full":"2146-Aug-26 16:03","epoch_date_close_approach":5574585780000,"relative_velocity":{"kilometers_per_second":"29.9338309656","kilometers_per_hour":"107761.7914761348","miles_per_hour":"66958.986486935"},"miss_distance":{"astronomical":"0.4257064723","lunar":"165.5998177247","kilometers":"63684781.501294001","miles":"39571888.2520631738"},"orbiting_body":"Earth"},{"close_approach_date":"2147-08-18","close_approach_date_full":"2147-Aug-18 10:56","epoch_date_close_approach":5605412160000,"relative_velocity":{"kilometers_per_second":"14.2921641901","kilometers_per_hour":"51451.791084284","miles_per_hour":"31970.1420767875"},"miss_distance":{"astronomical":"0.1490344185","lunar":"57.9743887965","kilometers":"22295231.564288595","miles":"13853614.493408811"},"orbiting_body":"Earth"},{"close_approach_date":"2148-08-03","close_approach_date_full":"2148-Aug-03 05:46","epoch_date_close_approach":5635719960000,"relative_velocity":{"kilometers_per_second":"27.6958477314","kilometers_per_hour":"99705.0518331214","miles_per_hour":"61952.8417904192"},"miss_distance":{"astronomical":"0.3256919898","lunar":"126.6941840322","kilometers":"48722827.950141726","miles":"30274961.4196027788"},"orbiting_body":"Earth"},{"close_approach_date":"2149-09-03","close_approach_date_full":"2149-Sep-03 02:48","epoch_date_close_approach":5669923680000,"relative_velocity":{"kilometers_per_second":"31.0310464685","kilometers_per_hour":"111711.7672866104","miles_per_hour":"69413.3478453941"},"miss_distance":{"astronomical":"0.1259206437","lunar":"48.9831303993","kilometers":"18837460.086548919","miles":"11705054.9271723222"},"orbiting_body":"Venus"},{"close_approach_date":"2151-09-05","close_approach_date_full":"2151-Sep-05 14:27","epoch_date_close_approach":5733210420000,"relative_velocity":{"kilometers_per_second":"17.5086216314","kilometers_per_hour":"63031.0378731509","miles_per_hour":"39165.0357273476"},"miss_distance":{"astronomical":"0.1394007327","lunar":"54.2268850203","kilometers":"20854052.688359349","miles":"12958107.4651190562"},"orbiting_body":"Earth"},{"close_approach_date":"2152-06-14","close_approach_date_full":"2152-Jun-14 15:56","epoch_date_close_approach":5757666960000,"relative_velocity":{"kilometers_per_second":"26.5493394304","kilometers_per_hour":"95577.6219494375","miles_per_hour":"59388.2173718602"},"miss_distance":{"astronomical":"0.0797831276","lunar":"31.0356366364","kilometers":"11935385.950898212","miles":"7416304.9312588456"},"orbiting_body":"Merc"},{"close_approach_date":"2152-07-26","close_approach_date_full":"2152-Jul-26 17:38","epoch_date_close_approach":5761301880000,"relative_velocity":{"kilometers_per_second":"18.3379440299","kilometers_per_hour":"66016.5985075342","miles_per_hour":"41020.1470004175"},"miss_distance":{"astronomical":"0.051185285","lunar":"19.911075865","kilometers":"7657209.61134295","miles":"4757969.42251471"},"orbiting_body":"Earth"},{"close_approach_date":"2154-02-22","close_approach_date_full":"2154-Feb-22 07:11","epoch_date_close_approach":5811030660000,"relative_velocity":{"kilometers_per_second":"30.9798115613","kilometers_per_hour":"111527.3216206228","miles_per_hour":"69298.7404814364"},"miss_distance":{"astronomical":"0.0614628846","lunar":"23.9090621094","kilometers":"9194716.620215802","miles":"5713331.9770779876"},"orbiting_body":"Merc"},{"close_approach_date":"2155-08-30","close_approach_date_full":"2155-Aug-30 18:22","epoch_date_close_approach":5858936520000,"relative_velocity":{"kilometers_per_second":"26.6758045791","kilometers_per_hour":"96032.8964848734","miles_per_hour":"59671.1072630593"},"miss_distance":{"astronomical":"0.3416661635","lunar":"132.9081376015","kilometers":"51112530.310671745","miles":"31759853.611070281"},"orbiting_body":"Earth"},{"close_approach_date":"2155-11-01","close_approach_date_full":"2155-Nov-01 18:14","epoch_date_close_approach":5864379240000,"relative_velocity":{"kilometers_per_second":"35.376475729","kilometers_per_hour":"127355.3126243924","miles_per_hour":"79133.6385581954"},"miss_distance":{"astronomical":"0.0705717933","lunar":"27.4524275937","kilometers":"10557389.959760271","miles":"6560057.9270668998"},"orbiting_body":"Merc"},{"close_approach_date":"2156-06-09","close_approach_date_full":"2156-Jun-09 03:14","epoch_date_close_approach":5883419640000,"relative_velocity":{"kilometers_per_second":"29.9035889779","kilometers_per_hour":"107652.9203202712","miles_per_hour":"66891.3381845596"},"miss_distance":{"astronomical":"0.1058358292","lunar":"41.1701375588","kilometers":"15832814.618003804","miles":"9838054.8069643352"},"orbiting_body":"Venus"},{"close_approach_date":"2156-08-09","close_approach_date_full":"2156-Aug-09 07:55","epoch_date_close_approach":5888706900000,"relative_velocity":{"kilometers_per_second":"14.3452772811","kilometers_per_hour":"51642.9982120972","miles_per_hour":"32088.9507501778"},"miss_distance":{"astronomical":"0.1332394103","lunar":"51.8301306067","kilometers":"19932331.980936061","miles":"12385376.7754012018"},"orbiting_body":"Earth"},{"close_approach_date":"2157-07-11","close_approach_date_full":"2157-Jul-11 02:43","epoch_date_close_approach":5917718580000,"relative_velocity":{"kilometers_per_second":"39.7099059131","kilometers_per_hour":"142955.661287255","miles_per_hour":"88827.0885370724"},"miss_distance":{"astronomical":"0.0988459753","lunar":"38.4510843917","kilometers":"14787147.362952611","miles":"9188307.3038675918"},"orbiting_body":"Merc"},{"close_approach_date":"2157-08-07","close_approach_date_full":"2157-Aug-07 11:35","epoch_date_close_approach":5920083300000,"relative_velocity":{"kilometers_per_second":"31.0689153819","kilometers_per_hour":"111848.0953746683","miles_per_hour":"69498.0568176654"},"miss_distance":{"astronomical":"0.4178092163","lunar":"162.5277851407","kilometers":"62503368.824849281","miles":"38837792.4553948378"},"orbiting_body":"Earth"},{"close_approach_date":"2160-09-01","close_approach_date_full":"2160-Sep-01 18:24","epoch_date_close_approach":6016962240000,"relative_velocity":{"kilometers_per_second":"15.4542340067","kilometers_per_hour":"55635.2424240631","miles_per_hour":"34569.5760495519"},"miss_distance":{"astronomical":"0.1315750801","lunar":"51.1827061589","kilometers":"19683351.728039387","miles":"12230667.6202100606"},"orbiting_body":"Earth"},{"close_approach_date":"2161-07-28","close_approach_date_full":"2161-Jul-28 09:10","epoch_date_close_approach":6045441000000,"relative_velocity":{"kilometers_per_second":"21.3825590527","kilometers_per_hour":"76977.2125896026","miles_per_hour":"47830.6463449117"},"miss_distance":{"astronomical":"0.143775222","lunar":"55.928561358","kilometers":"21508466.96997714","miles":"13364741.643838932"},"orbiting_body":"Earth"},{"close_approach_date":"2161-12-21","close_approach_date_full":"2161-Dec-21 12:50","epoch_date_close_approach":6058068600000,"relative_velocity":{"kilometers_per_second":"41.1846502201","kilometers_per_hour":"148264.7407923859","miles_per_hour":"92125.9440773578"},"miss_distance":{"astronomical":"0.0628406889","lunar":"24.4450279821","kilometers":"9400833.208772643","miles":"5841406.8862947534"},"orbiting_body":"Merc"},{"close_approach_date":"2163-03-16","close_approach_date_full":"2163-Mar-16 08:34","epoch_date_close_approach":6096933240000,"relative_velocity":{"kilometers_per_second":"29.1074681202","kilometers_per_hour":"104786.8852328122","miles_per_hour":"65110.4954381326"},"miss_distance":{"astronomical":"0.0921591096","lunar":"35.8498936344","kilometers":"13786806.497256552","miles":"8566724.3131103376"},"orbiting_body":"Venus"},{"close_approach_date":"2163-08-31","close_approach_date_full":"2163-Aug-31 14:44","epoch_date_close_approach":6111470640000,"relative_velocity":{"kilometers_per_second":"32.229113662","kilometers_per_hour":"116024.8091832104","miles_per_hour":"72093.3043505343"},"miss_distance":{"astronomical":"0.0385096412","lunar":"14.9802504268","kilometers":"5760960.297984244","miles":"3579694.7365168072"},"orbiting_body":"Merc"},{"close_approach_date":"2164-09-02","close_approach_date_full":"2164-Sep-02 15:03","epoch_date_close_approach":6143266980000,"relative_velocity":{"kilometers_per_second":"23.1061011586","kilometers_per_hour":"83181.9641709269","miles_per_hour":"51686.0376816518"},"miss_distance":{"astronomical":"0.2522018513","lunar":"98.1065201557","kilometers":"37728859.764536731","miles":"23443626.3622836478"},"orbiting_body":"Earth"},{"close_approach_date":"2165-05-12","close_approach_date_full":"2165-May-12 04:16","epoch_date_close_approach":6165000960000,"relative_velocity":{"kilometers_per_second":"27.9447976538","kilometers_per_hour":"100601.2715538431","miles_per_hour":"62509.7178718866"},"miss_distance":{"astronomical":"0.0821261548","lunar":"31.9470742172","kilometers":"12285897.829370276","miles":"7634102.9131147688"},"orbiting_body":"Merc"},{"close_approach_date":"2165-08-01","close_approach_date_full":"2165-Aug-01 13:30","epoch_date_close_approach":6172032600000,"relative_velocity":{"kilometers_per_second":"14.8944013765","kilometers_per_hour":"53619.8449555595","miles_per_hour":"33317.2864391919"},"miss_distance":{"astronomical":"0.0879657562","lunar":"34.2186791618","kilometers":"13159489.760459294","miles":"8176927.7679704972"},"orbiting_body":"Earth"},{"close_approach_date":"2169-08-25","close_approach_date_full":"2169-Aug-25 15:25","epoch_date_close_approach":6300343500000,"relative_velocity":{"kilometers_per_second":"14.5055962742","kilometers_per_hour":"52220.1465870257","miles_per_hour":"32447.5683056994"},"miss_distance":{"astronomical":"0.1461586461","lunar":"56.8557133329","kilometers":"21865022.138643807","miles":"13586294.7520942566"},"orbiting_body":"Earth"},{"close_approach_date":"2169-12-20","close_approach_date_full":"2169-Dec-20 15:51","epoch_date_close_approach":6310453860000,"relative_velocity":{"kilometers_per_second":"28.4071057493","kilometers_per_hour":"102265.5806975779","miles_per_hour":"63543.85485067"},"miss_distance":{"astronomical":"0.0807353119","lunar":"31.4060363291","kilometers":"12077830.694025653","miles":"7504815.9903258914"},"orbiting_body":"Venus"},{"close_approach_date":"2170-07-31","close_approach_date_full":"2170-Jul-31 18:13","epoch_date_close_approach":6329729580000,"relative_velocity":{"kilometers_per_second":"24.8212530517","kilometers_per_hour":"89356.5109861981","miles_per_hour":"55522.6609513963"},"miss_distance":{"astronomical":"0.2442449058","lunar":"95.0112683562","kilometers":"36538517.666030646","miles":"22703982.0800330748"},"orbiting_body":"Earth"},{"close_approach_date":"2173-09-05","close_approach_date_full":"2173-Sep-05 05:11","epoch_date_close_approach":6427487460000,"relative_velocity":{"kilometers_per_second":"19.7012619859","kilometers_per_hour":"70924.5431491064","miles_per_hour":"44069.7529361767"},"miss_distance":{"astronomical":"0.1754174124","lunar":"68.2373734236","kilometers":"26242071.255951588","miles":"16306066.9560763944"},"orbiting_body":"Earth"},{"close_approach_date":"2174-07-28","close_approach_date_full":"2174-Jul-28 02:52","epoch_date_close_approach":6455645520000,"relative_velocity":{"kilometers_per_second":"16.5244161275","kilometers_per_hour":"59487.8980590022","miles_per_hour":"36963.4664356061"},"miss_distance":{"astronomical":"0.0185910373","lunar":"7.2319135097","kilometers":"2781179.581170551","miles":"1728144.8565975638"},"orbiting_body":"Earth"},{"close_approach_date":"2176-09-25","close_approach_date_full":"2176-Sep-25 20:14","epoch_date_close_approach":6523964040000,"relative_velocity":{"kilometers_per_second":"27.4776995667","kilometers_per_hour":"98919.7184402345","miles_per_hour":"61464.8661608224"},"miss_distance":{"astronomical":"0.0674155682","lunar":"26.2246560298","kilometers":"10085225.407559734","miles":"6266668.4789789692"},"orbiting_body":"Venus"},{"close_approach_date":"2177-08-27","close_approach_date_full":"2177-Aug-27 01:42","epoch_date_close_approach":6552927720000,"relative_velocity":{"kilometers_per_second":"29.5408399172","kilometers_per_hour":"106347.023702014","miles_per_hour":"66079.9048108431"},"miss_distance":{"astronomical":"0.4157519974","lunar":"161.7275269886","kilometers":"62195613.259285538","miles":"38646562.0144269044"},"orbiting_body":"Earth"},{"close_approach_date":"2178-08-17","close_approach_date_full":"2178-Aug-17 08:49","epoch_date_close_approach":6583625340000,"relative_velocity":{"kilometers_per_second":"14.2927975331","kilometers_per_hour":"51454.0711191168","miles_per_hour":"31971.5588017645"},"miss_distance":{"astronomical":"0.1486289533","lunar":"57.8166628337","kilometers":"22234574.834009471","miles":"13815924.1489378598"},"orbiting_body":"Earth"},{"close_approach_date":"2178-12-12","close_approach_date_full":"2178-Dec-12 14:34","epoch_date_close_approach":6593754840000,"relative_velocity":{"kilometers_per_second":"27.3074828012","kilometers_per_hour":"98306.9380842221","miles_per_hour":"61084.1082779434"},"miss_distance":{"astronomical":"0.0750648416","lunar":"29.2002233824","kilometers":"11229540.415247392","miles":"6977712.8531903296"},"orbiting_body":"Merc"},{"close_approach_date":"2179-08-04","close_approach_date_full":"2179-Aug-04 12:48","epoch_date_close_approach":6614052480000,"relative_velocity":{"kilometers_per_second":"28.0660895079","kilometers_per_hour":"101037.92222857","miles_per_hour":"62781.0356203023"},"miss_distance":{"astronomical":"0.3351824616","lunar":"130.3859775624","kilometers":"50142582.316716792","miles":"31157155.8750920496"},"orbiting_body":"Earth"},{"close_approach_date":"2180-08-21","close_approach_date_full":"2180-Aug-21 00:07","epoch_date_close_approach":6647098020000,"relative_velocity":{"kilometers_per_second":"31.2229101693","kilometers_per_hour":"112402.4766093475","miles_per_hour":"69842.5277576249"},"miss_distance":{"astronomical":"0.0610131178","lunar":"23.7341028242","kilometers":"9127432.464939086","miles":"5671523.5416719468"},"orbiting_body":"Merc"},{"close_approach_date":"2182-04-30","close_approach_date_full":"2182-Apr-30 07:05","epoch_date_close_approach":6700431900000,"relative_velocity":{"kilometers_per_second":"35.1688201352","kilometers_per_hour":"126607.7524867045","miles_per_hour":"78669.1337604193"},"miss_distance":{"astronomical":"0.0693084011","lunar":"26.9609680279","kilometers":"10368389.177665657","miles":"6442618.2868217866"},"orbiting_body":"Merc"},{"close_approach_date":"2182-09-05","close_approach_date_full":"2182-Sep-05 09:40","epoch_date_close_approach":6711500400000,"relative_velocity":{"kilometers_per_second":"17.252513868","kilometers_per_hour":"62109.0499247989","miles_per_hour":"38592.1482713285"},"miss_distance":{"astronomical":"0.1373929775","lunar":"53.4458682475","kilometers":"20553696.786957925","miles":"12771474.962252365"},"orbiting_body":"Earth"},{"close_approach_date":"2183-07-02","close_approach_date_full":"2183-Jul-02 18:08","epoch_date_close_approach":6737450880000,"relative_velocity":{"kilometers_per_second":"25.9236123708","kilometers_per_hour":"93325.004534974","miles_per_hour":"57988.5285123009"},"miss_distance":{"astronomical":"0.0537010983","lunar":"20.8897272387","kilometers":"8033569.922340621","miles":"4991828.8755617298"},"orbiting_body":"Venus"},{"close_approach_date":"2183-07-27","close_approach_date_full":"2183-Jul-27 16:07","epoch_date_close_approach":6739603620000,"relative_velocity":{"kilometers_per_second":"18.6028254487","kilometers_per_hour":"66970.1716154752","miles_per_hour":"41612.6602462934"},"miss_distance":{"astronomical":"0.0587770786","lunar":"22.8642835754","kilometers":"8792925.763382582","miles":"5463670.7155883516"},"orbiting_body":"Earth"},{"close_approach_date":"2184-01-07","close_approach_date_full":"2184-Jan-07 12:34","epoch_date_close_approach":6753760440000,"relative_velocity":{"kilometers_per_second":"39.1458203553","kilometers_per_hour":"140924.9532792136","miles_per_hour":"87565.2855528536"},"miss_distance":{"astronomical":"0.0944987293","lunar":"36.7600056977","kilometers":"14136808.620986591","miles":"8784205.5480573158"},"orbiting_body":"Merc"},{"close_approach_date":"2186-08-30","close_approach_date_full":"2186-Aug-30 23:06","epoch_date_close_approach":6837260760000,"relative_velocity":{"kilometers_per_second":"26.3954320809","kilometers_per_hour":"95023.5554913707","miles_per_hour":"59043.9420218464"},"miss_distance":{"astronomical":"0.3348532657","lunar":"130.2579203573","kilometers":"50093335.311264059","miles":"31126555.2048756542"},"orbiting_body":"Earth"},{"close_approach_date":"2187-08-09","close_approach_date_full":"2187-Aug-09 13:32","epoch_date_close_approach":6866947920000,"relative_velocity":{"kilometers_per_second":"14.3703701967","kilometers_per_hour":"51733.3327082658","miles_per_hour":"32145.0810930888"},"miss_distance":{"astronomical":"0.1311847704","lunar":"51.0308756856","kilometers":"19624962.228279048","miles":"12194386.0674569424"},"orbiting_body":"Earth"},{"close_approach_date":"2188-06-18","close_approach_date_full":"2188-Jun-18 18:11","epoch_date_close_approach":6894094260000,"relative_velocity":{"kilometers_per_second":"43.0635509614","kilometers_per_hour":"155028.7834611937","miles_per_hour":"96328.8571456512"},"miss_distance":{"astronomical":"0.0737608509","lunar":"28.6929710001","kilometers":"11034466.184027583","miles":"6856499.3466553254"},"orbiting_body":"Merc"},{"close_approach_date":"2188-08-07","close_approach_date_full":"2188-Aug-07 17:05","epoch_date_close_approach":6898410300000,"relative_velocity":{"kilometers_per_second":"31.2963565215","kilometers_per_hour":"112666.8834775159","miles_per_hour":"70006.8199030154"},"miss_distance":{"astronomical":"0.4243416088","lunar":"165.0688858232","kilometers":"63480600.828853256","miles":"39445016.2653406928"},"orbiting_body":"Earth"},{"close_approach_date":"2190-02-26","close_approach_date_full":"2190-Feb-26 12:44","epoch_date_close_approach":6947469840000,"relative_velocity":{"kilometers_per_second":"34.4804277259","kilometers_per_hour":"124129.5398132148","miles_per_hour":"77129.2687800501"},"miss_distance":{"astronomical":"0.0359537239","lunar":"13.9859985971","kilometers":"5378600.514008093","miles":"3342107.3838259634"},"orbiting_body":"Merc"},{"close_approach_date":"2190-04-08","close_approach_date_full":"2190-Apr-08 00:43","epoch_date_close_approach":6950968980000,"relative_velocity":{"kilometers_per_second":"24.9794038612","kilometers_per_hour":"89925.8539003193","miles_per_hour":"55876.4284971178"},"miss_distance":{"astronomical":"0.054381866","lunar":"21.154545874","kilometers":"8135411.32022542","miles":"5055110.185813996"},"orbiting_body":"Venus"},{"close_approach_date":"2191-09-02","close_approach_date_full":"2191-Sep-02 09:17","epoch_date_close_approach":6995236620000,"relative_velocity":{"kilometers_per_second":"15.3625774296","kilometers_per_hour":"55305.2787467144","miles_per_hour":"34364.5494523682"},"miss_distance":{"astronomical":"0.1327626972","lunar":"51.6446892108","kilometers":"19861016.716574964","miles":"12341063.5249599432"},"orbiting_body":"Earth"},{"close_approach_date":"2191-11-07","close_approach_date_full":"2191-Nov-07 02:57","epoch_date_close_approach":7000916220000,"relative_velocity":{"kilometers_per_second":"28.4195434931","kilometers_per_hour":"102310.3565751812","miles_per_hour":"63571.6768397286"},"miss_distance":{"astronomical":"0.0643044397","lunar":"25.0144270433","kilometers":"9619807.210663439","miles":"5977471.0216918982"},"orbiting_body":"Merc"},{"close_approach_date":"2192-07-28","close_approach_date_full":"2192-Jul-28 09:17","epoch_date_close_approach":7023748620000,"relative_velocity":{"kilometers_per_second":"21.4820087359","kilometers_per_hour":"77335.231449267","miles_per_hour":"48053.1053413515"},"miss_distance":{"astronomical":"0.1470280684","lunar":"57.1939186076","kilometers":"21995085.862854308","miles":"13667112.6027451304"},"orbiting_body":"Earth"},{"close_approach_date":"2195-09-03","close_approach_date_full":"2195-Sep-03 14:04","epoch_date_close_approach":7121570640000,"relative_velocity":{"kilometers_per_second":"23.0727546001","kilometers_per_hour":"83061.9165604532","miles_per_hour":"51611.4447650216"},"miss_distance":{"astronomical":"0.2514726456","lunar":"97.8228591384","kilometers":"37619772.145024872","miles":"23375842.4587003536"},"orbiting_body":"Earth"},{"close_approach_date":"2196-08-01","close_approach_date_full":"2196-Aug-01 09:17","epoch_date_close_approach":7150324620000,"relative_velocity":{"kilometers_per_second":"14.9085165482","kilometers_per_hour":"53670.6595736892","miles_per_hour":"33348.8606667737"},"miss_distance":{"astronomical":"0.0876420247","lunar":"34.0927476083","kilometers":"13111060.217607389","miles":"8146835.0454604082"},"orbiting_body":"Earth"},{"close_approach_date":"2197-01-12","close_approach_date_full":"2197-Jan-12 08:34","epoch_date_close_approach":7164491640000,"relative_velocity":{"kilometers_per_second":"24.027399648","kilometers_per_hour":"86498.6387327172","miles_per_hour":"53746.8902725598"},"miss_distance":{"astronomical":"0.0627000676","lunar":"24.3903262964","kilometers":"9379796.561816012","miles":"5828335.3200124856"},"orbiting_body":"Venus"},{"close_approach_date":"2200-08-27","close_approach_date_full":"2200-Aug-27 00:50","epoch_date_close_approach":7278684600000,"relative_velocity":{"kilometers_per_second":"14.5145708082","kilometers_per_hour":"52252.4549096647","miles_per_hour":"32467.6434409525"},"miss_distance":{"astronomical":"0.1459280246","lunar":"56.7660015694","kilometers":"21830521.653467602","miles":"13564857.1446808276"},"orbiting_body":"Earth"}],"orbital_data":{"orbit_id":"26","orbit_determination_date":"2023-03-01 06:01:11","first_observation_date":"2010-07-18","last_observation_date":"2019-08-04","data_arc_in_days":3304,"observations_used":106,"orbit_uncertainty":"0","minimum_orbit_intersection":".0156523","jupiter_tisserand_invariant":"8.150","epoch_osculation":"2460000.5","eccentricity":".6758397835550958","semi_major_axis":".6820488566033581","inclination":"12.59219906149941","ascending_node_longitude":"306.5280898357266","orbital_period":"205.7413829181466","perihelion_distance":".221093104982544","perihelion_argument":"195.6367907331395","aphelion_distance":"1.143004608224172","perihelion_time":"2460066.437374223272","mean_anomaly":"244.6247926221936","mean_motion":"1.749769515952095","equinox":"J2000","orbit_class":{"orbit_class_type":"ATE","orbit_class_description":"Near-Earth asteroid orbits similar to that of 2062 Aten","orbit_class_range":"a (semi-major axis) < 1.0 AU; q (perihelion) > 0.983 AU"}},"is_sentry_object":false}
              description: successful operation
            '400':
              description: Bad request
          tags:
            - asteroids
      /neo/rest/v1/feed:
        get:
          description: >
            Retrieve a list of Asteroids based on their closest approach date to Earth.
          parameters:
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
                    type: object
                    properties:
                      links:
                        type: object
                        properties:
                          next:
                            type: string
                            example: https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY
                          prev:
                            type: string
                            example: https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY
                          self:
                            type: string
                            example: https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY
                      element_count:
                        type: integer
                        example: 20
                      near_earth_objects:
                        type: object
                  example: {"links":{"next":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY","previous":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY","self":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY"},"element_count":25,"near_earth_objects":{"2015-09-08":[{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2465633?api_key=DEMO_KEY"},"id":"2465633","neo_reference_id":"2465633","name":"465633 (2009 JR5)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2465633","absolute_magnitude_h":20.48,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.2130860292,"estimated_diameter_max":0.4764748465},"meters":{"estimated_diameter_min":213.0860292484,"estimated_diameter_max":476.474846455},"miles":{"estimated_diameter_min":0.1324054791,"estimated_diameter_max":0.2960676518},"feet":{"estimated_diameter_min":699.1011681995,"estimated_diameter_max":1563.2377352435}},"is_potentially_hazardous_asteroid":true,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 20:28","epoch_date_close_approach":1441744080000,"relative_velocity":{"kilometers_per_second":"18.127936605","kilometers_per_hour":"65260.5717781091","miles_per_hour":"40550.3813917923"},"miss_distance":{"astronomical":"0.3027469593","lunar":"117.7685671677","kilometers":"45290300.260256691","miles":"28142087.6157806958"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3426410?api_key=DEMO_KEY"},"id":"3426410","neo_reference_id":"3426410","name":"(2008 QV11)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3426410","absolute_magnitude_h":21.34,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.1434019235,"estimated_diameter_max":0.320656449},"meters":{"estimated_diameter_min":143.4019234645,"estimated_diameter_max":320.6564489709},"miles":{"estimated_diameter_min":0.0891057966,"estimated_diameter_max":0.1992466184},"feet":{"estimated_diameter_min":470.4787665793,"estimated_diameter_max":1052.0225040417}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 14:31","epoch_date_close_approach":1441722660000,"relative_velocity":{"kilometers_per_second":"19.7498128142","kilometers_per_hour":"71099.3261312856","miles_per_hour":"44178.3562841869"},"miss_distance":{"astronomical":"0.2591250701","lunar":"100.7996522689","kilometers":"38764558.550560687","miles":"24087179.7459520006"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3553060?api_key=DEMO_KEY"},"id":"3553060","neo_reference_id":"3553060","name":"(2010 XT10)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3553060","absolute_magnitude_h":26.5,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0133215567,"estimated_diameter_max":0.0297879063},"meters":{"estimated_diameter_min":13.3215566698,"estimated_diameter_max":29.7879062798},"miles":{"estimated_diameter_min":0.008277629,"estimated_diameter_max":0.0185093411},"feet":{"estimated_diameter_min":43.7058959846,"estimated_diameter_max":97.7293544391}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 12:07","epoch_date_close_approach":1441714020000,"relative_velocity":{"kilometers_per_second":"19.1530348886","kilometers_per_hour":"68950.9255988812","miles_per_hour":"42843.4237422604"},"miss_distance":{"astronomical":"0.4917435147","lunar":"191.2882272183","kilometers":"73563782.385433689","miles":"45710414.7542113482"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3726710?api_key=DEMO_KEY"},"id":"3726710","neo_reference_id":"3726710","name":"(2015 RC)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726710","absolute_magnitude_h":24.3,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0366906138,"estimated_diameter_max":0.0820427065},"meters":{"estimated_diameter_min":36.6906137531,"estimated_diameter_max":82.0427064882},"miles":{"estimated_diameter_min":0.0227984834,"estimated_diameter_max":0.0509789586},"feet":{"estimated_diameter_min":120.3760332259,"estimated_diameter_max":269.1689931548}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 09:45","epoch_date_close_approach":1441705500000,"relative_velocity":{"kilometers_per_second":"19.486643553","kilometers_per_hour":"70151.9167909206","miles_per_hour":"43589.6729637806"},"miss_distance":{"astronomical":"0.0269252677","lunar":"10.4739291353","kilometers":"4027962.697099799","miles":"2502859.9608192662"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727181?api_key=DEMO_KEY"},"id":"3727181","neo_reference_id":"3727181","name":"(2015 RO36)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727181","absolute_magnitude_h":22.9,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0699125232,"estimated_diameter_max":0.1563291544},"meters":{"estimated_diameter_min":69.9125232246,"estimated_diameter_max":156.3291544087},"miles":{"estimated_diameter_min":0.0434416145,"estimated_diameter_max":0.097138403},"feet":{"estimated_diameter_min":229.3718026961,"estimated_diameter_max":512.8909429502}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 14:36","epoch_date_close_approach":1441722960000,"relative_velocity":{"kilometers_per_second":"15.8053596703","kilometers_per_hour":"56899.294813224","miles_per_hour":"35355.0090465835"},"miss_distance":{"astronomical":"0.0540392535","lunar":"21.0212696115","kilometers":"8084157.219990045","miles":"5023262.364730821"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727639?api_key=DEMO_KEY"},"id":"3727639","neo_reference_id":"3727639","name":"(2015 RN83)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727639","absolute_magnitude_h":21.7,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.1214940408,"estimated_diameter_max":0.2716689341},"meters":{"estimated_diameter_min":121.4940407996,"estimated_diameter_max":271.6689340891},"miles":{"estimated_diameter_min":0.0754928736,"estimated_diameter_max":0.1688071972},"feet":{"estimated_diameter_min":398.6025088171,"estimated_diameter_max":891.3023057169}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 15:42","epoch_date_close_approach":1441726920000,"relative_velocity":{"kilometers_per_second":"12.0811420305","kilometers_per_hour":"43492.1113096542","miles_per_hour":"27024.3066079349"},"miss_distance":{"astronomical":"0.1684193589","lunar":"65.5151306121","kilometers":"25195177.358205543","miles":"15655557.2525527734"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3730577?api_key=DEMO_KEY"},"id":"3730577","neo_reference_id":"3730577","name":"(2015 TX237)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3730577","absolute_magnitude_h":23.3,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.058150704,"estimated_diameter_max":0.130028927},"meters":{"estimated_diameter_min":58.1507039646,"estimated_diameter_max":130.0289270043},"miles":{"estimated_diameter_min":0.0361331611,"estimated_diameter_max":0.0807962044},"feet":{"estimated_diameter_min":190.7831555951,"estimated_diameter_max":426.6041048727}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 14:19","epoch_date_close_approach":1441721940000,"relative_velocity":{"kilometers_per_second":"6.573400491","kilometers_per_hour":"23664.2417675863","miles_per_hour":"14704.0395583094"},"miss_distance":{"astronomical":"0.0795238758","lunar":"30.9347876862","kilometers":"11896602.433824546","miles":"7392205.9712328948"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3731587?api_key=DEMO_KEY"},"id":"3731587","neo_reference_id":"3731587","name":"(2015 UG)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3731587","absolute_magnitude_h":22.81,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0728710415,"estimated_diameter_max":0.1629446024},"meters":{"estimated_diameter_min":72.8710414898,"estimated_diameter_max":162.9446023625},"miles":{"estimated_diameter_min":0.0452799519,"estimated_diameter_max":0.1012490505},"feet":{"estimated_diameter_min":239.0782277615,"estimated_diameter_max":534.595169215}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 18:50","epoch_date_close_approach":1441738200000,"relative_velocity":{"kilometers_per_second":"11.9557600601","kilometers_per_hour":"43040.7362163935","miles_per_hour":"26743.8396784585"},"miss_distance":{"astronomical":"0.1132399881","lunar":"44.0503553709","kilometers":"16940461.018585347","miles":"10526314.3652659086"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3747356?api_key=DEMO_KEY"},"id":"3747356","neo_reference_id":"3747356","name":"(2016 EK158)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3747356","absolute_magnitude_h":20.49,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.2121069879,"estimated_diameter_max":0.4742856434},"meters":{"estimated_diameter_min":212.1069878758,"estimated_diameter_max":474.2856433931},"miles":{"estimated_diameter_min":0.1317971312,"estimated_diameter_max":0.2947073445},"feet":{"estimated_diameter_min":695.8890901025,"estimated_diameter_max":1556.0553102697}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 10:26","epoch_date_close_approach":1441707960000,"relative_velocity":{"kilometers_per_second":"16.9572895141","kilometers_per_hour":"61046.242250638","miles_per_hour":"37931.7609140145"},"miss_distance":{"astronomical":"0.2804752346","lunar":"109.1048662594","kilometers":"41958497.683910302","miles":"26071801.4952820876"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3758838?api_key=DEMO_KEY"},"id":"3758838","neo_reference_id":"3758838","name":"(2016 RT)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3758838","absolute_magnitude_h":24.4,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0350392641,"estimated_diameter_max":0.0783501764},"meters":{"estimated_diameter_min":35.0392641108,"estimated_diameter_max":78.3501764334},"miles":{"estimated_diameter_min":0.0217723826,"estimated_diameter_max":0.0486845275},"feet":{"estimated_diameter_min":114.9582192654,"estimated_diameter_max":257.0543928497}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 01:02","epoch_date_close_approach":1441674120000,"relative_velocity":{"kilometers_per_second":"19.0983945697","kilometers_per_hour":"68754.220451069","miles_per_hour":"42721.1988130545"},"miss_distance":{"astronomical":"0.170705627","lunar":"66.404488903","kilometers":"25537198.19621449","miles":"15868079.146520362"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54191333?api_key=DEMO_KEY"},"id":"54191333","neo_reference_id":"54191333","name":"(2021 QP3)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54191333","absolute_magnitude_h":22.7,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0766575574,"estimated_diameter_max":0.1714115092},"meters":{"estimated_diameter_min":76.6575573531,"estimated_diameter_max":171.4115092306},"miles":{"estimated_diameter_min":0.0476327831,"estimated_diameter_max":0.1065101409},"feet":{"estimated_diameter_min":251.5011804664,"estimated_diameter_max":562.3737359442}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 00:22","epoch_date_close_approach":1441671720000,"relative_velocity":{"kilometers_per_second":"9.3106795473","kilometers_per_hour":"33518.4463701775","miles_per_hour":"20827.0590792917"},"miss_distance":{"astronomical":"0.3949696486","lunar":"153.6431933054","kilometers":"59086618.145208482","miles":"36714722.0311497716"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54218591?api_key=DEMO_KEY"},"id":"54218591","neo_reference_id":"54218591","name":"(2021 VC9)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54218591","absolute_magnitude_h":27.06,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0102933082,"estimated_diameter_max":0.0230165369},"meters":{"estimated_diameter_min":10.293308202,"estimated_diameter_max":23.0165368531},"miles":{"estimated_diameter_min":0.0063959632,"estimated_diameter_max":0.0143018085},"feet":{"estimated_diameter_min":33.7706972815,"estimated_diameter_max":75.513574769}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 16:40","epoch_date_close_approach":1441730400000,"relative_velocity":{"kilometers_per_second":"5.2026208953","kilometers_per_hour":"18729.435222936","miles_per_hour":"11637.7426806071"},"miss_distance":{"astronomical":"0.4431941124","lunar":"172.4025097236","kilometers":"66300895.211580588","miles":"41197465.9325965944"},"orbiting_body":"Earth"}],"is_sentry_object":false}],"2015-09-07":[{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2440012?api_key=DEMO_KEY"},"id":"2440012","neo_reference_id":"2440012","name":"440012 (2002 LE27)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2440012","absolute_magnitude_h":19.61,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.3180936332,"estimated_diameter_max":0.7112789871},"meters":{"estimated_diameter_min":318.0936332215,"estimated_diameter_max":711.2789870931},"miles":{"estimated_diameter_min":0.197654159,"estimated_diameter_max":0.4419681355},"feet":{"estimated_diameter_min":1043.6143156183,"estimated_diameter_max":2333.5925520145}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 07:32","epoch_date_close_approach":1441611120000,"relative_velocity":{"kilometers_per_second":"1.1630843052","kilometers_per_hour":"4187.1034988155","miles_per_hour":"2601.7032823612"},"miss_distance":{"astronomical":"0.4981690972","lunar":"193.7877788108","kilometers":"74525035.840942964","miles":"46307709.9545183432"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3713989?api_key=DEMO_KEY"},"id":"3713989","neo_reference_id":"3713989","name":"(2015 FC35)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3713989","absolute_magnitude_h":22.11,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.100590039,"estimated_diameter_max":0.2249261651},"meters":{"estimated_diameter_min":100.5900390178,"estimated_diameter_max":224.9261651032},"miles":{"estimated_diameter_min":0.0625037331,"estimated_diameter_max":0.1397625961},"feet":{"estimated_diameter_min":330.0198236112,"estimated_diameter_max":737.9467595171}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 20:01","epoch_date_close_approach":1441656060000,"relative_velocity":{"kilometers_per_second":"8.7635328327","kilometers_per_hour":"31548.7181977204","miles_per_hour":"19603.1465934669"},"miss_distance":{"astronomical":"0.3213750467","lunar":"125.0148931663","kilometers":"48077022.457470529","miles":"29873676.4942861402"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3726788?api_key=DEMO_KEY"},"id":"3726788","neo_reference_id":"3726788","name":"(2015 RG2)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726788","absolute_magnitude_h":26.7,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0121494041,"estimated_diameter_max":0.0271668934},"meters":{"estimated_diameter_min":12.14940408,"estimated_diameter_max":27.1668934089},"miles":{"estimated_diameter_min":0.0075492874,"estimated_diameter_max":0.0168807197},"feet":{"estimated_diameter_min":39.8602508817,"estimated_diameter_max":89.1302305717}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 17:58","epoch_date_close_approach":1441648680000,"relative_velocity":{"kilometers_per_second":"8.0871658927","kilometers_per_hour":"29113.7972136669","miles_per_hour":"18090.1813853476"},"miss_distance":{"astronomical":"0.0163786734","lunar":"6.3713039526","kilometers":"2450214.654065658","miles":"1522492.7871077604"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727036?api_key=DEMO_KEY"},"id":"3727036","neo_reference_id":"3727036","name":"(2015 RL35)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727036","absolute_magnitude_h":26.3,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0146067964,"estimated_diameter_max":0.0326617897},"meters":{"estimated_diameter_min":14.6067964271,"estimated_diameter_max":32.6617897446},"miles":{"estimated_diameter_min":0.0090762397,"estimated_diameter_max":0.020295089},"feet":{"estimated_diameter_min":47.92256199,"estimated_diameter_max":107.1581062656}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 03:58","epoch_date_close_approach":1441598280000,"relative_velocity":{"kilometers_per_second":"3.5169616174","kilometers_per_hour":"12661.0618226584","miles_per_hour":"7867.0914419735"},"miss_distance":{"astronomical":"0.0692469329","lunar":"26.9370568981","kilometers":"10359193.665872923","miles":"6436904.4607474174"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727179?api_key=DEMO_KEY"},"id":"3727179","neo_reference_id":"3727179","name":"(2015 RH36)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727179","absolute_magnitude_h":23.6,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0506471459,"estimated_diameter_max":0.1132504611},"meters":{"estimated_diameter_min":50.6471458835,"estimated_diameter_max":113.2504610618},"miles":{"estimated_diameter_min":0.0314706677,"estimated_diameter_max":0.0703705522},"feet":{"estimated_diameter_min":166.1651821003,"estimated_diameter_max":371.5566426699}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 11:50","epoch_date_close_approach":1441626600000,"relative_velocity":{"kilometers_per_second":"7.2717612888","kilometers_per_hour":"26178.3406398515","miles_per_hour":"16266.2028270233"},"miss_distance":{"astronomical":"0.1093379598","lunar":"42.5324663622","kilometers":"16356725.896225626","miles":"10163598.1796045988"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727662?api_key=DEMO_KEY"},"id":"3727662","neo_reference_id":"3727662","name":"(2015 RX83)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727662","absolute_magnitude_h":22.9,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0699125232,"estimated_diameter_max":0.1563291544},"meters":{"estimated_diameter_min":69.9125232246,"estimated_diameter_max":156.3291544087},"miles":{"estimated_diameter_min":0.0434416145,"estimated_diameter_max":0.097138403},"feet":{"estimated_diameter_min":229.3718026961,"estimated_diameter_max":512.8909429502}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 21:51","epoch_date_close_approach":1441662660000,"relative_velocity":{"kilometers_per_second":"2.694557063","kilometers_per_hour":"9700.4054267199","miles_per_hour":"6027.4546941749"},"miss_distance":{"astronomical":"0.2895816212","lunar":"112.6472506468","kilometers":"43320793.722666844","miles":"26918293.0014326872"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727663?api_key=DEMO_KEY"},"id":"3727663","neo_reference_id":"3727663","name":"(2015 RY83)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727663","absolute_magnitude_h":24.2,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0384197891,"estimated_diameter_max":0.0859092601},"meters":{"estimated_diameter_min":38.4197891064,"estimated_diameter_max":85.9092601232},"miles":{"estimated_diameter_min":0.0238729428,"estimated_diameter_max":0.0533815229},"feet":{"estimated_diameter_min":126.0491808919,"estimated_diameter_max":281.8545369825}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 16:55","epoch_date_close_approach":1441644900000,"relative_velocity":{"kilometers_per_second":"6.9802494143","kilometers_per_hour":"25128.8978914704","miles_per_hour":"15614.1199148417"},"miss_distance":{"astronomical":"0.0764899182","lunar":"29.7545781798","kilometers":"11442728.839194234","miles":"7110181.9971550692"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3759353?api_key=DEMO_KEY"},"id":"3759353","neo_reference_id":"3759353","name":"(2016 RU33)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759353","absolute_magnitude_h":27.5,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.008405334,"estimated_diameter_max":0.0187948982},"meters":{"estimated_diameter_min":8.4053340207,"estimated_diameter_max":18.7948982439},"miles":{"estimated_diameter_min":0.0052228308,"estimated_diameter_max":0.0116786047},"feet":{"estimated_diameter_min":27.5765560686,"estimated_diameter_max":61.6630539546}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 16:34","epoch_date_close_approach":1441643640000,"relative_velocity":{"kilometers_per_second":"13.2144918467","kilometers_per_hour":"47572.1706482885","miles_per_hour":"29559.4968119879"},"miss_distance":{"astronomical":"0.2270491427","lunar":"88.3221165103","kilometers":"33966068.133246049","miles":"21105536.0612875162"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3759690?api_key=DEMO_KEY"},"id":"3759690","neo_reference_id":"3759690","name":"(2016 RN41)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759690","absolute_magnitude_h":31.02,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.001661709,"estimated_diameter_max":0.0037156943},"meters":{"estimated_diameter_min":1.6617090174,"estimated_diameter_max":3.7156943217},"miles":{"estimated_diameter_min":0.0010325378,"estimated_diameter_max":0.0023088247},"feet":{"estimated_diameter_min":5.4518014126,"estimated_diameter_max":12.1905985585}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 19:16","epoch_date_close_approach":1441653360000,"relative_velocity":{"kilometers_per_second":"13.4815494029","kilometers_per_hour":"48533.5778505242","miles_per_hour":"30156.8778593994"},"miss_distance":{"astronomical":"0.1205320685","lunar":"46.8869746465","kilometers":"18031340.714294095","miles":"11204155.576264711"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3827337?api_key=DEMO_KEY"},"id":"3827337","neo_reference_id":"3827337","name":"(2018 RZ2)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3827337","absolute_magnitude_h":22.2,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.096506147,"estimated_diameter_max":0.2157943048},"meters":{"estimated_diameter_min":96.5061469579,"estimated_diameter_max":215.7943048444},"miles":{"estimated_diameter_min":0.059966121,"estimated_diameter_max":0.134088323},"feet":{"estimated_diameter_min":316.6212271853,"estimated_diameter_max":707.9865871058}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 05:30","epoch_date_close_approach":1441603800000,"relative_velocity":{"kilometers_per_second":"18.513293253","kilometers_per_hour":"66647.8557106394","miles_per_hour":"41412.3856775359"},"miss_distance":{"astronomical":"0.4191352221","lunar":"163.0436013969","kilometers":"62701736.468136927","miles":"38961052.3932945126"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3843641?api_key=DEMO_KEY"},"id":"3843641","neo_reference_id":"3843641","name":"(2019 QK4)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3843641","absolute_magnitude_h":20.8,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.1838886721,"estimated_diameter_max":0.411187571},"meters":{"estimated_diameter_min":183.8886720703,"estimated_diameter_max":411.1875710413},"miles":{"estimated_diameter_min":0.1142630881,"estimated_diameter_max":0.2555000322},"feet":{"estimated_diameter_min":603.309310875,"estimated_diameter_max":1349.040630575}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 10:04","epoch_date_close_approach":1441620240000,"relative_velocity":{"kilometers_per_second":"38.349717322","kilometers_per_hour":"138058.9823592299","miles_per_hour":"85784.4826776004"},"miss_distance":{"astronomical":"0.3387069263","lunar":"131.7569943307","kilometers":"50669834.728726981","miles":"31484775.3319990978"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3986741?api_key=DEMO_KEY"},"id":"3986741","neo_reference_id":"3986741","name":"(2020 BY)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3986741","absolute_magnitude_h":24.5,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0334622374,"estimated_diameter_max":0.0748238376},"meters":{"estimated_diameter_min":33.4622374455,"estimated_diameter_max":74.8238376074},"miles":{"estimated_diameter_min":0.0207924639,"estimated_diameter_max":0.0464933628},"feet":{"estimated_diameter_min":109.7842471007,"estimated_diameter_max":245.4850393757}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 05:39","epoch_date_close_approach":1441604340000,"relative_velocity":{"kilometers_per_second":"27.1899249786","kilometers_per_hour":"97883.7299230601","miles_per_hour":"60821.1431846925"},"miss_distance":{"astronomical":"0.4067666372","lunar":"158.2322218708","kilometers":"60851422.512182764","miles":"37811320.6148355832"},"orbiting_body":"Earth"}],"is_sentry_object":false},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54088823?api_key=DEMO_KEY"},"id":"54088823","neo_reference_id":"54088823","name":"(2020 WZ)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54088823","absolute_magnitude_h":26.9,"estimated_diameter":{"kilometers":{"estimated_diameter_min":0.0110803882,"estimated_diameter_max":0.0247765013},"meters":{"estimated_diameter_min":11.0803882126,"estimated_diameter_max":24.7765012606},"miles":{"estimated_diameter_min":0.0068850319,"estimated_diameter_max":0.0153953994},"feet":{"estimated_diameter_min":36.3529808636,"estimated_diameter_max":81.2877363957}},"is_potentially_hazardous_asteroid":false,"close_approach_data":[{"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 19:56","epoch_date_close_approach":1441655760000,"relative_velocity":{"kilometers_per_second":"20.0777354148","kilometers_per_hour":"72279.8474933128","miles_per_hour":"44911.8863493865"},"miss_distance":{"astronomical":"0.462203352","lunar":"179.797103928","kilometers":"69144636.96606024","miles":"42964485.121061712"},"orbiting_body":"Earth"}],"is_sentry_object":false}]}}
              description: successful operation
            '400':
              description: Bad request
          security:
            - api_key: []
          summary: Returns Astronomy Picture of the Day images
          tags:
            - asteroids
    
    components:
      schemas:
        ClosestApproachData:
          type: object
          properties:
            links:
              type: object
              properties:
                self:
                  type: string
                  example: https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY
            id:
              type: string
              example: 3542519
            neo_reference_id:
              type: string
              example: 3542519
            name:
              type: string
              example: (2010 PK9)
            nasa_jpl_url:
              type: string
              example: http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3542519
            absolute_magnitude_h:
              type: number
              example: 21.6
            estimated_diameter:
              type: object
              properties:
                kilometers:
                  type: object
                  properties:
                    estimated_diameter_min:
                      type: number
                      example: 0.1160289086
                    estimated_diameter_max:
                      type: number
                      example: 0.2595214392
                meters:
                  type: object
                  properties:
                    estimated_diameter_min:
                      type: number
                      example: 116.0289086489
                    estimated_diameter_max:
                      type: number
                      example: 259.5214391852
                miles:
                  type: object
                  properties:
                    estimated_diameter_min:
                      type: number
                      example: 0.0720791841
                    estimated_diameter_max:
                      type: number
                      example: 0.1612313869
                feet:
                  type: object
                  properties:
                    estimated_diameter_min:
                      type: number
                      example: 380.6596305779
                    estimated_diameter_max:
                      type: number
                      example: 851.0432680809
            is_potentially_hazardous_asteroid:
              type: boolean
              example: true
            close_approach_data:
              type: array
              items:
                $ref: '#/components/schemas/CloseApproachData'
            orbital_data:
              type: object
        CloseApproachData:
          type: object
          properties:
            close_approach_date:
              type: string
              example: 1900-12-18
            close_approach_date_full:
              type: string
              example: 1900-Dec-18 08:14
            epoch_date_close_approach:
              type: number
              example: -2175876600000
            relative_velocity:
              type: object
              properties:
                kilometers_per_second:
                  type: string
                  example: "14.8095021111"
                kilometers_per_hour:
                  type: string
                  example: "53294.2079999601"
                miles_per_hour:
                  type: string
                  example: "33118.8269999761"
            miss_distance:
              type: object
              properties:
                astronomical:
                  type: string
                  example: "0.459439927"
                lunar:
                  type: string
                  example: "178.7561950684"
                kilometers:
                  type: string
                  example: "68701088"
                miles:
                  type: string
                  example: "42686992"
            orbiting_body:
              type: string
              example: Merc
        APODImage:
          type: object
          properties:
            title:
              type: string
              example: The Eagle Nebula in Infrared from Hubble
              description: The title of the image.
            explanation:
              type: string
              example: This image shows the pillars as seen in visible light, capturing the multi-coloured glow of gas clouds, wispy tendrils of dark cosmic dust, and the rust-coloured elephants trunks of the nebula's famous pillars.
              description: The text explanation of the image. This is often much longer than the title.
            date:
              type: string
              format: date
              example: 2018-02-04
              description: The date the image was published.
            copyright:
              type: string
              example: Alan Smithee
              description: The copyright holder of the image
            url:
              type: string
              example: https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg
              description: The URL of the APOD image or video of the day.
            hdurl:
              type: string
              example: https://apod.nasa.gov/apod/image/1802/M16_HubbleSchmidt_960.jpg
              description: The URL of the high resolution image.
      parameters:
        Latitude:
          name: lat
          in: query
          description: Latitude
          schema:
            type: number
            minimum: -90
            maximum: 90
        Longitude:
          name: lon
          in: query
          description: Longitude
          schema:
            type: number
            minimum: -180
            maximum: 180
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
      - name: asteroids
        description: APIs related to asteroids

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: f12b872cdb818930c0e588744e7391ac