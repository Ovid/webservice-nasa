package WebService::NASA::Generate;

use v5.20.0;
use warnings;
use Carp             qw(croak);
use Cpanel::JSON::XS qw(encode_json);
use Data::Dumper;
use Data::Walk qw(walk);
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
    my ( $raw_yaml, $openapi, $resolved ) = $self->_get_openapi;

    $self->_write_schema_module( $raw_yaml, $openapi );
    $self->_write_webservice_nasa_module($resolved);
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
            full        => $openapi->{paths}{$path}{get},
        };
        foreach my $parameters ( $openapi->{paths}{$path}{get}{parameters}->@* ) {
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
    my $path       = $endpoint->{endpoint};
    my $parameters = $endpoint->{parameters};

    # Currenty, I don't know of any NASA APIs that return anything other than
    # a single content type. However, the OpenAPI spec allows for multiple
    # content types, so this is fragile. Hence, we warn.
    my @content_types = keys $endpoint->{full}{responses}{200}{content}->%*;
    if ( @content_types > 1 ) {
        my $content_types = join ', ', @content_types;
        warn "Multiple content types for $path: $content_types";
        return;
    }
    my $content_type     = $content_types[0];
    my $response_content = $endpoint->{full}{responses}{200}{content}{$content_type};
    my $response_example = $response_content->{example};

    # ok, we didn't have a single example, but we have might have multiple
    # examples. APOD does this because it might return a list of objects or
    # single object
    if ( !$response_example ) {
        my $optional_responses = $response_content->{schema}{anyOf} // $response_content->{schema}{oneOf};
        if ($optional_responses) {
            RESPONSE: foreach my $optional_response ( $optional_responses->@* ) {
                if ( $optional_response->{example} ) {
                    $response_example = $optional_response->{example};
                    last RESPONSE;
                }
            }
        }
        if ( !$response_example ) {
            warn "No response example for $path";
            return;
        }
    }

    # Print the template results to STDOUT
    my $template = $self->_template;

    # Mojo::JSON encode_json always escapes the forward slash to prevent XSS
    # attacks. However, that causes the code to think the response is a string
    # and not JSON. I have not yet debugged why, so we are using Cpanel::JSON::XS
    # instead.
    my $body = ref $response_example ? encode_json($response_example) : $response_example;
    $template->process(
        $self->_load_template('test_file.tt'),
        {
            method            => $method_name,
            expected_response => $self->_perl_to_string($response_example),
            body              => $body,
            content_type      => $content_type,
            content_length    => length($body),
            parameters        => $parameters,
        },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);

    open my $fh, '>', "t/${method_name}.t";
    print {$fh} $output;
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

method _perl_to_string($perl) {
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
    my $openapi  = Load($raw_yaml);
    my $resolved = Load($raw_yaml);

    # resolve all references
    walk sub {
        return unless '$ref' eq $_;
        unless ( 'HASH' eq $Data::Walk::type ) {
            croak "Expected HASH, got " . ref $Data::Walk::type;
        }
        my $container = $Data::Walk::container;
        my $ref       = delete $container->{'$ref'};
        my ( undef, undef, $type, $name ) = split '/', $ref;
        my $reference = $openapi->{components}{$type}{$name} or croak "Could not resolve $ref";

        # Replace all $ref entries with the corresponding component value
        # strictly speaking, this is a spec violation. OpenAPI 3.0.0 says that
        # a $ref replaces all siblings. They're allowed to be defined, but
        # they're simply discarded (not helpful!). OpenAPI 3.0.1 allgedly has
        # support for keeping siblings, but we're not there yet.
        $container->%* = ( $reference->%*, $container->%* );
      },
      $resolved;
    return ( $raw_yaml, $openapi, $resolved );
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
