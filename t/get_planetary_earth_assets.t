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
    my $response = $nasa->get_planetary_earth_assets(
        lon  => 100.75,
        lat  => 1.5,
        date => '2014-02-01',
    );

    my $expected = {
        'date'     => '2014-02-04T03:30:01.210000',
        'id'       => 'LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204',
        'resource' => {
            'dataset' => 'LANDSAT/LC08/C01/T1_SR',
            'planet'  => 'earth'
        },
        'service_version' => 'v5000',
        'url'             =>
          'https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels'
    };
    eq_or_diff $response, $expected, 'get_planetary_earth_assets response is validated';
    is $nasa->requests_remaining, $limit_remaining, 'requests_remaining matches headers';
};

done_testing;

sub default {
    return <<'END';
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Age: 1
Connection: keep-alive
Content-Length: 346
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

{"date":"2014-02-04T03:30:01.210000","id":"LANDSAT/LC08/C01/T1_SR/LC08_127059_20140204","resource":{"dataset":"LANDSAT/LC08/C01/T1_SR","planet":"earth"},"service_version":"v5000","url":"https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/ea0061d06542c151df676804213b0e32-e13a44f7bfe19cc2a7f5c23a20921213:getPixels"}
END
}
