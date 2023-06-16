use strict;
use warnings;

use 5.020000;

use ExtUtils::MakeMaker;

use File::ShareDir::Install;
$File::ShareDir::Install::INCLUDE_DOTFILES = 1;
$File::ShareDir::Install::INCLUDE_DOTDIRS = 1;
install_share dist => "nasa";


my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl interface to NASA's public APIs",
  "AUTHOR" => "Curtis \"Ovid\" Poe <curtis.poe\@gmail.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::ShareDir::Install" => "0.06"
  },
  "DISTNAME" => "WebService-NASA",
  "LICENSE" => "artistic_2",
  "MIN_PERL_VERSION" => "5.020000",
  "NAME" => "WebService::NASA",
  "PREREQ_PM" => {
    "Carp" => 0,
    "CodeGen::Protection" => 0,
    "Cpanel::JSON::XS" => 0,
    "Data::Dumper" => 0,
    "Data::Walk" => 0,
    "Exporter" => 0,
    "File::ShareDir" => 0,
    "File::Slurp" => 0,
    "File::Spec::Functions" => 0,
    "JSONSchema::Validator" => 0,
    "Mojo::URL" => 0,
    "Mojo::UserAgent" => 0,
    "MooseX::Extended" => "0.35",
    "MooseX::Extended::Custom" => 0,
    "Path::Tiny" => 0,
    "Perl::Tidy" => 0,
    "PerlX::Maybe" => 0,
    "String::Util" => 0,
    "Sys::SigAction" => 0,
    "Template" => 0,
    "Type::Params" => 0,
    "YAML::XS" => 0,
    "autodie" => 0,
    "parent" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "experimental" => 0,
    "lib" => 0,
    "strict" => 0
  },
  "VERSION" => "0.1",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "CodeGen::Protection" => 0,
  "Cpanel::JSON::XS" => 0,
  "Data::Dumper" => 0,
  "Data::Walk" => 0,
  "Exporter" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::ShareDir" => 0,
  "File::Slurp" => 0,
  "File::Spec" => 0,
  "File::Spec::Functions" => 0,
  "JSONSchema::Validator" => 0,
  "Mojo::URL" => 0,
  "Mojo::UserAgent" => 0,
  "MooseX::Extended" => "0.35",
  "MooseX::Extended::Custom" => 0,
  "Path::Tiny" => 0,
  "Perl::Tidy" => 0,
  "PerlX::Maybe" => 0,
  "String::Util" => 0,
  "Sys::SigAction" => 0,
  "Template" => 0,
  "Test::More" => 0,
  "Test::Most" => 0,
  "Type::Params" => 0,
  "YAML::XS" => 0,
  "autodie" => 0,
  "experimental" => 0,
  "lib" => 0,
  "parent" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}
