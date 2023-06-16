#!/usr/bin/env perl

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: 277b6829f5b9ead3987a41c723acce4f

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
        $response = $nasa->get_planetary_apod(
            date => '2018-02-04',
        );
    }
    'get_planetary_apod survived OpenAPI validation';

    my $expected = [
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
    ];
    eq_or_diff $response, $expected, 'get_planetary_apod response is decoded correctly' if $nasa->should_decode;
    is $nasa->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

sub default {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 924
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

[{"explanation":"The South Celestial Pole is easy to spot in star trail images of the southern sky.","media_type":"image","url":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.jpg","title":"Galaxies and the South Celestial Pole","hdurl":"https://apod.nasa.gov/apod/image/2101/2020_12_16_Kujal_Jizni_Pol_1500px-3.png","service_version":"v1","copyright":"Petr Horalek","date":"2021-01-01"},{"media_type":"image","explanation":"In the mid 19th century, one of the first photographic technologies used to record the lunar surface was the wet-plate collodion process, notably employed by British astronomer Warren De la Rue.","title":"21st Century Wet Collodion Moon","url":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO_1024.jpg","hdurl":"https://apod.nasa.gov/apod/image/2101/WetCollodionLunar112820SMO.jpg","service_version":"v1","copyright":"Mike Smolinsky","date":"2021-01-02"}]
END
}

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: 277b6829f5b9ead3987a41c723acce4f

done_testing;