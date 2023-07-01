#!/usr/bin/env perl

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 40257de14f23d3915b695ac43cfe1ea0

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
subtest 'get assets for a location' => sub {
    my $get_assets_for_a_location = get_assets_for_a_location();
    my $limit_remaining;
    if ( $get_assets_for_a_location =~ /X-Ratelimit-Remaining: (\d+)/ ) {
        $limit_remaining = $1;
    }

    set_response($get_assets_for_a_location);
    my $response;
    lives_ok {
        $response = $nasa->get_planetary_earth_imagery(
            date => '2018-01-01', lat => '1.5', lon => '100.75',
        );
    }
    'get_planetary_earth_imagery survived OpenAPI validation';

    my $expected = 'pretend this is binary content';
    if ( $response->is_json ) {
        eq_or_diff $response->content, $expected, 'get_neo_rest_v1_feed response is decoded correctly';
    }
    else {
        ok defined $response->content, 'get_neo_rest_v1_feed response is defined';
    }
    is $response->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub get_assets_for_a_location {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 30
Content-Type: image/png
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

pretend this is binary content
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 40257de14f23d3915b695ac43cfe1ea0

done_testing;