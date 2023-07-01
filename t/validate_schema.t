#!/usr/bin/env perl

use lib 'lib', 't/lib';
use Test::Most;

use Path::Tiny qw( path );
use File::Find::Rule;
use JSONSchema::Validator;
my @files = File::Find::Rule->file->name('*.yaml')->in('nasa');
foreach my $openapi_spec (@files) {
    my $openapi = path($openapi_spec)->absolute;
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
}

done_testing;
