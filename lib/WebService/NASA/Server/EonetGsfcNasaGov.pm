package WebService::NASA::Server::EonetGsfcNasaGov;

our $VERSION   = '0.1';          ## no critic (RequireUseStrict RequireUseWarnings)
our $AUTHORITY = 'cpan:OVID';    ## no critic (RequireUseStrict RequireUseWarnings)

#<<< CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the end comment. Checksum: cc9d723a4b5af355f571a70bfb039049

# ABSTRACT: Perl interface to NASA's public APIs

use v5.20.0;
use WebService::NASA::Moose types => [
    qw(
      ArrayRef
      NonEmptyStr
      Optional
    )
];

# in theory, WebService::NASA::Role::Server can consume DelegateParams, but
# but we're getting an error that these methods are not provided, even though
# they are. It works with WebService::NASA::Server::ApiNasaGov, but not with
# WebService::NASA::Server::EonetGsfcNasaGov. I don't know why.
with qw(
  WebService::NASA::Role::DelegatedParams
  WebService::NASA::Role::Server
);

use PerlX::Maybe qw(maybe);
use Type::Params -sigs;

# Begin generated code here

method _schema_doc() {
    return 'eonet-gsfc-nasa-gov/openapi.yaml';
}

signature_for get_events => (
    method => 1,
    named  => [
        bbox     => Optional [NonEmptyStr],
        category => Optional [NonEmptyStr],
        days     => Optional [NonEmptyStr],
        end      => Optional [NonEmptyStr],
        limit    => Optional [NonEmptyStr],
        magID    => Optional [NonEmptyStr],
        magMax   => Optional [NonEmptyStr],
        magMin   => Optional [NonEmptyStr],
        source   => Optional [NonEmptyStr],
        start    => Optional [NonEmptyStr],
        status   => Optional [NonEmptyStr],
    ],
);

method get_events($query) {
    return $self->_get_response(
        route => '/events',
        query => {
            maybe bbox     => $query->{bbox},
            maybe category => $query->{category},
            maybe days     => $query->{days},
            maybe end      => $query->{end},
            maybe limit    => $query->{limit},
            maybe magID    => $query->{magID},
            maybe magMax   => $query->{magMax},
            maybe magMin   => $query->{magMin},
            maybe source   => $query->{source},
            maybe start    => $query->{start},
            maybe status   => $query->{status},
        }
    );
}

__END__

=head1 SYNOPSIS

    use WebService::NASA::Server::EonetGsfcNasaGov
    my $api = WebService::NASA::Server::EonetGsfcNasaGov->new;

=head1 DESCRIPTION

Gives acess to the endpoints at L<https://eonet.gsfc.nasa.gov/api/v3>. You probably want
C<WebService::NASA> instead, as it's the front-end for this module.

Please see L<https://api.nasa.gov> for more information. You can sign up for
a free API key there.

=head1 METHODS



=head2 C<get_events>

    my $result = $nasa->get_events(
        bbox     => $bbox,
        category => $category,
        days     => $days,
        end      => $end,
        limit    => $limit,
        magID    => $magID,
        magMax   => $magMax,
        magMin   => $magMin,
        source   => $source,
        start    => $start,
        status   => $status,
    );

Method for C</events>.

To understand what is returned, please see L<WebService::NASA::Schema::EonetGsfcNasaGov>.

Returns a list of natural events currently occurring on Earth.

Arguments:

=over 4

=item * C<bbox> 

Query using a bounding box for all events with datapoints that fall within. This uses two pairs of coordinates: the upper left hand corner (lon,lat) followed by the lower right hand corner (lon,lat).

Optional.

=item * C<category> 

Category of each earth event

Optional.

=item * C<days> 

The maximum number of days to return

Optional.

=item * C<end> 

The end date of the events

Optional.

=item * C<limit> 

The maximum number of events to return

Optional.

=item * C<magID> 

EONET Event Magnitudes

Optional.

=item * C<magMax> 

The maximum magnitude of the events

Optional.

=item * C<magMin> 

The minimum magnitude of the events

Optional.

=item * C<source> 

Source of each earth event

Optional.

=item * C<start> 

The start date of the events

Optional.

=item * C<status> 

Status of each earth event

Optional.

=back

=head1 SEE ALSO

The unofficial NASA OpenAPI specification can be found at
L<https://github.com/Ovid/nasa-openapi>.

#>>> CodeGen::Protection::Format::Perl 0.06. Do not touch any code between this and the start comment. Checksum: cc9d723a4b5af355f571a70bfb039049