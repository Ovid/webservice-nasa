#!/usr/bin/env perl

use v5.20.0;
use warnings;
use Getopt::Long;
use lib 'lib';
use WebService::NASA::Generate;

GetOptions(
    'openapi=s' => \my $openapi,
    'dir'       => \my $dir,
    'debug=i'   => \( my $debug     = 0 ),
    'force'     => \( my $overwrite = 0 ),
    'write!'    => \( my $write     = 1 ),
) or die "bad options";

if ( !defined $dir && !defined $openapi ) {
    $dir = 'nasa';
}

my $generator = WebService::NASA::Generate->new(
    openapi   => $openapi,
    dir       => $dir,
    debug     => $debug,
    write     => $write,
    overwrite => $overwrite,
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
	--openapi   Filename    Path to the OpenAPI file to use
	--debug     [0,1,2]     Enable debugging output
	--force     -           Overwrite existing files if checksums fail
	--nowrite   -           Don't write the files

=head1 DESCRIPTION

This code is used to regenerate the WebService::NASA code from the OpenAPI
specification. Update F<nasa/openapi.yaml> and run this script to regenerate
the code.
