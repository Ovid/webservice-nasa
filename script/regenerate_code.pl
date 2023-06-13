#!/usr/bin/env perl

use lib 'lib';
use WebService::NASA::Generate;
my $generator =
  WebService::NASA::Generate->new( openapi => 'nasa/openapi.yaml', );
$generator->run;
