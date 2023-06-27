package WebService::NASA::Generate;

# ABSTRACT: Generate WebService::NASA modules from OpenAPI

use v5.20.0;
use warnings;
use Carp                qw(croak);
use Cpanel::JSON::XS    qw(encode_json);
use CodeGen::Protection qw(
  rewrite_code
);
use Data::Dumper;
use File::Find::Rule;
use File::Slurp qw(read_file);
use File::Spec::Functions qw(catfile);
use JSONSchema::Validator;
use Path::Tiny 'path';
use Perl::Tidy;
use String::CamelSnakeKebab qw(
  lower_snake_case
  upper_camel_case
);
use String::Util qw(trim);
use Template;
use URI;
use YAML::XS qw(Load);
use autodie  qw(:all);

use WebService::NASA::DataWalk qw(resolve_references);
use WebService::NASA::Moose types => [
    qw(
      Bool
      Enum
      HashRef
      InstanceOf
      Maybe
      NonEmptyStr
    )
];

our $VERSION   = '0.1';
our $AUTHORITY = 'cpan:OVID';

param openapi   => ( isa => Maybe [NonEmptyStr], required => 0 );
param dir       => ( isa => Maybe [NonEmptyStr], required => 0 );
param overwrite => ( isa => Bool, default => 0 );
param debug     => ( isa => Enum [ 0, 1, 2 ], default => 0 );
param write     => ( isa => Bool, default => 1 );

field _template => (
    isa     => InstanceOf ['Template'],
    default => method() { Template->new },
);
field _current_openapi => (
    isa     => Maybe [HashRef],
    writer  => '_set_current_openapi',
);
field _current_server_name => (
    isa     => Maybe [NonEmptyStr],
    writer  => '_set_current_server_name',
);
field _current_server_url => (
    isa     => Maybe [NonEmptyStr],
    writer  => '_set_current_server_url',
);

method BUILD($args) {
    if ( $self->dir && $self->openapi ) {
        croak("Cannot specify both 'dir' and 'openapi'");
    }
}

method run() {
    my @servers;
    foreach my $filename ( $self->_get_openapi_filenames ) {
        my ( $raw_yaml, $openapi, $resolved ) = $self->_get_openapi($filename);

        $self->_set_current_openapi($openapi);
        $self->_set_current_server;

        $self->_write_schema_documentation($raw_yaml);
        push @servers => $self->_write_webservice_nasa_server_module($resolved);
    }
}

method _set_current_server() {
    my $schema = $self->_current_openapi;
    my $server = $schema->{servers}[0]{url}
      or croak("No server for $schema");
    my $host  = URI->new($server)->host; 
    $host =~ s/\./_/g;
    $self->_set_current_server_name( upper_camel_case($host) );
    $self->_set_current_server_url($server);
}

method _get_openapi_filenames() {
    return $self->openapi if $self->openapi;
    my @files = File::Find::Rule->file->name( '*.yaml', '*.yml' )->in( $self->dir );
    if ( !@files ) {
        croak( "No YAML files found in " . $self->dir );
    }
    return @files;
}

method _write_webservice_nasa_server_module($resolved) {
    my $openapi = $self->_current_openapi;
    my @paths   = sort keys $resolved->{paths}->%*;

    my %endpoints;
    foreach my $path (@paths) {
        my $method_name = $self->_make_method_name($path);
        if ( $self->debug ) {
            say "Gathering data for method: $method_name";
        }

        if ( my $previous_path = $endpoints{$method_name} ) {
            croak("Duplicate method name '$method_name' generated from $path and $previous_path->{path}");
        }

        my $route = $resolved->{paths}{$path}{get};
        $endpoints{$method_name} = {
            endpoint   => $path,
            parameters => {},
            full       => $route,
        };
        PARAMETER: foreach my $parameters ( $route->{parameters}->@* ) {
            $parameters->{route} = $path;
            my $name = $parameters->{name} or do {
                say STDERR $self->_perl_to_string($parameters);
                Carp::confess("No name for $path");
            };
            say STDERR $self->_perl_to_string($parameters) if $self->debug;
            next PARAMETER if $name eq 'api_key';
            if ( exists( $endpoints{$method_name}{parameters}{$name} ) ) {
                croak("Duplicate parameters name '$name' for $path");
            }
            $endpoints{$method_name}{parameters}{$name} = $parameters;
        }
        $self->_write_test_for_method( $method_name, $endpoints{$method_name} );
    }
    my $template = $self->_template;
    $template->process(
        $self->_load_template('webservice_nasa.tt'),
        { endpoints => \%endpoints },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);

    my $server_name = $self->_current_server_name;
    my $filename = catfile( qw/lib WebService NASA Server/, "$server_name.pm" );
    $self->_write_perl( $output, $filename );

    my $server_method = lower_snake_case($server_name) . '_server';
    return {
        name      => $server_name,
        method    => $server_method,
        endpoints => \%endpoints,
    };
}

method _write_webservice_nasa_module(@servers) {
    my $template = $self->_template;
    $template->process(
        $self->_load_template('webservice_nasa.tt'),
        { servers => \@servers },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);

    my $filename = 'lib/WebService/NASA.pm';
    $self->_write_perl( $output, $filename );
}

method _write_perl( $output, $filename ) {
    my $original = -e $filename ? read_file($filename) : $output;
    if ( $self->debug ) {
        say $original ? "Writing new file $filename." : "Updating $filename";
        say $output if $self->debug > 1;
    }
    return if !$self->write;
    open my $fh, '>', $filename;
    print {$fh} $self->_protected_code( $filename, $original, $output );
    close $fh;
}

method _protected_code( $filename, $existing_code, $protected_code ) {
    return rewrite_code(
        type           => 'Perl',
        name           => $filename,
        existing_code  => $existing_code,
        protected_code => $protected_code,
        overwrite      => $self->overwrite,
    );
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
    # We use ->canonical to ensure that the output is always the same.
    state $json = Cpanel::JSON::XS->new->utf8->canonical;
    my $body = ref $response_example ? $json->encode($response_example) : $response_example;

    my $filename = "t/${method_name}.t";

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

    if ( !-e $filename ) {

        # OK, this test doesn't exist. So we need to use the test_file_new.tt
        # template to insert the test code *between* the codegen markers. This
        # allows us to insert the test code in the correct place.
        my $new_test = $output;
        $output = '';
        $template->process(
            $self->_load_template('test_file_new.tt'),
            {
                new_test => $new_test,
            },
            \$output
        ) or die $template->error;
    }
    $self->_write_perl( $output, $filename );
}

method _write_schema_documentation($raw_yaml) {
    $raw_yaml =~ s/^/    /mg;    # indent

    # Print the template results to STDOUT
    my $server_name = $self->_current_server_name;
    my $template = $self->_template;
    $template->process(
        $self->_load_template('webservice_nasa_schema.tt'),
        {
            raw_yaml => $raw_yaml,
            server_name   => $server_name,
            server_url    => $self->_current_server_url,
        },
        \my $output
    ) or die $template->error;
    $output = $self->_tidy_code($output);

    my $filename = catfile( qw/lib WebService NASA Schema/, "$server_name.pod" );
    my $original = -e $filename ? read_file($filename) : '';
    if ( $self->debug ) {
        say $original ? "Writing new file $filename." : "Updating $filename";
        say $output if $self->debug > 1;
    }
    return if !$self->write;
    open my $fh, '>', $filename;
    print {$fh} $output;
    close $fh;
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

method _get_openapi($schema) {

    # we must call this first or else we might write out invalid files
    $self->_assert_valid_schema($schema);

    open my $fh, '<', $schema;
    my $raw_yaml = do { local $/; <$fh> };
    close $fh;
    my $openapi  = Load($raw_yaml);
    my $resolved = Load($raw_yaml);

    resolve_references $resolved;
    return ( $raw_yaml, $openapi, $resolved );
}

method _assert_valid_schema($filename) {
    my $path = path($filename)->absolute;
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

method _tidy_code($code) {
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

method _load_template($filename) {
    my $path = path("templates/$filename")->absolute;
    open my $fh, '<', $path;
    my $contents = do { local $/; <$fh> };
    close $fh;
    return \$contents
}

method _make_method_name($string) {
    $string = trim( lc($string) );
    $string =~ s/[{}]//g;
    $string =~ s/\s+/_/g;
    $string =~ tr/-/_/;
    $string =~ tr/\//_/;
    $string =~ s/__*/_/g;
    $string = lower_snake_case($string);
    return "get$string";
}

__END__

=head1 SYNOPSIS

    my $generator = WebService::NASA::Generate->new(
        openapi   => $openapi,
        debug     => $debug,
        write     => $write,
        overwrite => $overwrite,
    );
    $generator->run;

=head1 DESCRIPTION

This module automatically generates the WebService::NASA modules from
OpenAPI documents in the `nasa/` directory. Update those documents and
rerun this code.

=head1 CONSTRUCTOR

There are several parameters that can be passed to the constructor. Only the
C<openapi> parameter is required.

=over 4

=item C<openapi>

The path to the OpenAPI document to use as the source of truth.

=item C<debug>

If true, the generated code will be printed to STDOUT instead of being written
to disk.

Defaults to false.

=item C<write>

If true, the generated code will be written to disk. If false, the code will be not be
written to disk.

Defaults to true.

=item C<overwrite>

Some files are generated from templates. If the file already exists and the file
checksum does not match, this code will die, telling you that. You can pass a true
value to C<overwrite> to force the file to be overwritten.

Default false.
