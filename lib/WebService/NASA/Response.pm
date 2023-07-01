package WebService::NASA::Response;

# ABSTRACT: Response object for WebService::NASA

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

__END__

=head1 SYNOPSIS

    my $nasa = WebService::NASA->new;
    my $response = $nasa->get_neo_rest_v1_feed; # returns WebService::NASA::Response
    say $response->requests_remaining;

=head1 DESCRIPTION

This is a response object for L<WebService::NASA>. It is not intended to be instantiated directly.

=head1 METHODS

=head2 route

    say $response->route;

Returns the route used to generate the response.

=head2 is_json

    say $response->is_json;

Returns true if the response is JSON.

=head2 is_timeout

    say $response->is_timeout;

Returns true if the response timed out.

=head2 last_request_time

    say $response->last_request_time;

Returns the time of the last request as a Unix epoch.

=head2 requests_remaining

    say $response->requests_remaining;

Returns the number of requests remaining for the current hour.

=head2 content

    say $response->content;

Returns the content of the response.

If the response is JSON, this will be a data structure. Otherwise, it will be a string.
