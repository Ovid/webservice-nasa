package WebService::NASA::DataWalk;

# ABSTRACT: Traverse Perl data structures deterministically

# Forked from Data::Walk 2.01
# Traverse Perl data structures.
# Copyright (C) 2005-2016 Guido Flohr <guido.flohr@cantanea.com>,
# all rights reserved.

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.

# You should have received a copy of the GNU Library General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
# USA.

use v5.20.0;
use warnings;
use experimental qw( signatures );

our $VERSION   = '.1';
our $AUTHORITY = 'cpan:OVID';
use parent 'Exporter';

# This code could use a lot of cleanup, but for now, it does what
# we need. Because it's only used internally and we control what we need,
# we can get away with this.

use Scalar::Util;
use Carp qw(croak);

our @EXPORT = qw (resolve_references);

sub resolve_references ($openapi) {

    # Don't delete components because they can refer to other components
    my $components = $openapi->{components};
    __resolve( $components, $openapi );
}

sub __resolve ( $components, $resolved ) {
    return unless ref $resolved;
    if ( 'ARRAY' eq ref $resolved ) {
        foreach my $item ( $resolved->@* ) {
            __resolve( $components, $item );
        }
    }
    elsif ( 'HASH' eq ref $resolved ) {
        if ( exists $resolved->{'$ref'} ) {
            my $reference = _resolve_component( $components, delete $resolved->{'$ref'} );
            $resolved->%* = ( $reference->%*, $resolved->%* );
        }
        foreach my $key ( sort keys $resolved->%* ) {
            my $item = $resolved->{$key};
            __resolve( $components, $item );
        }
    }
}

sub _resolve_component ( $components, $ref ) {
    my ( undef, undef, $type, $name ) = split '/', $ref;
    my $reference = $components->{$type}{$name} or croak "Could not resolve $ref";
    return $reference;
}

1;

__END__

=head1 SYNOPSIS

 use WebService::NASA::DataWalk qw(resolve_references);
 resolve_references($openapi); # rewrites in place

=head1 DESCRIPTION


=cut
