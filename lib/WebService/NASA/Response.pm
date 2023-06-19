package WebService::NASA::Response;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

use v5.20.0;

use WebService::NASA::Moose types => [
    qw(
      ArrayRef
      Bool
      HashRef
      PositiveOrZeroInt
      Str
      Undef
    )
];
use WebService::NASA::Types qw(
  Route
);

param route              => ( isa => Route );
param is_json            => ( isa => Bool );
param is_timeout         => ( isa => Bool );
param last_request_time  => ( isa => PositiveOrZeroInt );
param requests_remaining => ( isa => PositiveOrZeroInt );
param content            => ( isa => Str | ArrayRef | HashRef | Undef );
