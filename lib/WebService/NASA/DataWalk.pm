package WebService::NASA::DataWalk;

# ABSTRACT: Traverse Perl data structures deterministically

use v5.20.0;
use warnings;
use experimental qw( signatures );
use Storable 'dclone';
use Carp qw(croak);
use parent 'Exporter';

our $VERSION   = '.1';
our $AUTHORITY = 'cpan:OVID';
our @EXPORT_OK = qw(resolve_references);

sub resolve_references ($openapi) {
    my $cloned = dclone($openapi);

    # Don't delete components because they can refer to other components
    my $components = $cloned->{components};
    __resolve( $components, $cloned );
    return $cloned;
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
