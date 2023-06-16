#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 1c38ffb4582129f6838cbb6762af6a0f

# Because the NASA services can be unreliable, we use a local cache of
# the response. This test is primarily to validate that our OpenAPI spec is
# working
#
# If you wish to extend these tests, do so after the final
# CodeGen::Protection::Format::Perl marker and before done_testing().

use lib 'lib', 't/lib';
use Test::Most;
use WebService::NASA::Test qw( set_response );

my $nasa = WebService::NASA->new;

my $default_response = default();
my $limit_remaining;
if ( $default_response =~ /X-Ratelimit-Remaining: (\d+)/ ) {
    $limit_remaining = $1;
}

subtest 'Validate Response via OpenAPI' => sub {
    set_response( default() );
    my $response;
    lives_ok {
        $response = $nasa->get_neo_rest_v1_feed();
    }
    'get_neo_rest_v1_feed survived OpenAPI validation';

    my $expected = {
        element_count => 25,
        links         => {
            next     => 'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY',
            previous => 'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY',
            self     => 'http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY',
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
    };
    eq_or_diff $response, $expected, 'get_neo_rest_v1_feed response is decoded correctly' if $nasa->should_decode;
    is $nasa->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub default {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 28720
Content-Type: application/json
Date: Mon, 12 Jun 2023 15:43:49 GMT
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
Vary: Accept-Encoding
Via: http/1.1 api-umbrella (ApacheTrafficServer [cMsSf ])
X-Cache: MISS
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-Ratelimit-Limit: 2000
X-Ratelimit-Remaining: 1993
X-Vcap-Request-Id: 4bf471c4-27be-43d0-5dc9-1cc7fb1b9187
X-XSS-Protection: 1; mode=block

{"links":{"self":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&detailed=false&api_key=DEMO_KEY","next":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-08&end_date=2015-09-09&detailed=false&api_key=DEMO_KEY","previous":"http://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-06&end_date=2015-09-07&detailed=false&api_key=DEMO_KEY"},"near_earth_objects":{"2015-09-08":[{"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2465633","neo_reference_id":"2465633","is_potentially_hazardous_asteroid":true,"id":"2465633","estimated_diameter":{"kilometers":{"estimated_diameter_max":0.4764748465,"estimated_diameter_min":0.2130860292},"meters":{"estimated_diameter_min":213.0860292484,"estimated_diameter_max":476.474846455},"feet":{"estimated_diameter_min":699.1011681995,"estimated_diameter_max":1563.2377352435},"miles":{"estimated_diameter_min":0.1324054791,"estimated_diameter_max":0.2960676518}},"close_approach_data":[{"close_approach_date":"2015-09-08","relative_velocity":{"miles_per_hour":"40550.3813917923","kilometers_per_hour":"65260.5717781091","kilometers_per_second":"18.127936605"},"orbiting_body":"Earth","epoch_date_close_approach":1441744080000,"close_approach_date_full":"2015-Sep-08 20:28","miss_distance":{"kilometers":"45290300.260256691","astronomical":"0.3027469593","miles":"28142087.6157806958","lunar":"117.7685671677"}}],"is_sentry_object":false,"absolute_magnitude_h":20.48,"name":"465633 (2009 JR5)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2465633?api_key=DEMO_KEY"}},{"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3426410","estimated_diameter":{"feet":{"estimated_diameter_min":470.4787665793,"estimated_diameter_max":1052.0225040417},"meters":{"estimated_diameter_min":143.4019234645,"estimated_diameter_max":320.6564489709},"kilometers":{"estimated_diameter_max":0.320656449,"estimated_diameter_min":0.1434019235},"miles":{"estimated_diameter_max":0.1992466184,"estimated_diameter_min":0.0891057966}},"is_potentially_hazardous_asteroid":false,"id":"3426410","neo_reference_id":"3426410","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3426410?api_key=DEMO_KEY"},"name":"(2008 QV11)","absolute_magnitude_h":21.34,"is_sentry_object":false,"close_approach_data":[{"relative_velocity":{"miles_per_hour":"44178.3562841869","kilometers_per_second":"19.7498128142","kilometers_per_hour":"71099.3261312856"},"orbiting_body":"Earth","close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 14:31","miss_distance":{"lunar":"100.7996522689","miles":"24087179.7459520006","kilometers":"38764558.550560687","astronomical":"0.2591250701"},"epoch_date_close_approach":1441722660000}]},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3553060?api_key=DEMO_KEY"},"absolute_magnitude_h":26.5,"name":"(2010 XT10)","is_sentry_object":false,"close_approach_data":[{"epoch_date_close_approach":1441714020000,"miss_distance":{"miles":"45710414.7542113482","lunar":"191.2882272183","astronomical":"0.4917435147","kilometers":"73563782.385433689"},"close_approach_date_full":"2015-Sep-08 12:07","close_approach_date":"2015-09-08","relative_velocity":{"miles_per_hour":"42843.4237422604","kilometers_per_hour":"68950.9255988812","kilometers_per_second":"19.1530348886"},"orbiting_body":"Earth"}],"estimated_diameter":{"feet":{"estimated_diameter_min":43.7058959846,"estimated_diameter_max":97.7293544391},"kilometers":{"estimated_diameter_min":0.0133215567,"estimated_diameter_max":0.0297879063},"meters":{"estimated_diameter_min":13.3215566698,"estimated_diameter_max":29.7879062798},"miles":{"estimated_diameter_min":0.008277629,"estimated_diameter_max":0.0185093411}},"is_potentially_hazardous_asteroid":false,"neo_reference_id":"3553060","id":"3553060","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3553060"},{"is_sentry_object":false,"close_approach_data":[{"miss_distance":{"kilometers":"4027962.697099799","astronomical":"0.0269252677","miles":"2502859.9608192662","lunar":"10.4739291353"},"close_approach_date_full":"2015-Sep-08 09:45","epoch_date_close_approach":1441705500000,"orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"43589.6729637806","kilometers_per_second":"19.486643553","kilometers_per_hour":"70151.9167909206"},"close_approach_date":"2015-09-08"}],"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3726710?api_key=DEMO_KEY"},"name":"(2015 RC)","absolute_magnitude_h":24.3,"id":"3726710","is_potentially_hazardous_asteroid":false,"neo_reference_id":"3726710","estimated_diameter":{"miles":{"estimated_diameter_min":0.0227984834,"estimated_diameter_max":0.0509789586},"feet":{"estimated_diameter_max":269.1689931548,"estimated_diameter_min":120.3760332259},"kilometers":{"estimated_diameter_min":0.0366906138,"estimated_diameter_max":0.0820427065},"meters":{"estimated_diameter_min":36.6906137531,"estimated_diameter_max":82.0427064882}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726710"},{"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727181","estimated_diameter":{"miles":{"estimated_diameter_max":0.097138403,"estimated_diameter_min":0.0434416145},"meters":{"estimated_diameter_max":156.3291544087,"estimated_diameter_min":69.9125232246},"kilometers":{"estimated_diameter_min":0.0699125232,"estimated_diameter_max":0.1563291544},"feet":{"estimated_diameter_max":512.8909429502,"estimated_diameter_min":229.3718026961}},"neo_reference_id":"3727181","is_potentially_hazardous_asteroid":false,"id":"3727181","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727181?api_key=DEMO_KEY"},"name":"(2015 RO36)","absolute_magnitude_h":22.9,"is_sentry_object":false,"close_approach_data":[{"close_approach_date_full":"2015-Sep-08 14:36","miss_distance":{"lunar":"21.0212696115","miles":"5023262.364730821","kilometers":"8084157.219990045","astronomical":"0.0540392535"},"epoch_date_close_approach":1441722960000,"orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"35355.0090465835","kilometers_per_hour":"56899.294813224","kilometers_per_second":"15.8053596703"},"close_approach_date":"2015-09-08"}]},{"close_approach_data":[{"close_approach_date":"2015-09-08","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"43492.1113096542","kilometers_per_second":"12.0811420305","miles_per_hour":"27024.3066079349"},"epoch_date_close_approach":1441726920000,"miss_distance":{"miles":"15655557.2525527734","lunar":"65.5151306121","kilometers":"25195177.358205543","astronomical":"0.1684193589"},"close_approach_date_full":"2015-Sep-08 15:42"}],"is_sentry_object":false,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727639?api_key=DEMO_KEY"},"name":"(2015 RN83)","absolute_magnitude_h":21.7,"is_potentially_hazardous_asteroid":false,"id":"3727639","neo_reference_id":"3727639","estimated_diameter":{"miles":{"estimated_diameter_min":0.0754928736,"estimated_diameter_max":0.1688071972},"meters":{"estimated_diameter_min":121.4940407996,"estimated_diameter_max":271.6689340891},"kilometers":{"estimated_diameter_max":0.2716689341,"estimated_diameter_min":0.1214940408},"feet":{"estimated_diameter_max":891.3023057169,"estimated_diameter_min":398.6025088171}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727639"},{"is_sentry_object":false,"close_approach_data":[{"close_approach_date":"2015-09-08","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"23664.2417675863","kilometers_per_second":"6.573400491","miles_per_hour":"14704.0395583094"},"epoch_date_close_approach":1441721940000,"miss_distance":{"miles":"7392205.9712328948","lunar":"30.9347876862","astronomical":"0.0795238758","kilometers":"11896602.433824546"},"close_approach_date_full":"2015-Sep-08 14:19"}],"absolute_magnitude_h":23.3,"name":"(2015 TX237)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3730577?api_key=DEMO_KEY"},"neo_reference_id":"3730577","is_potentially_hazardous_asteroid":false,"id":"3730577","estimated_diameter":{"miles":{"estimated_diameter_max":0.0807962044,"estimated_diameter_min":0.0361331611},"meters":{"estimated_diameter_max":130.0289270043,"estimated_diameter_min":58.1507039646},"kilometers":{"estimated_diameter_max":0.130028927,"estimated_diameter_min":0.058150704},"feet":{"estimated_diameter_max":426.6041048727,"estimated_diameter_min":190.7831555951}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3730577"},{"close_approach_data":[{"relative_velocity":{"miles_per_hour":"26743.8396784585","kilometers_per_second":"11.9557600601","kilometers_per_hour":"43040.7362163935"},"orbiting_body":"Earth","close_approach_date":"2015-09-08","close_approach_date_full":"2015-Sep-08 18:50","miss_distance":{"lunar":"44.0503553709","miles":"10526314.3652659086","kilometers":"16940461.018585347","astronomical":"0.1132399881"},"epoch_date_close_approach":1441738200000}],"is_sentry_object":false,"name":"(2015 UG)","absolute_magnitude_h":22.81,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3731587?api_key=DEMO_KEY"},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3731587","neo_reference_id":"3731587","is_potentially_hazardous_asteroid":false,"id":"3731587","estimated_diameter":{"feet":{"estimated_diameter_max":534.595169215,"estimated_diameter_min":239.0782277615},"meters":{"estimated_diameter_min":72.8710414898,"estimated_diameter_max":162.9446023625},"kilometers":{"estimated_diameter_max":0.1629446024,"estimated_diameter_min":0.0728710415},"miles":{"estimated_diameter_min":0.0452799519,"estimated_diameter_max":0.1012490505}}},{"estimated_diameter":{"feet":{"estimated_diameter_max":1556.0553102697,"estimated_diameter_min":695.8890901025},"kilometers":{"estimated_diameter_max":0.4742856434,"estimated_diameter_min":0.2121069879},"meters":{"estimated_diameter_min":212.1069878758,"estimated_diameter_max":474.2856433931},"miles":{"estimated_diameter_max":0.2947073445,"estimated_diameter_min":0.1317971312}},"is_potentially_hazardous_asteroid":false,"id":"3747356","neo_reference_id":"3747356","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3747356","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3747356?api_key=DEMO_KEY"},"name":"(2016 EK158)","absolute_magnitude_h":20.49,"is_sentry_object":false,"close_approach_data":[{"close_approach_date":"2015-09-08","relative_velocity":{"kilometers_per_hour":"61046.242250638","kilometers_per_second":"16.9572895141","miles_per_hour":"37931.7609140145"},"orbiting_body":"Earth","epoch_date_close_approach":1441707960000,"miss_distance":{"lunar":"109.1048662594","miles":"26071801.4952820876","astronomical":"0.2804752346","kilometers":"41958497.683910302"},"close_approach_date_full":"2015-Sep-08 10:26"}]},{"is_sentry_object":false,"close_approach_data":[{"close_approach_date_full":"2015-Sep-08 01:02","miss_distance":{"kilometers":"25537198.19621449","astronomical":"0.170705627","miles":"15868079.146520362","lunar":"66.404488903"},"epoch_date_close_approach":1441674120000,"orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"68754.220451069","kilometers_per_second":"19.0983945697","miles_per_hour":"42721.1988130545"},"close_approach_date":"2015-09-08"}],"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3758838?api_key=DEMO_KEY"},"absolute_magnitude_h":24.4,"name":"(2016 RT)","neo_reference_id":"3758838","is_potentially_hazardous_asteroid":false,"id":"3758838","estimated_diameter":{"feet":{"estimated_diameter_max":257.0543928497,"estimated_diameter_min":114.9582192654},"meters":{"estimated_diameter_min":35.0392641108,"estimated_diameter_max":78.3501764334},"kilometers":{"estimated_diameter_max":0.0783501764,"estimated_diameter_min":0.0350392641},"miles":{"estimated_diameter_max":0.0486845275,"estimated_diameter_min":0.0217723826}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3758838"},{"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54191333","estimated_diameter":{"feet":{"estimated_diameter_max":562.3737359442,"estimated_diameter_min":251.5011804664},"kilometers":{"estimated_diameter_max":0.1714115092,"estimated_diameter_min":0.0766575574},"meters":{"estimated_diameter_max":171.4115092306,"estimated_diameter_min":76.6575573531},"miles":{"estimated_diameter_min":0.0476327831,"estimated_diameter_max":0.1065101409}},"id":"54191333","is_potentially_hazardous_asteroid":false,"neo_reference_id":"54191333","name":"(2021 QP3)","absolute_magnitude_h":22.7,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54191333?api_key=DEMO_KEY"},"is_sentry_object":false,"close_approach_data":[{"orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"20827.0590792917","kilometers_per_second":"9.3106795473","kilometers_per_hour":"33518.4463701775"},"close_approach_date":"2015-09-08","miss_distance":{"kilometers":"59086618.145208482","astronomical":"0.3949696486","lunar":"153.6431933054","miles":"36714722.0311497716"},"close_approach_date_full":"2015-Sep-08 00:22","epoch_date_close_approach":1441671720000}]},{"close_approach_data":[{"close_approach_date":"2015-09-08","orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"11637.7426806071","kilometers_per_second":"5.2026208953","kilometers_per_hour":"18729.435222936"},"epoch_date_close_approach":1441730400000,"miss_distance":{"astronomical":"0.4431941124","kilometers":"66300895.211580588","miles":"41197465.9325965944","lunar":"172.4025097236"},"close_approach_date_full":"2015-Sep-08 16:40"}],"is_sentry_object":false,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54218591?api_key=DEMO_KEY"},"name":"(2021 VC9)","absolute_magnitude_h":27.06,"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54218591","is_potentially_hazardous_asteroid":false,"neo_reference_id":"54218591","id":"54218591","estimated_diameter":{"miles":{"estimated_diameter_max":0.0143018085,"estimated_diameter_min":0.0063959632},"meters":{"estimated_diameter_max":23.0165368531,"estimated_diameter_min":10.293308202},"kilometers":{"estimated_diameter_max":0.0230165369,"estimated_diameter_min":0.0102933082},"feet":{"estimated_diameter_min":33.7706972815,"estimated_diameter_max":75.513574769}}}],"2015-09-07":[{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2440012?api_key=DEMO_KEY"},"absolute_magnitude_h":19.61,"name":"440012 (2002 LE27)","is_sentry_object":false,"close_approach_data":[{"close_approach_date_full":"2015-Sep-07 07:32","miss_distance":{"miles":"46307709.9545183432","lunar":"193.7877788108","astronomical":"0.4981690972","kilometers":"74525035.840942964"},"epoch_date_close_approach":1441611120000,"orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"2601.7032823612","kilometers_per_hour":"4187.1034988155","kilometers_per_second":"1.1630843052"},"close_approach_date":"2015-09-07"}],"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2440012","estimated_diameter":{"feet":{"estimated_diameter_min":1043.6143156183,"estimated_diameter_max":2333.5925520145},"meters":{"estimated_diameter_min":318.0936332215,"estimated_diameter_max":711.2789870931},"kilometers":{"estimated_diameter_max":0.7112789871,"estimated_diameter_min":0.3180936332},"miles":{"estimated_diameter_max":0.4419681355,"estimated_diameter_min":0.197654159}},"neo_reference_id":"2440012","is_potentially_hazardous_asteroid":false,"id":"2440012"},{"is_sentry_object":false,"close_approach_data":[{"relative_velocity":{"kilometers_per_hour":"31548.7181977204","kilometers_per_second":"8.7635328327","miles_per_hour":"19603.1465934669"},"orbiting_body":"Earth","close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 20:01","miss_distance":{"kilometers":"48077022.457470529","astronomical":"0.3213750467","lunar":"125.0148931663","miles":"29873676.4942861402"},"epoch_date_close_approach":1441656060000}],"absolute_magnitude_h":22.11,"name":"(2015 FC35)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3713989?api_key=DEMO_KEY"},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3713989","id":"3713989","is_potentially_hazardous_asteroid":false,"neo_reference_id":"3713989","estimated_diameter":{"miles":{"estimated_diameter_max":0.1397625961,"estimated_diameter_min":0.0625037331},"kilometers":{"estimated_diameter_max":0.2249261651,"estimated_diameter_min":0.100590039},"meters":{"estimated_diameter_max":224.9261651032,"estimated_diameter_min":100.5900390178},"feet":{"estimated_diameter_max":737.9467595171,"estimated_diameter_min":330.0198236112}}},{"is_potentially_hazardous_asteroid":false,"id":"3726788","neo_reference_id":"3726788","estimated_diameter":{"miles":{"estimated_diameter_max":0.0168807197,"estimated_diameter_min":0.0075492874},"meters":{"estimated_diameter_min":12.14940408,"estimated_diameter_max":27.1668934089},"kilometers":{"estimated_diameter_max":0.0271668934,"estimated_diameter_min":0.0121494041},"feet":{"estimated_diameter_min":39.8602508817,"estimated_diameter_max":89.1302305717}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3726788","is_sentry_object":false,"close_approach_data":[{"relative_velocity":{"miles_per_hour":"18090.1813853476","kilometers_per_second":"8.0871658927","kilometers_per_hour":"29113.7972136669"},"orbiting_body":"Earth","close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 17:58","miss_distance":{"astronomical":"0.0163786734","kilometers":"2450214.654065658","lunar":"6.3713039526","miles":"1522492.7871077604"},"epoch_date_close_approach":1441648680000}],"absolute_magnitude_h":26.7,"name":"(2015 RG2)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3726788?api_key=DEMO_KEY"}},{"close_approach_data":[{"close_approach_date_full":"2015-Sep-07 03:58","miss_distance":{"astronomical":"0.0692469329","kilometers":"10359193.665872923","lunar":"26.9370568981","miles":"6436904.4607474174"},"epoch_date_close_approach":1441598280000,"relative_velocity":{"kilometers_per_hour":"12661.0618226584","kilometers_per_second":"3.5169616174","miles_per_hour":"7867.0914419735"},"orbiting_body":"Earth","close_approach_date":"2015-09-07"}],"is_sentry_object":false,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727036?api_key=DEMO_KEY"},"absolute_magnitude_h":26.3,"name":"(2015 RL35)","is_potentially_hazardous_asteroid":false,"neo_reference_id":"3727036","id":"3727036","estimated_diameter":{"miles":{"estimated_diameter_max":0.020295089,"estimated_diameter_min":0.0090762397},"kilometers":{"estimated_diameter_max":0.0326617897,"estimated_diameter_min":0.0146067964},"meters":{"estimated_diameter_max":32.6617897446,"estimated_diameter_min":14.6067964271},"feet":{"estimated_diameter_max":107.1581062656,"estimated_diameter_min":47.92256199}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727036"},{"close_approach_data":[{"orbiting_body":"Earth","relative_velocity":{"miles_per_hour":"16266.2028270233","kilometers_per_second":"7.2717612888","kilometers_per_hour":"26178.3406398515"},"close_approach_date":"2015-09-07","close_approach_date_full":"2015-Sep-07 11:50","miss_distance":{"lunar":"42.5324663622","miles":"10163598.1796045988","astronomical":"0.1093379598","kilometers":"16356725.896225626"},"epoch_date_close_approach":1441626600000}],"is_sentry_object":false,"name":"(2015 RH36)","absolute_magnitude_h":23.6,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727179?api_key=DEMO_KEY"},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727179","is_potentially_hazardous_asteroid":false,"id":"3727179","neo_reference_id":"3727179","estimated_diameter":{"miles":{"estimated_diameter_min":0.0314706677,"estimated_diameter_max":0.0703705522},"feet":{"estimated_diameter_max":371.5566426699,"estimated_diameter_min":166.1651821003},"meters":{"estimated_diameter_max":113.2504610618,"estimated_diameter_min":50.6471458835},"kilometers":{"estimated_diameter_max":0.1132504611,"estimated_diameter_min":0.0506471459}}},{"close_approach_data":[{"close_approach_date_full":"2015-Sep-07 21:51","miss_distance":{"kilometers":"43320793.722666844","astronomical":"0.2895816212","miles":"26918293.0014326872","lunar":"112.6472506468"},"epoch_date_close_approach":1441662660000,"relative_velocity":{"kilometers_per_second":"2.694557063","kilometers_per_hour":"9700.4054267199","miles_per_hour":"6027.4546941749"},"orbiting_body":"Earth","close_approach_date":"2015-09-07"}],"is_sentry_object":false,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727662?api_key=DEMO_KEY"},"absolute_magnitude_h":22.9,"name":"(2015 RX83)","nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727662","is_potentially_hazardous_asteroid":false,"id":"3727662","neo_reference_id":"3727662","estimated_diameter":{"miles":{"estimated_diameter_min":0.0434416145,"estimated_diameter_max":0.097138403},"kilometers":{"estimated_diameter_max":0.1563291544,"estimated_diameter_min":0.0699125232},"meters":{"estimated_diameter_min":69.9125232246,"estimated_diameter_max":156.3291544087},"feet":{"estimated_diameter_max":512.8909429502,"estimated_diameter_min":229.3718026961}}},{"is_potentially_hazardous_asteroid":false,"neo_reference_id":"3727663","id":"3727663","estimated_diameter":{"miles":{"estimated_diameter_min":0.0238729428,"estimated_diameter_max":0.0533815229},"kilometers":{"estimated_diameter_max":0.0859092601,"estimated_diameter_min":0.0384197891},"meters":{"estimated_diameter_min":38.4197891064,"estimated_diameter_max":85.9092601232},"feet":{"estimated_diameter_min":126.0491808919,"estimated_diameter_max":281.8545369825}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3727663","close_approach_data":[{"relative_velocity":{"kilometers_per_hour":"25128.8978914704","kilometers_per_second":"6.9802494143","miles_per_hour":"15614.1199148417"},"orbiting_body":"Earth","close_approach_date":"2015-09-07","miss_distance":{"kilometers":"11442728.839194234","astronomical":"0.0764899182","miles":"7110181.9971550692","lunar":"29.7545781798"},"close_approach_date_full":"2015-Sep-07 16:55","epoch_date_close_approach":1441644900000}],"is_sentry_object":false,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3727663?api_key=DEMO_KEY"},"name":"(2015 RY83)","absolute_magnitude_h":24.2},{"absolute_magnitude_h":27.5,"name":"(2016 RU33)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3759353?api_key=DEMO_KEY"},"close_approach_data":[{"epoch_date_close_approach":1441643640000,"close_approach_date_full":"2015-Sep-07 16:34","miss_distance":{"miles":"21105536.0612875162","lunar":"88.3221165103","kilometers":"33966068.133246049","astronomical":"0.2270491427"},"close_approach_date":"2015-09-07","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"47572.1706482885","kilometers_per_second":"13.2144918467","miles_per_hour":"29559.4968119879"}}],"is_sentry_object":false,"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759353","estimated_diameter":{"meters":{"estimated_diameter_min":8.4053340207,"estimated_diameter_max":18.7948982439},"kilometers":{"estimated_diameter_min":0.008405334,"estimated_diameter_max":0.0187948982},"feet":{"estimated_diameter_max":61.6630539546,"estimated_diameter_min":27.5765560686},"miles":{"estimated_diameter_min":0.0052228308,"estimated_diameter_max":0.0116786047}},"is_potentially_hazardous_asteroid":false,"neo_reference_id":"3759353","id":"3759353"},{"neo_reference_id":"3759690","is_potentially_hazardous_asteroid":false,"id":"3759690","estimated_diameter":{"kilometers":{"estimated_diameter_max":0.0037156943,"estimated_diameter_min":0.001661709},"meters":{"estimated_diameter_max":3.7156943217,"estimated_diameter_min":1.6617090174},"feet":{"estimated_diameter_min":5.4518014126,"estimated_diameter_max":12.1905985585},"miles":{"estimated_diameter_max":0.0023088247,"estimated_diameter_min":0.0010325378}},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3759690","is_sentry_object":false,"close_approach_data":[{"close_approach_date_full":"2015-Sep-07 19:16","miss_distance":{"miles":"11204155.576264711","lunar":"46.8869746465","astronomical":"0.1205320685","kilometers":"18031340.714294095"},"epoch_date_close_approach":1441653360000,"orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"48533.5778505242","kilometers_per_second":"13.4815494029","miles_per_hour":"30156.8778593994"},"close_approach_date":"2015-09-07"}],"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3759690?api_key=DEMO_KEY"},"absolute_magnitude_h":31.02,"name":"(2016 RN41)"},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3827337?api_key=DEMO_KEY"},"absolute_magnitude_h":22.2,"name":"(2018 RZ2)","is_sentry_object":false,"close_approach_data":[{"close_approach_date":"2015-09-07","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"66647.8557106394","kilometers_per_second":"18.513293253","miles_per_hour":"41412.3856775359"},"epoch_date_close_approach":1441603800000,"close_approach_date_full":"2015-Sep-07 05:30","miss_distance":{"astronomical":"0.4191352221","kilometers":"62701736.468136927","miles":"38961052.3932945126","lunar":"163.0436013969"}}],"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3827337","estimated_diameter":{"miles":{"estimated_diameter_max":0.134088323,"estimated_diameter_min":0.059966121},"feet":{"estimated_diameter_min":316.6212271853,"estimated_diameter_max":707.9865871058},"meters":{"estimated_diameter_min":96.5061469579,"estimated_diameter_max":215.7943048444},"kilometers":{"estimated_diameter_max":0.2157943048,"estimated_diameter_min":0.096506147}},"neo_reference_id":"3827337","is_potentially_hazardous_asteroid":false,"id":"3827337"},{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3843641?api_key=DEMO_KEY"},"absolute_magnitude_h":20.8,"name":"(2019 QK4)","close_approach_data":[{"close_approach_date_full":"2015-Sep-07 10:04","miss_distance":{"astronomical":"0.3387069263","kilometers":"50669834.728726981","lunar":"131.7569943307","miles":"31484775.3319990978"},"epoch_date_close_approach":1441620240000,"relative_velocity":{"miles_per_hour":"85784.4826776004","kilometers_per_hour":"138058.9823592299","kilometers_per_second":"38.349717322"},"orbiting_body":"Earth","close_approach_date":"2015-09-07"}],"is_sentry_object":false,"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3843641","estimated_diameter":{"kilometers":{"estimated_diameter_min":0.1838886721,"estimated_diameter_max":0.411187571},"meters":{"estimated_diameter_min":183.8886720703,"estimated_diameter_max":411.1875710413},"feet":{"estimated_diameter_max":1349.040630575,"estimated_diameter_min":603.309310875},"miles":{"estimated_diameter_max":0.2555000322,"estimated_diameter_min":0.1142630881}},"is_potentially_hazardous_asteroid":false,"id":"3843641","neo_reference_id":"3843641"},{"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3986741","estimated_diameter":{"miles":{"estimated_diameter_max":0.0464933628,"estimated_diameter_min":0.0207924639},"feet":{"estimated_diameter_max":245.4850393757,"estimated_diameter_min":109.7842471007},"meters":{"estimated_diameter_max":74.8238376074,"estimated_diameter_min":33.4622374455},"kilometers":{"estimated_diameter_min":0.0334622374,"estimated_diameter_max":0.0748238376}},"is_potentially_hazardous_asteroid":false,"neo_reference_id":"3986741","id":"3986741","name":"(2020 BY)","absolute_magnitude_h":24.5,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/3986741?api_key=DEMO_KEY"},"is_sentry_object":false,"close_approach_data":[{"epoch_date_close_approach":1441604340000,"close_approach_date_full":"2015-Sep-07 05:39","miss_distance":{"miles":"37811320.6148355832","lunar":"158.2322218708","astronomical":"0.4067666372","kilometers":"60851422.512182764"},"close_approach_date":"2015-09-07","relative_velocity":{"miles_per_hour":"60821.1431846925","kilometers_per_second":"27.1899249786","kilometers_per_hour":"97883.7299230601"},"orbiting_body":"Earth"}]},{"absolute_magnitude_h":26.9,"name":"(2020 WZ)","links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/54088823?api_key=DEMO_KEY"},"is_sentry_object":false,"close_approach_data":[{"close_approach_date":"2015-09-07","orbiting_body":"Earth","relative_velocity":{"kilometers_per_second":"20.0777354148","kilometers_per_hour":"72279.8474933128","miles_per_hour":"44911.8863493865"},"epoch_date_close_approach":1441655760000,"miss_distance":{"lunar":"179.797103928","miles":"42964485.121061712","kilometers":"69144636.96606024","astronomical":"0.462203352"},"close_approach_date_full":"2015-Sep-07 19:56"}],"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=54088823","estimated_diameter":{"miles":{"estimated_diameter_max":0.0153953994,"estimated_diameter_min":0.0068850319},"feet":{"estimated_diameter_max":81.2877363957,"estimated_diameter_min":36.3529808636},"meters":{"estimated_diameter_max":24.7765012606,"estimated_diameter_min":11.0803882126},"kilometers":{"estimated_diameter_max":0.0247765013,"estimated_diameter_min":0.0110803882}},"id":"54088823","is_potentially_hazardous_asteroid":false,"neo_reference_id":"54088823"}]},"element_count":25}
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 1c38ffb4582129f6838cbb6762af6a0f

done_testing;