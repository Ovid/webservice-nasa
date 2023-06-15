#!/usr/bin/env perl

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 925dfcabb7513cb72ff03dc0c6e75767

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
        $response = $nasa->get_neo_rest_v1_neo_browse();
    }
    'get_neo_rest_v1_neo_browse survived OpenAPI validation';

    my $expected = {
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
    };
    eq_or_diff $response, $expected, 'get_neo_rest_v1_neo_browse response is decoded correctly' if $nasa->should_decode;
    is $nasa->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub default {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 25356
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

{"page":{"size":2,"total_elements":32803,"total_pages":1641,"number":0},"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/browse?page=0&size=2&api_key=DEMO_KEY","next":"http://api.nasa.gov/neo/rest/v1/neo/browse?page=1&size=2&api_key=DEMO_KEY"},"near_earth_objects":[{"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2000433?api_key=DEMO_KEY"},"name_limited":"Eros","name":"433 Eros (A898 PA)","absolute_magnitude_h":10.31,"estimated_diameter":{"miles":{"estimated_diameter_max":32.0177610556,"estimated_diameter_min":14.3187780415},"feet":{"estimated_diameter_max":169053.836084245,"estimated_diameter_min":75603.1738682955},"kilometers":{"estimated_diameter_min":23.0438466577,"estimated_diameter_max":51.5276075896},"meters":{"estimated_diameter_min":23043.8466576534,"estimated_diameter_max":51527.6075895943}},"close_approach_data":[{"miss_distance":{"kilometers":"47112732.928149391","lunar":"122.5074468577","miles":"29274494.7651919558","astronomical":"0.3149291693"},"relative_velocity":{"kilometers_per_hour":"20083.0290749201","miles_per_hour":"12478.8132604691","kilometers_per_second":"5.5786191875"},"epoch_date_close_approach":-2177879400000,"close_approach_date_full":"1900-Dec-27 01:30","close_approach_date":"1900-12-27","orbiting_body":"Earth"},{"miss_distance":{"kilometers":"70533232.893794475","lunar":"183.4078760325","miles":"43827318.620434755","astronomical":"0.4714855425"},"relative_velocity":{"miles_per_hour":"9830.0366684463","kilometers_per_second":"4.3944908885","kilometers_per_hour":"15820.1671985367"},"epoch_date_close_approach":-1961526540000,"close_approach_date_full":"1907-Nov-05 03:31","orbiting_body":"Earth","close_approach_date":"1907-11-05"},{"miss_distance":{"miles":"46408855.985038036","astronomical":"0.499257206","lunar":"194.211053134","kilometers":"74687814.59975122"},"relative_velocity":{"kilometers_per_hour":"17340.4224662258","kilometers_per_second":"4.8167840184","miles_per_hour":"10774.6641707501"},"epoch_date_close_approach":-1663036860000,"close_approach_date_full":"1917-Apr-20 21:19","orbiting_body":"Earth","close_approach_date":"1917-04-20"},{"miss_distance":{"lunar":"139.9569441821","miles":"33444243.0636095534","astronomical":"0.3597864889","kilometers":"53823292.394218643"},"relative_velocity":{"miles_per_hour":"10280.915173352","kilometers_per_second":"4.5960548855","kilometers_per_hour":"16545.797587763"},"epoch_date_close_approach":-1446083220000,"close_approach_date_full":"1924-Mar-05 22:13","close_approach_date":"1924-03-05","orbiting_body":"Earth"},{"close_approach_date_full":"1931-Jan-30 04:07","close_approach_date":"1931-01-30","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"21314.9467227704","kilometers_per_second":"5.9208185341","miles_per_hour":"13244.2789789347"},"miss_distance":{"astronomical":"0.1740731458","miles":"16181109.5707945148","lunar":"67.7144537162","kilometers":"26040971.835879446"},"epoch_date_close_approach":-1228247580000},{"close_approach_date":"1938-01-13","orbiting_body":"Earth","close_approach_date_full":"1938-Jan-13 22:04","epoch_date_close_approach":-1008726960000,"miss_distance":{"kilometers":"32164326.017637735","lunar":"83.6370385545","miles":"19985985.424901343","astronomical":"0.2150052405"},"relative_velocity":{"miles_per_hour":"13609.4168237879","kilometers_per_second":"6.0840524046","kilometers_per_hour":"21902.5886564605"}},{"epoch_date_close_approach":-791936340000,"relative_velocity":{"kilometers_per_hour":"13053.9550896485","miles_per_hour":"8111.2200388986","kilometers_per_second":"3.626098636"},"miss_distance":{"astronomical":"0.4030090561","miles":"37462031.6350747166","lunar":"156.7705228229","kilometers":"60289296.383270507"},"close_approach_date":"1944-11-27","orbiting_body":"Earth","close_approach_date_full":"1944-Nov-27 01:41"},{"miss_distance":{"kilometers":"66195880.154722887","lunar":"172.1294386089","miles":"41132212.6021023606","astronomical":"0.4424921301"},"relative_velocity":{"miles_per_hour":"8294.0593510317","kilometers_per_second":"3.7078364482","kilometers_per_hour":"13348.2112136055"},"epoch_date_close_approach":-275928720000,"close_approach_date_full":"1961-Apr-04 09:08","orbiting_body":"Earth","close_approach_date":"1961-04-04"},{"close_approach_date_full":"1968-Feb-11 13:46","close_approach_date":"1968-02-11","orbiting_body":"Earth","relative_velocity":{"kilometers_per_hour":"21840.7859008821","miles_per_hour":"13571.014994912","kilometers_per_second":"6.0668849725"},"miss_distance":{"kilometers":"39833635.134625859","lunar":"103.5795768173","astronomical":"0.2662714057","miles":"24751473.1315964942"},"epoch_date_close_approach":-59566440000},{"epoch_date_close_approach":159694740000,"relative_velocity":{"kilometers_per_hour":"20971.1076598791","miles_per_hour":"13030.6307567732","kilometers_per_second":"5.8253076833"},"miss_distance":{"lunar":"58.7912002601","astronomical":"0.1511341909","miles":"14048800.5292673654","kilometers":"22609353.042813383"},"orbiting_body":"Earth","close_approach_date":"1975-01-23","close_approach_date_full":"1975-Jan-23 07:39"},{"miss_distance":{"astronomical":"0.3084893271","miles":"28675874.0429781426","lunar":"120.0023482419","kilometers":"46149346.251893277"},"relative_velocity":{"kilometers_per_hour":"20394.9786453535","kilometers_per_second":"5.6652718459","miles_per_hour":"12672.6465921642"},"epoch_date_close_approach":378461100000,"close_approach_date_full":"1981-Dec-29 08:05","close_approach_date":"1981-12-29","orbiting_body":"Earth"},{"relative_velocity":{"kilometers_per_hour":"15501.2476969045","miles_per_hour":"9631.8724925571","kilometers_per_second":"4.305902138"},"miss_distance":{"miles":"43469872.4247609062","astronomical":"0.4676402077","lunar":"181.9120407953","kilometers":"69957978.998277599"},"epoch_date_close_approach":594831360000,"close_approach_date_full":"1988-Nov-06 14:56","orbiting_body":"Earth","close_approach_date":"1988-11-06"},{"close_approach_date":"2005-03-08","orbiting_body":"Earth","close_approach_date_full":"2005-Mar-08 22:07","epoch_date_close_approach":1110319620000,"relative_velocity":{"kilometers_per_hour":"15884.2526231559","kilometers_per_second":"4.4122923953","miles_per_hour":"9869.8568590937"},"miss_distance":{"lunar":"142.2056494358","miles":"33981595.7867820932","astronomical":"0.3655672222","kilometers":"54688077.782936714"}},{"close_approach_date_full":"2012-Jan-31 11:01","close_approach_date":"2012-01-31","orbiting_body":"Earth","relative_velocity":{"kilometers_per_second":"5.9451959021","miles_per_hour":"13298.8087133156","kilometers_per_hour":"21402.705247412"},"miss_distance":{"astronomical":"0.1786758136","miles":"16608954.2658937616","lunar":"69.5048914904","kilometers":"26729521.135077032"},"epoch_date_close_approach":1328007660000},{"orbiting_body":"Earth","close_approach_date":"2019-01-15","close_approach_date_full":"2019-Jan-15 06:01","epoch_date_close_approach":1547532060000,"miss_distance":{"lunar":"81.1448892819","miles":"19390459.0899223026","astronomical":"0.2085986871","kilometers":"31205919.274956477"},"relative_velocity":{"kilometers_per_hour":"21761.7034264303","kilometers_per_second":"6.0449176185","miles_per_hour":"13521.8762207172"}},{"orbiting_body":"Earth","close_approach_date":"2025-11-30","close_approach_date_full":"2025-Nov-30 02:18","epoch_date_close_approach":1764469080000,"miss_distance":{"lunar":"154.6848675416","miles":"36963641.4867163664","astronomical":"0.3976474744","kilometers":"59487215.181119528"},"relative_velocity":{"kilometers_per_hour":"13423.8631236067","kilometers_per_second":"3.7288508677","miles_per_hour":"8341.0665058878"}},{"epoch_date_close_approach":2280423720000,"miss_distance":{"miles":"41471463.6747876724","astronomical":"0.4461417254","lunar":"173.5491311806","kilometers":"66741851.837964898"},"relative_velocity":{"kilometers_per_hour":"13410.8089939193","kilometers_per_second":"3.7252247205","miles_per_hour":"8332.9551773606"},"orbiting_body":"Earth","close_approach_date":"2042-04-06","close_approach_date_full":"2042-Apr-06 19:02"},{"close_approach_date_full":"2049-Feb-12 05:38","orbiting_body":"Earth","close_approach_date":"2049-02-12","relative_velocity":{"kilometers_per_second":"6.0590645856","miles_per_hour":"13553.5215714769","kilometers_per_hour":"21812.6325080767"},"miss_distance":{"miles":"25335601.2070526534","astronomical":"0.2725553389","lunar":"106.0240268321","kilometers":"40773698.156568143"},"epoch_date_close_approach":2496721080000},{"epoch_date_close_approach":2715937380000,"miss_distance":{"astronomical":"0.1497821765","miles":"13923122.940991759","lunar":"58.2652666585","kilometers":"22407094.568364055"},"relative_velocity":{"miles_per_hour":"13020.4532512442","kilometers_per_second":"5.8207578574","kilometers_per_hour":"20954.7282866821"},"close_approach_date":"2056-01-24","orbiting_body":"Earth","close_approach_date_full":"2056-Jan-24 11:03"},{"epoch_date_close_approach":2934779100000,"miss_distance":{"kilometers":"45321201.779715584","lunar":"117.8489205248","astronomical":"0.3029535232","miles":"28161288.9295956992"},"relative_velocity":{"kilometers_per_hour":"20636.0765370681","kilometers_per_second":"5.7322434825","miles_per_hour":"12822.4554460466"},"close_approach_date":"2062-12-31","orbiting_body":"Earth","close_approach_date_full":"2062-Dec-31 08:25"},{"epoch_date_close_approach":3151171740000,"relative_velocity":{"kilometers_per_hour":"15283.5036662481","miles_per_hour":"9496.5748197307","kilometers_per_second":"4.2454176851"},"miss_distance":{"miles":"43199186.121611611","astronomical":"0.4647282185","lunar":"180.7792769965","kilometers":"69522351.616494595"},"orbiting_body":"Earth","close_approach_date":"2069-11-08","close_approach_date_full":"2069-Nov-08 21:29"},{"close_approach_date_full":"2086-Mar-11 22:55","close_approach_date":"2086-03-11","orbiting_body":"Earth","miss_distance":{"kilometers":"55547189.163802277","lunar":"144.4396005419","miles":"34515422.8449623426","astronomical":"0.3713100271"},"relative_velocity":{"kilometers_per_second":"4.2258643769","miles_per_hour":"9452.8360246418","kilometers_per_hour":"15213.1117567663"},"epoch_date_close_approach":3666725700000},{"orbiting_body":"Earth","close_approach_date":"2093-01-31","close_approach_date_full":"2093-Jan-31 15:47","epoch_date_close_approach":3884255220000,"relative_velocity":{"kilometers_per_second":"5.9749136221","miles_per_hour":"13365.2842812306","kilometers_per_hour":"21509.6890394877"},"miss_distance":{"kilometers":"27296208.428246654","astronomical":"0.1824638842","miles":"16961077.4217016652","lunar":"70.9784509538"}},{"close_approach_date":"2100-01-16","orbiting_body":"Earth","close_approach_date_full":"2100-Jan-16 11:39","epoch_date_close_approach":4103782740000,"relative_velocity":{"kilometers_per_second":"6.0149196633","miles_per_hour":"13454.7737947383","kilometers_per_hour":"21653.7107877231"},"miss_distance":{"lunar":"79.3089767075","astronomical":"0.2038791175","miles":"18951747.693781205","kilometers":"30499881.715479725"}},{"epoch_date_close_approach":4320872520000,"relative_velocity":{"kilometers_per_hour":"13870.9098509079","kilometers_per_second":"3.8530305141","miles_per_hour":"8618.8439570822"},"miss_distance":{"miles":"36465749.7209118852","astronomical":"0.3922912542","lunar":"152.6012978838","kilometers":"58685936.047948554"},"orbiting_body":"Earth","close_approach_date":"2106-12-04","close_approach_date_full":"2106-Dec-04 02:22"},{"miss_distance":{"kilometers":"67274586.667835486","astronomical":"0.4497028378","miles":"41802489.7481862668","lunar":"174.9344039042"},"relative_velocity":{"kilometers_per_hour":"13513.4075714592","kilometers_per_second":"3.7537243254","miles_per_hour":"8396.7059434992"},"epoch_date_close_approach":4836779460000,"close_approach_date_full":"2123-Apr-10 05:51","orbiting_body":"Earth","close_approach_date":"2123-04-10"},{"miss_distance":{"kilometers":"41612827.540500788","lunar":"108.2060186636","miles":"25857012.0280873544","astronomical":"0.2781645724"},"relative_velocity":{"kilometers_per_second":"6.0381849282","miles_per_hour":"13506.8158659941","kilometers_per_hour":"21737.4657416866"},"epoch_date_close_approach":5053011060000,"close_approach_date_full":"2130-Feb-14 22:11","orbiting_body":"Earth","close_approach_date":"2130-02-14"},{"orbiting_body":"Earth","close_approach_date":"2137-01-25","close_approach_date_full":"2137-Jan-25 14:12","epoch_date_close_approach":5272179120000,"miss_distance":{"kilometers":"22359243.131520978","astronomical":"0.1494623094","miles":"13893389.4368983764","lunar":"58.1408383566"},"relative_velocity":{"kilometers_per_hour":"20931.393493074","kilometers_per_second":"5.8142759703","miles_per_hour":"13005.9539179604"}},{"epoch_date_close_approach":5491103160000,"miss_distance":{"lunar":"115.369772877","miles":"27568869.475111758","astronomical":"0.296580393","kilometers":"44367795.07656291"},"relative_velocity":{"kilometers_per_second":"5.7943538473","miles_per_hour":"12961.3901209861","kilometers_per_hour":"20859.6738502169"},"close_approach_date":"2144-01-03","orbiting_body":"Earth","close_approach_date_full":"2144-Jan-03 10:26"},{"orbiting_body":"Earth","close_approach_date":"2150-11-12","close_approach_date_full":"2150-Nov-12 07:12","epoch_date_close_approach":5707523520000,"relative_velocity":{"kilometers_per_hour":"15028.2129289863","miles_per_hour":"9337.9470835693","kilometers_per_second":"4.1745035914"},"miss_distance":{"astronomical":"0.4609447583","miles":"42847491.5292516898","lunar":"179.3075109787","kilometers":"68956354.029344821"}},{"epoch_date_close_approach":6223152600000,"relative_velocity":{"miles_per_hour":"9006.3266800166","kilometers_per_second":"4.026253601","kilometers_per_hour":"14494.512963503"},"miss_distance":{"lunar":"146.8217259492","astronomical":"0.3774337428","miles":"35084657.7735706968","kilometers":"56463283.989007836"},"orbiting_body":"Earth","close_approach_date":"2167-03-16","close_approach_date_full":"2167-Mar-16 05:30"},{"epoch_date_close_approach":6440520600000,"miss_distance":{"lunar":"73.2877047188","astronomical":"0.1884002692","miles":"17512898.8741029752","kilometers":"28184278.979746604"},"relative_velocity":{"kilometers_per_hour":"21619.9554168322","miles_per_hour":"13433.7995199755","kilometers_per_second":"6.0055431713"},"orbiting_body":"Earth","close_approach_date":"2174-02-03","close_approach_date_full":"2174-Feb-03 01:30"},{"epoch_date_close_approach":6660046500000,"miss_distance":{"lunar":"77.0262060625","miles":"18406254.672652375","astronomical":"0.1980108125","kilometers":"29621995.786969375"},"relative_velocity":{"kilometers_per_hour":"21563.4201458554","miles_per_hour":"13398.6707011844","kilometers_per_second":"5.9898389294"},"close_approach_date":"2181-01-17","orbiting_body":"Earth","close_approach_date_full":"2181-Jan-17 20:55"},{"close_approach_date_full":"2187-Dec-06 23:28","close_approach_date":"2187-12-06","orbiting_body":"Earth","miss_distance":{"kilometers":"57941309.164393183","lunar":"150.6650413201","miles":"36003060.0306766054","astronomical":"0.3873137309"},"relative_velocity":{"kilometers_per_hour":"14340.1754211404","kilometers_per_second":"3.9833820614","miles_per_hour":"8910.4273332081"},"epoch_date_close_approach":6877265280000}],"is_potentially_hazardous_asteroid":false,"id":"2000433","neo_reference_id":"2000433","is_sentry_object":false,"designation":"433","orbital_data":{"perihelion_argument":"178.9269951795186","observations_used":9130,"semi_major_axis":"1.458129136101339","epoch_osculation":"2460000.5","jupiter_tisserand_invariant":"4.582","orbit_determination_date":"2021-05-24 17:55:05","data_arc_in_days":46582,"last_observation_date":"2021-05-13","equinox":"J2000","inclination":"10.82782330218545","perihelion_time":"2459802.601698595905","perihelion_distance":"1.133284372081002","orbital_period":"643.1205824040848","orbit_class":{"orbit_class_type":"AMO","orbit_class_range":"1.017 AU < q (perihelion) < 1.3 AU","orbit_class_description":"Near-Earth asteroid orbits similar to that of 1221 Amor"},"minimum_orbit_intersection":".148662","aphelion_distance":"1.782973900121676","ascending_node_longitude":"304.2870401191066","orbit_id":"659","first_observation_date":"1893-10-29","mean_anomaly":"110.7776526746434","mean_motion":".5597706088868498","orbit_uncertainty":"0","eccentricity":".2227818894620597"},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000433"},{"name":"719 Albert (A911 TB)","absolute_magnitude_h":15.59,"links":{"self":"http://api.nasa.gov/neo/rest/v1/neo/2000719?api_key=DEMO_KEY"},"name_limited":"Albert","neo_reference_id":"2000719","designation":"719","is_sentry_object":false,"orbital_data":{"orbit_uncertainty":"0","eccentricity":".5470449589266008","mean_motion":".2301418330768929","ascending_node_longitude":"183.8569896093903","aphelion_distance":"4.079828796226027","mean_anomaly":"10.23596428095426","first_observation_date":"1911-10-04","orbit_id":"257","perihelion_distance":"1.194521858788897","perihelion_time":"2459956.023234763085","minimum_orbit_intersection":".200008","orbit_class":{"orbit_class_description":"Near-Earth asteroid orbits similar to that of 1221 Amor","orbit_class_range":"1.017 AU < q (perihelion) < 1.3 AU","orbit_class_type":"AMO"},"orbital_period":"1564.252770506612","inclination":"11.57600929611851","data_arc_in_days":40483,"orbit_determination_date":"2023-03-01 06:08:09","equinox":"J2000","last_observation_date":"2022-08-05","jupiter_tisserand_invariant":"3.141","epoch_osculation":"2460000.5","observations_used":2035,"perihelion_argument":"156.2503681890173","semi_major_axis":"2.637175327507462"},"nasa_jpl_url":"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2000719","estimated_diameter":{"miles":{"estimated_diameter_min":1.2586528312,"estimated_diameter_max":2.8144332906},"feet":{"estimated_diameter_max":14860.2128474689,"estimated_diameter_min":6645.6892174112},"kilometers":{"estimated_diameter_min":2.0256060086,"estimated_diameter_max":4.529392731},"meters":{"estimated_diameter_min":2025.6060086475,"estimated_diameter_max":4529.3927309679}},"close_approach_data":[{"epoch_date_close_approach":-1904892960000,"miss_distance":{"lunar":"664.7131514687","miles":"158840480.0863061498","astronomical":"1.7087741683","kilometers":"255628975.888701521"},"relative_velocity":{"kilometers_per_hour":"12405.7044543097","miles_per_hour":"7708.4223038459","kilometers_per_second":"3.4460290151"},"orbiting_body":"Juptr","close_approach_date":"1909-08-21","close_approach_date_full":"1909-Aug-21 15:04"},{"orbiting_body":"Earth","close_approach_date":"1911-09-08","close_approach_date_full":"1911-Sep-08 08:15","epoch_date_close_approach":-1840290300000,"miss_distance":{"lunar":"79.9323982215","miles":"19100721.085327761","astronomical":"0.2054817435","kilometers":"30739631.151486345"},"relative_velocity":{"kilometers_per_hour":"25865.4349107149","miles_per_hour":"16071.7753754939","kilometers_per_second":"7.1848430308"}},{"epoch_date_close_approach":-893488200000,"miss_distance":{"miles":"19118067.661241227","astronomical":"0.2056683545","lunar":"80.0049899005","kilometers":"30767547.759604915"},"relative_velocity":{"miles_per_hour":"16350.8565648405","kilometers_per_second":"7.3096055098","kilometers_per_hour":"26314.5798352299"},"close_approach_date":"1941-09-08","orbiting_body":"Earth","close_approach_date_full":"1941-Sep-08 16:50"},{"orbiting_body":"Juptr","close_approach_date":"1956-09-12","close_approach_date_full":"1956-Sep-12 20:20","epoch_date_close_approach":-419744400000,"relative_velocity":{"miles_per_hour":"7300.0350754379","kilometers_per_second":"3.2634606265","kilometers_per_hour":"11748.4582554323"},"miss_distance":{"kilometers":"211999593.145857803","astronomical":"1.4171297569","miles":"131730438.7592235614","lunar":"551.2634754341"}},{"close_approach_date_full":"1971-Sep-06 04:03","orbiting_body":"Earth","close_approach_date":"1971-09-06","relative_velocity":{"kilometers_per_hour":"27596.0371152368","miles_per_hour":"17147.104284187","kilometers_per_second":"7.6655658653"},"miss_distance":{"kilometers":"47085964.483683071","lunar":"122.4378407537","astronomical":"0.3147502333","miles":"29257861.6250895398"},"epoch_date_close_approach":52977780000},{"relative_velocity":{"kilometers_per_hour":"27551.5977911354","kilometers_per_second":"7.6532216086","miles_per_hour":"17119.4914163863"},"miss_distance":{"lunar":"110.7284535701","miles":"26459775.4466381054","astronomical":"0.2846489809","kilometers":"42582881.240310683"},"epoch_date_close_approach":999650400000,"close_approach_date_full":"2001-Sep-05 00:40","orbiting_body":"Earth","close_approach_date":"2001-09-05"},{"orbiting_body":"Juptr","close_approach_date":"2003-10-26","close_approach_date_full":"2003-Oct-26 03:46","epoch_date_close_approach":1067139960000,"relative_velocity":{"kilometers_per_hour":"13406.8625452769","miles_per_hour":"8330.5030076472","kilometers_per_second":"3.7241284848"},"miss_distance":{"lunar":"578.2869146836","miles":"138187985.2279364344","astronomical":"1.4865987524","kilometers":"222392006.903697388"}},{"orbiting_body":"Earth","close_approach_date":"2048-09-19","close_approach_date_full":"2048-Sep-19 10:28","epoch_date_close_approach":2484124080000,"relative_velocity":{"kilometers_per_second":"13.0394477911","miles_per_hour":"29167.940763817","kilometers_per_hour":"46942.0120478077"},"miss_distance":{"kilometers":"63678315.776634092","lunar":"165.5830048724","astronomical":"0.4256632516","miles":"39567870.6370587896"}},{"orbiting_body":"Juptr","close_approach_date":"2050-11-15","close_approach_date_full":"2050-Nov-15 11:59","epoch_date_close_approach":2552126340000,"relative_velocity":{"kilometers_per_hour":"18017.4339623463","miles_per_hour":"11195.3327862146","kilometers_per_second":"5.0048427673"},"miss_distance":{"kilometers":"293085928.075664739","lunar":"762.1126291533","miles":"182115150.9144578382","astronomical":"1.9591584297"}},{"epoch_date_close_approach":2959269360000,"relative_velocity":{"miles_per_hour":"7642.0217872267","kilometers_per_second":"3.4163448465","kilometers_per_hour":"12298.8414475462"},"miss_distance":{"kilometers":"233945031.32032437","miles":"145366701.718921506","astronomical":"1.563825951","lunar":"608.328294939"},"close_approach_date":"2063-10-10","orbiting_body":"Juptr","close_approach_date_full":"2063-Oct-10 19:16"},{"relative_velocity":{"kilometers_per_hour":"27080.1163785251","miles_per_hour":"16826.5312019786","kilometers_per_second":"7.5222545496"},"miss_distance":{"miles":"19842309.1292552776","astronomical":"0.2134595996","lunar":"83.0357842444","kilometers":"31933101.431212852"},"epoch_date_close_approach":3430013160000,"close_approach_date_full":"2078-Sep-10 05:26","orbiting_body":"Earth","close_approach_date":"2078-09-10"},{"miss_distance":{"lunar":"99.9190245773","miles":"23876744.1242075342","astronomical":"0.2568612457","kilometers":"38425895.242266659"},"relative_velocity":{"miles_per_hour":"17489.6252298962","kilometers_per_second":"7.8186889132","kilometers_per_hour":"28147.2800874542"},"epoch_date_close_approach":4376486160000,"close_approach_date_full":"2108-Sep-07 18:36","close_approach_date":"2108-09-07","orbiting_body":"Earth"},{"relative_velocity":{"kilometers_per_second":"3.4670013619","miles_per_hour":"7755.3353463996","kilometers_per_hour":"12481.2049027845"},"miss_distance":{"astronomical":"1.3899546635","miles":"129204356.049101281","lunar":"540.6923641015","kilometers":"207934257.056166745"},"epoch_date_close_approach":4444860600000,"close_approach_date_full":"2110-Nov-08 03:30","close_approach_date":"2110-11-08","orbiting_body":"Juptr"},{"epoch_date_close_approach":5323275660000,"relative_velocity":{"kilometers_per_hour":"30982.3940994637","miles_per_hour":"19251.2548225251","kilometers_per_second":"8.6062205832"},"miss_distance":{"kilometers":"55016469.31252208","lunar":"143.059567376","astronomical":"0.367762384","miles":"34185648.821201504"},"close_approach_date":"2138-09-08","orbiting_body":"Earth","close_approach_date_full":"2138-Sep-08 23:41"},{"orbiting_body":"Juptr","close_approach_date":"2157-12-03","close_approach_date_full":"2157-Dec-03 17:48","epoch_date_close_approach":5930300880000,"relative_velocity":{"kilometers_per_hour":"15284.991269407","kilometers_per_second":"4.2458309082","miles_per_hour":"9497.4991584824"},"miss_distance":{"kilometers":"246002794.582073548","lunar":"639.6821498356","miles":"152859048.3850410424","astronomical":"1.6444271204"}},{"relative_velocity":{"kilometers_per_hour":"13510.0676557181","kilometers_per_second":"3.752796571","miles_per_hour":"8394.6306497433"},"miss_distance":{"kilometers":"272693358.861024945","miles":"169443795.983016441","astronomical":"1.8228425235","lunar":"709.0857416415"},"epoch_date_close_approach":6338498220000,"close_approach_date_full":"2170-Nov-10 05:57","close_approach_date":"2170-11-10","orbiting_body":"Juptr"},{"close_approach_date":"2185-09-13","orbiting_body":"Earth","close_approach_date_full":"2185-Sep-13 19:01","epoch_date_close_approach":6806919660000,"relative_velocity":{"miles_per_hour":"18605.1362386728","kilometers_per_second":"8.3173750452","kilometers_per_hour":"29942.5501628245"},"miss_distance":{"kilometers":"32922264.568459316","lunar":"85.6079095052","miles":"20456946.6016219208","astronomical":"0.2200717468"}}],"is_potentially_hazardous_asteroid":false,"id":"2000719"}]}
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 925dfcabb7513cb72ff03dc0c6e75767

done_testing;