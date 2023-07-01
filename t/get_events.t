#!/usr/bin/env perl

# died: 'WebService::NASA::Role::Server' requires the methods '_GET', '_debug', '_get_response', '_sanitize_url', '_url', 'is_demo', and 'is_json' to be implemented by 'WebService::NASA::Server::EonetGsfcNasaGov' at /Users/ovid/perl5/perlbrew/perls/perl-5.32.1/lib/site_perl/5.32.1/darwin-2level/Moose/Meta/Role/Application/ToClass.pm line 31

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 91bde2ee15fc8a7a59e93962be27bf3e

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
subtest 'get EONET events' => sub {
    my $get_eonet_events = get_eonet_events();
    my $limit_remaining;
    if ( $get_eonet_events =~ /X-Ratelimit-Remaining: (\d+)/ ) {
        $limit_remaining = $1;
    }

    set_response($get_eonet_events);
    my $response;
    lives_ok {
        $response = $nasa->get_events(
            category => 'severeStorms,wildfires', limit => '1',
        );
    }
    'get_events survived OpenAPI validation';

    my $expected = {
        description => 'Natural events from EONET.',
        events      => [
            {
                categories => [
                    {
                        id    => 'severeStorms',
                        title => 'Severe Storms',
                    },
                ],
                closed      => undef,
                description => undef,
                geometry    => [
                    {
                        coordinates => [
                            '-105.5',
                            '15.2',
                        ],
                        date           => '2023-06-27T18:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 40,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-106.4',
                            '15.2',
                        ],
                        date           => '2023-06-28T00:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 50,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-107.2',
                            '15.3',
                        ],
                        date           => '2023-06-28T06:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 55,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-107.8',
                            '15.2',
                        ],
                        date           => '2023-06-28T12:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 65,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-108.1',
                            '15.3',
                        ],
                        date           => '2023-06-28T18:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 70,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-108.7',
                            '15.3',
                        ],
                        date           => '2023-06-29T00:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 70,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-109.5',
                            '15.4',
                        ],
                        date           => '2023-06-29T06:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 75,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            -110,
                            '15.8',
                        ],
                        date           => '2023-06-29T12:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 75,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-110.4',
                            '16.2',
                        ],
                        date           => '2023-06-29T18:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 75,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            -111,
                            '16.5',
                        ],
                        date           => '2023-06-30T00:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 80,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-111.5',
                            '16.6',
                        ],
                        date           => '2023-06-30T06:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 85,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-111.9',
                            '17.1',
                        ],
                        date           => '2023-06-30T12:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 85,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-112.5',
                            '17.5',
                        ],
                        date           => '2023-06-30T18:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 95,
                        type           => 'Point',
                    },
                    {
                        coordinates => [
                            '-113.2',
                            '17.9',
                        ],
                        date           => '2023-07-01T00:00:00Z',
                        magnitudeUnit  => 'kts',
                        magnitudeValue => 80,
                        type           => 'Point',
                    },
                ],
                id      => 'EONET_6374',
                link    => 'https://eonet.gsfc.nasa.gov/api/v3/events/EONET_6374',
                sources => [
                    {
                        id  => 'JTWC',
                        url => 'https://www.metoc.navy.mil/jtwc/products/ep0123.tcw',
                    },
                ],
                title => 'Hurricane Adrian',
            },
        ],
        link  => 'https://eonet.gsfc.nasa.gov/api/v3/events',
        title => 'EONET Events',
    };
    if ( $response->is_json ) {
        eq_or_diff $response->content, $expected, 'get_neo_rest_v1_feed response is decoded correctly';
    }
    else {
        ok defined $response->content, 'get_neo_rest_v1_feed response is defined';
    }
    is $response->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub get_eonet_events {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 2065
Content-Type: application/json; charset=utf-8
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

{"description":"Natural events from EONET.","events":[{"categories":[{"id":"severeStorms","title":"Severe Storms"}],"closed":null,"description":null,"geometry":[{"coordinates":[-105.5,15.2],"date":"2023-06-27T18:00:00Z","magnitudeUnit":"kts","magnitudeValue":40,"type":"Point"},{"coordinates":[-106.4,15.2],"date":"2023-06-28T00:00:00Z","magnitudeUnit":"kts","magnitudeValue":50,"type":"Point"},{"coordinates":[-107.2,15.3],"date":"2023-06-28T06:00:00Z","magnitudeUnit":"kts","magnitudeValue":55,"type":"Point"},{"coordinates":[-107.8,15.2],"date":"2023-06-28T12:00:00Z","magnitudeUnit":"kts","magnitudeValue":65,"type":"Point"},{"coordinates":[-108.1,15.3],"date":"2023-06-28T18:00:00Z","magnitudeUnit":"kts","magnitudeValue":70,"type":"Point"},{"coordinates":[-108.7,15.3],"date":"2023-06-29T00:00:00Z","magnitudeUnit":"kts","magnitudeValue":70,"type":"Point"},{"coordinates":[-109.5,15.4],"date":"2023-06-29T06:00:00Z","magnitudeUnit":"kts","magnitudeValue":75,"type":"Point"},{"coordinates":[-110,15.8],"date":"2023-06-29T12:00:00Z","magnitudeUnit":"kts","magnitudeValue":75,"type":"Point"},{"coordinates":[-110.4,16.2],"date":"2023-06-29T18:00:00Z","magnitudeUnit":"kts","magnitudeValue":75,"type":"Point"},{"coordinates":[-111,16.5],"date":"2023-06-30T00:00:00Z","magnitudeUnit":"kts","magnitudeValue":80,"type":"Point"},{"coordinates":[-111.5,16.6],"date":"2023-06-30T06:00:00Z","magnitudeUnit":"kts","magnitudeValue":85,"type":"Point"},{"coordinates":[-111.9,17.1],"date":"2023-06-30T12:00:00Z","magnitudeUnit":"kts","magnitudeValue":85,"type":"Point"},{"coordinates":[-112.5,17.5],"date":"2023-06-30T18:00:00Z","magnitudeUnit":"kts","magnitudeValue":95,"type":"Point"},{"coordinates":[-113.2,17.9],"date":"2023-07-01T00:00:00Z","magnitudeUnit":"kts","magnitudeValue":80,"type":"Point"}],"id":"EONET_6374","link":"https://eonet.gsfc.nasa.gov/api/v3/events/EONET_6374","sources":[{"id":"JTWC","url":"https://www.metoc.navy.mil/jtwc/products/ep0123.tcw"}],"title":"Hurricane Adrian"}],"link":"https://eonet.gsfc.nasa.gov/api/v3/events","title":"EONET Events"}
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 91bde2ee15fc8a7a59e93962be27bf3e

done_testing;