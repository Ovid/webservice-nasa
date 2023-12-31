package WebService::NASA::Types;

# ABSTRACT: Type library for WebService::NASA

use v5.20.0;
use warnings;

use Type::Library
  -base,
  -declare => qw(
  Longitude
  Latitude
  Route
  );

use Type::Utils -all;
our $VERSION = '0.5';

BEGIN {
    extends qw(
      Types::Standard
      Types::Common::Numeric
      Types::Common::String
    );
}

declare Longitude, as Num, where { $_ >= -180 and $_ <= 180 };
declare Latitude,  as Num, where { $_ >= -90  and $_ <= 90 };
declare Route,     as NonEmptySimpleStr, where {
    $_ =~ m{
    ^ 
    /\w+
    (?:/\w+)*
    /?
$}x
};

__END__

=head1 DESCRIPTION

No user-serviceable parts inside.

=head1 CUSTOM TYPES

=head2 Longitude

A number between -180 and 180, inclusive.

=head2 Latitude

A number between -90 and 90, inclusive.

=head2 Route

A non-empty string that matches C<< /^\/\w+(?:\/\w+)*$/ >>.
