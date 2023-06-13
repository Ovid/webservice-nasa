package WebService::NASA::Generate;

use v5.20.0;
use warnings;
use Carp qw(croak);
use Data::Dumper;
use CodeGen::Protection qw(
  create_protected_code
  rewrite_code
);
use JSONSchema::Validator;
use Path::Tiny 'path';
use Perl::Tidy;
use String::Util qw(trim);
use Template;
use YAML::XS qw(Load);
use autodie  qw(:all);

use WebService::NASA::Moose types => [
    qw(
      InstanceOf
      NonEmptyStr
    )
];

param openapi => ( isa => NonEmptyStr );

field _template => (
    isa     => InstanceOf ['Template'],
    default => method() { Template->new },
);

method run() {

    # we must call this first or else we might write out invalid files
    $self->_assert_valid_schema();
    my ( $raw_yaml, $openapi ) = $self->_get_openapi;

    $self->_write_schema_module( $raw_yaml, $openapi );
    $self->_write_webservice_nasa_module($openapi);
}

method _write_webservice_nasa_module($openapi) {
    my @paths = sort keys $openapi->{paths}->%*;

    my %endpoints;
    foreach my $path (@paths) {
        my $method_name = $self->_make_method_name($path);
        if ( my $previous_path = $endpoints{$method_name} ) {
            croak("Duplicate method name '$method_name' generated from $path and $previous_path->{path}");
        }
        $endpoints{$method_name} = {
            endpoint    => $path,
            parameters  => {},
            description => $openapi->{paths}{$path}{get}{description},
        };
        foreach my $param ( $openapi->{paths}{$path}{get}{parameters}->@* ) {
            my $parameters = $self->_resolve_parameter( $openapi, $param );
            $parameters->{route} = $path;
            my $name = $parameters->{name} or croak("No name for $path");
            next if $name eq 'api_key';
            if ( exists( $endpoints{$method_name}{parameters}{$name} ) ) {
                croak("Duplicate parameters name '$name' for $path");
            }
            $endpoints{$method_name}{parameters}{$name} = $parameters;
        }
        $self->_write_test_for_method( $method_name, $endpoints{$method_name} );
    }

    # Print the template results to STDOUT
    my $template = $self->_template;
    $template->process(
        $self->_load_template('webservice_nasa.tt'),
        { endpoints => \%endpoints },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);

    open my $fh, '>', 'lib/WebService/NASA.pm';
    print {$fh} $output;
}

method _write_test_for_method( $method_name, $endpoint ) {
    my $path        = $endpoint->{endpoint};
    my $test_name   = "t/get_${method_name}.t";
    my $parameters  = $endpoint->{parameters};
    my $description = $endpoint->{description};
}


method _write_schema_module( $raw_yaml, $hashref ) {
    $raw_yaml =~ s/^/    /mg;    # indent

    # Print the template results to STDOUT
    my $template = $self->_template;
    $template->process(
        $self->_load_template('webservice_nasa_schema.tt'),
        { raw_yaml => $raw_yaml, schema => $self->_perl_to_string($hashref) },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);
    open my $fh, '>', 'lib/WebService/NASA/Schema.pm';
    print {$fh} $output;
}

method _perl_to_string ($perl) {
    local $Data::Dumper::Indent        = 1;
    local $Data::Dumper::Sortkeys      = 1;
    local $Data::Dumper::Terse         = 1;
    local $Data::Dumper::Quotekeys     = 0;
    local $Data::Dumper::Trailingcomma = 1;
    local $Data::Dumper::Deepcopy      = 1;
    return Dumper($perl);
}

method _assert_valid_schema() {
    my $path = path( $self->openapi )->absolute;
    eval {
        JSONSchema::Validator->new( resource => "file://$path" );
        1;
    } or do {

        # make sure we have a *valid* OpenAPI spec. If not, we want to die
        # immediately rather than overwriting good files with bad data.
        my $error = $@ // 'Zombie Error';
        croak "Invalid OpenAPI file: $error";
    };
}

method _get_openapi() {
    open my $fh, '<', $self->openapi;
    my $raw_yaml = do { local $/; <$fh> };
    my $hashref  = Load($raw_yaml);
    return ( $raw_yaml, $hashref );
}

method _resolve_parameter( $openapi, $parameter ) {
    return $parameter if !exists $parameter->{'$ref'};
    my $reference = delete $parameter->{'$ref'}
      or croak("parameter must have a name or a reference");
    my $components = $openapi->{'components'};
    $reference =~ s{\A.*/}{};
    return {
        $components->{parameters}{$reference}->%*,
        $parameter->%*,
    };
}

method _tidy_code($code) {
    my ( $stderr, $tidied );

    my $perltidyrc = path('.perltidyrc')->absolute;
    open my $fh, '<', $perltidyrc;
    $perltidyrc = do { local $/; <$fh> };
    close $fh;

    # need to clear @ARGV or else Perl::Tidy thinks you're trying
    # to provide a filename and dies
    local @ARGV;
    Perl::Tidy::perltidy(
        source      => \$code,
        destination => \$tidied,
        stderr      => \$stderr,
        perltidyrc  => \$perltidyrc,
    ) and die "Perl::Tidy error: $stderr";

    return $tidied;
}

method _load_template($filename) {
    my $path = path("templates/$filename")->absolute;
    open my $fh, '<', $path;
    my $contents = do { local $/; <$fh> };
    return \$contents
}

method _make_method_name($string) {
    $string = trim( lc($string) );
    $string =~ s/\s+/_/g;
    $string =~ tr/-/_/;
    $string =~ tr/\//_/;
    $string =~ s/__*/_/g;
    return "get$string";
}
