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

