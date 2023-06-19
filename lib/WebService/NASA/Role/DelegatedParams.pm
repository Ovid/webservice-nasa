package WebService::NASA::Role::DelegatedParams;

use WebService::NASA::Moose::Role;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

# ABSTRACT: Delegated parameters for WebService::NASA

use v5.20.0;
use WebService::NASA::Types qw(
  Bool
  NonEmptyStr
  PositiveInt
);

param [qw/debug strict/] => (
    isa     => Bool,
    default => 0,
);

param [qw/validate_request validate_response/] => (
    isa     => Bool,
    default => 1,
);

param timeout => (
    isa     => PositiveInt,
    default => 30,
);

param _api_key => (
    isa      => NonEmptyStr,
    lazy     => 1,
    init_arg => 'api_key',
    default  => method() { $ENV{NASA_API_KEY} // 'DEMO_KEY' },
);

