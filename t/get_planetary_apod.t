#!/usr/bin/env perl

# Because the NASA services can be unreliable, we use a local cache of
# the response. This test is primarily to validate that our OpenAPI spec is
# working

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
        $response = $nasa->get_planetary_apod(

            date => '2018-02-04',

        );
    }
    'get_planetary_apod survived OpenAPI validation';

    my $expected = {
        copyright   => 'Tianyao Yang',
        date        => '2023-06-12',
        explanation =>
          "What\x{2019}s that near the Moon? It\x{2019}s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not \x{2014} it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.",
        hdurl           => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg',
        media_type      => 'image',
        service_version => 'v1',
        title           => 'The Largest Satellites of Earth',
        url             => 'https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg',
    };
    eq_or_diff $response, $expected, 'get_planetary_apod response is decoded correctly' if $nasa->should_decode;
    is $nasa->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

done_testing;

sub default {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 1122
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

{"copyright":"Tianyao Yang","hdurl":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg","service_version":"v1","title":"The Largest Satellites of Earth","date":"2023-06-12","explanation":"What’s that near the Moon? It’s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not — it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.","url":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg","media_type":"image"}
END
}
