package WebService::NASA::Generator::Utils;

# ABSTRACT: Traverse Perl data structures deterministically

use v5.20.0;
use warnings;
use experimental            qw(signatures);
use Clone                   qw(clone);
use Carp                    qw(croak);
use Data::Dumper            qw(Dumper);
use CodeGen::Protection     qw(rewrite_code);
use Path::Tiny              qw(path);
use String::Util            qw(trim);
use String::CamelSnakeKebab qw(
  lower_snake_case
);

use Markdown::Pod;
use Feature::Compat::Try;
use Perl::Tidy;
use autodie qw(:all);
use parent  qw(Exporter);

our $VERSION   = '.1';
our $AUTHORITY = 'cpan:OVID';
our @EXPORT_OK = qw(
  make_method_name
  perl_to_string
  protect_code
  preprocess_openapi
  tidy_code
);

sub preprocess_openapi ($openapi) {
    my $cloned = clone($openapi);

    # Don't delete components because they can refer to other components
    my $components = $cloned->{components};
    _recursively_find_references( $components, $cloned );
    return $cloned;
}

sub _recursively_find_references ( $components, $resolved ) {
    return unless ref $resolved;
    if ( 'ARRAY' eq ref $resolved ) {
        foreach my $item ( $resolved->@* ) {
            _recursively_find_references( $components, $item );
        }
    }
    elsif ( 'HASH' eq ref $resolved ) {
        if ( exists $resolved->{'$ref'} ) {
            my $reference = _resolve_reference( $components, delete $resolved->{'$ref'} );
            $resolved->%* = ( $reference->%*, $resolved->%* );
        }
        if ( exists $resolved->{description} ) {
            state $markdown = Markdown::Pod->new;
            $resolved->{description} = $markdown->markdown_to_pod( markdown => $resolved->{description} );

            # markdown_to_pod adds a newline at the end
            chomp $resolved->{description};
        }
        foreach my $key ( sort keys $resolved->%* ) {
            my $item = $resolved->{$key};
            _recursively_find_references( $components, $item );
        }
    }
}

sub _resolve_reference ( $components, $ref ) {
    my ( undef, undef, $type, $name ) = split '/', $ref;
    return $components->{$type}{$name} || croak "Could not resolve $ref";
}

sub make_method_name ($string, $prefix='') {
    $string = trim( lc($string) );
    $string =~ s/[{}]//g;
    $string =~ s/\s+/_/g;
    $string =~ tr/-/_/;
    $string =~ tr/\//_/;
    $string =~ s/__*/_/g;
    $string = lower_snake_case($string);
    return "$prefix$string";
}

sub perl_to_string ($perl) {
    local $Data::Dumper::Indent        = 1;
    local $Data::Dumper::Sortkeys      = 1;
    local $Data::Dumper::Terse         = 1;
    local $Data::Dumper::Quotekeys     = 0;
    local $Data::Dumper::Trailingcomma = 1;
    local $Data::Dumper::Deepcopy      = 1;
    return Dumper($perl);
}

sub protect_code ( $filename, $existing_code, $protected_code, $overwrite ) {
    try {
        return rewrite_code(
            type           => 'Perl',
            name           => $filename,
            existing_code  => $existing_code,
            protected_code => $protected_code,
            overwrite      => $overwrite,
        );
    }
    catch ($error) {
        Carp::confess("Could not process changes to $filename: $error");
    }
}

sub tidy_code ($code) {
    my ( $stderr, $tidied );

    my $perltidyrc = path('.perltidyrc')->absolute;
    open my $fh, '<', $perltidyrc;
    $perltidyrc = do { local $/; <$fh> };
    close $fh;

    local @ARGV = ();
    Perl::Tidy::perltidy(
        source      => \$code,
        destination => \$tidied,
        stderr      => \$stderr,
        perltidyrc  => \$perltidyrc,
    ) and die "Perl::Tidy error: $stderr";

    return $tidied;
}

1;

__END__

=head1 SYNOPSIS

 use WebService::NASA::Generator::Utils qw(preprocess_openapi);
 my $processed = preprocess_openapi($openapi);

=head1 DESCRIPTION


=cut
