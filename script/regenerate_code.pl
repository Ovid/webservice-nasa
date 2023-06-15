#!/usr/bin/env perl

use v5.20.0;
use warnings;
use Getopt::Long;
use lib 'lib';
use WebService::NASA::Generate;

GetOptions(
    'openapi=s' => \( my $openapi   = 'nasa/openapi.yaml' ),
    'debug'     => \( my $debug     = 0 ),
    'overwrite' => \( my $overwrite = 0 ),
    'verbose'   => \( my $verbose   = 0 ),
    'write!'    => \( my $write     = 1 ),
) or die "bad options";

my $generator = WebService::NASA::Generate->new(
    openapi   => $openapi,
    debug     => $debug,
    write     => $write,
    overwrite => $overwrite,
    verbose   => $verbose,
);
$generator->run;
