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

__END__

=head1 NAME

regenerate_code.pl - Regenerate the WebService::NASA code

=head1 SYNOPSIS

	regenerate_code.pl [options]

	Options:

	Option      Argument	Description
	------      --------	-----------
	--openapi   Filename    Path to the OpenAPI file to use (defaults to nasa/openapi.yaml)
	--debug     -           Enable debugging output
	--overwrite -           Overwrite existing files if 
	--verbose   -           Enable verbose output
	--nowrite   -           Don't write the files

=head1 DESCRIPTION

This code is used to regenerate the WebService::NASA code from the OpenAPI
specification. Update F<nasa/openapi.yaml> and run this script to regenerate
the code.
