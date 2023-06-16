#!/usr/bin/env perl

use lib 'lib', 't/lib';
use Test::Most;

use Path::Tiny            qw( path );
use File::Spec::Functions qw( catfile );
use JSONSchema::Validator;
my $openapi = path( catfile( 'nasa', 'openapi.yaml' ) )->absolute;

my $schema;
lives_ok {
    $schema = JSONSchema::Validator->new( resource => "file://$openapi" );
}
'Creating our schema lived';

my $expected = [
    'components',
    'info',
    'openapi',
    'paths',
    'servers',
    'tags'
];
eq_or_diff [ sort keys $schema->schema->%* ], $expected, '... and it looks sane';

done_testing;
