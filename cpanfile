# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Carp" => "0";
requires "CodeGen::Protection" => "0";
requires "Cpanel::JSON::XS" => "0";
requires "Data::Dumper" => "0";
requires "Data::Walk" => "0";
requires "Exporter" => "0";
requires "File::Slurp" => "0";
requires "JSONSchema::Validator" => "0";
requires "Mojo::URL" => "0";
requires "Mojo::UserAgent" => "0";
requires "MooseX::Extended" => "0.35";
requires "MooseX::Extended::Custom" => "0";
requires "Path::Tiny" => "0";
requires "Perl::Tidy" => "0";
requires "PerlX::Maybe" => "0";
requires "String::Util" => "0";
requires "Sys::SigAction" => "0";
requires "Template" => "0";
requires "Type::Params" => "0";
requires "YAML::XS" => "0";
requires "autodie" => "0";
requires "parent" => "0";
requires "perl" => "v5.20.0";
requires "warnings" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Test::More" => "0";
  requires "Test::Most" => "0";
  requires "experimental" => "0";
  requires "lib" => "0";
  requires "strict" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::ShareDir::Install" => "0.06";
};

on 'develop' => sub {
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::More" => "0";
  requires "Test::Most" => "0";
  requires "Test::Perl::Critic" => "0";
  requires "Test::PerlTidy" => "0";
  requires "Test::Pod" => "1.41";
  requires "strict" => "0";
};
