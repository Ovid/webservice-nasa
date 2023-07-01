#!/usr/bin/env perl

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 91c51215ae14df3c2661d44a403f8457

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
subtest 'get APOD by date' => sub {
    my $get_apod_by_date = get_apod_by_date();
    my $limit_remaining;
    if ( $get_apod_by_date =~ /X-Ratelimit-Remaining: (\d+)/ ) {
        $limit_remaining = $1;
    }

    set_response($get_apod_by_date);
    my $response;
    lives_ok {
        $response = $nasa->get_planetary_apod(
            date => '2023-06-12',
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
    if ( $response->is_json ) {
        eq_or_diff $response->content, $expected, 'get_neo_rest_v1_feed response is decoded correctly';
    }
    else {
        ok defined $response->content, 'get_neo_rest_v1_feed response is defined';
    }
    is $response->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub get_apod_by_date {
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

{"copyright":"Tianyao Yang","date":"2023-06-12","explanation":"What’s that near the Moon? It’s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not — it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.","hdurl":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg","media_type":"image","service_version":"v1","title":"The Largest Satellites of Earth","url":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg"}
END
}
subtest 'get random APOD images' => sub {
    my $get_random_apod_images = get_random_apod_images();
    my $limit_remaining;
    if ( $get_random_apod_images =~ /X-Ratelimit-Remaining: (\d+)/ ) {
        $limit_remaining = $1;
    }

    set_response($get_random_apod_images);
    my $response;
    lives_ok {
        $response = $nasa->get_planetary_apod(
            count => '2',
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
    if ( $response->is_json ) {
        eq_or_diff $response->content, $expected, 'get_neo_rest_v1_feed response is decoded correctly';
    }
    else {
        ok defined $response->content, 'get_neo_rest_v1_feed response is defined';
    }
    is $response->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub get_random_apod_images {
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

{"copyright":"Tianyao Yang","date":"2023-06-12","explanation":"What’s that near the Moon? It’s the International Space Station (ISS). Although the ISS may appear to be physically near the Moon, it is not — it is physically near the Earth. In low Earth orbit and circulating around our big blue marble about every 90 minutes, the ISS was captured photographically as it crossed nearly in front of the Moon. The Moon, itself in a month-long orbit around the Earth, shows a crescent phase as only a curving sliver of its Sun-illuminated half is visible from the Earth. The featured image was taken in late March from Shanghai, China and shows not only details of Earth's largest human-made satellite, but details of the cratered and barren surface of Earth's largest natural satellite. Over the next few years, humanity is planning to send more people and machines to the Moon than ever before.","hdurl":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_2599.jpg","media_type":"image","service_version":"v1","title":"The Largest Satellites of Earth","url":"https://apod.nasa.gov/apod/image/2306/IssMoon_Yang_960.jpg"}
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 91c51215ae14df3c2661d44a403f8457

done_testing;