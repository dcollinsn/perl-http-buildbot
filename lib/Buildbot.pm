package Buildbot;
use Moose;
use Buildbot::Change;
use Buildbot::BuildSet;
use Buildbot::BuildRequest;
use Buildbot::Build;
use Buildbot::Builder;
use Buildbot::Step;
use Buildbot::SourceStamp;
use Buildbot::Log;
use LWP::UserAgent;
use JSON;

has 'url' => (is => 'rw', isa => 'Str', required => 1);
has 'ua' => (is => 'rw', isa => 'LWP::UserAgent',
             default => sub {LWP::UserAgent->new});
has 'builders' => (is => 'ro', isa => 'HashRef[Buildbot::Builder]',
                   lazy => 1, builder => '_build_builders');

sub _get {
    my $self = shift;
    my $query = shift;

    my $res = $self->ua->get($self->url.$query);
    die $res->status_line unless $res->is_success;

    my $content = $res->decoded_content;
    my $ret = decode_json($content);

    return $ret;
}

sub _build_builders {
    my $self = shift;

    my $data = $self->_get('builders');

    my $ret = {};

    foreach my $b (@{$data->{'builders'}}) {
        $ret->{$b->{'builderid'}} = Buildbot::Builder->new(%$b);
    }

    return $ret;
}

# Returns an arrayref of Buildbot::Change objects
sub get_changes {
    my $self = shift;
    die "unimplemented";
}

# Returns an arrayref of Buildbot::BuildSet objects
sub get_buildsets {
    my $self = shift;
    die "unimplemented";
}

# Returns an arrayref of Buildbot::BuildSet objects
sub get_buildsets_by_revision {
    my $self = shift;
    my $rev = shift || die "get_buildsets_by_revision requires a revision";

    my $data = $self->_get('buildsets');

    my $ret = [];

    foreach my $bs (@{$data->{'buildsets'}}) {
        push @$ret, Buildbot::BuildSet->new(%$bs);
    }

    return $ret;
}

# Returns an arrayref of Buildbot::BuildRequest objects
sub get_buildrequests_by_buildset {
    my $self = shift;
    my $set = shift || die "get_buildrequests_by_buildset requires a buildset id";

    my $data = $self->_get('buildrequests?buildsetid='.$set);

    my $ret = [];

    foreach my $br (@{$data->{'buildrequests'}}) {
        push @$ret, Buildbot::BuildRequest->new(%$br);
    }

    return $ret;
}

# Returns an arrayref of Buildbot::Build objects
sub get_builds_by_buildrequest {
    my $self = shift;
    my $request = shift || die "get_builds_by_buildrequest requires a buildrequest id";

    my $data = $self->_get('builds?buildrequestid='.$request);

    my $ret = [];

    foreach my $b (@{$data->{'builds'}}) {
        push @$ret, Buildbot::Build->new(%$b);
    }

    return $ret;
}

# Returns a Buildbot::BuildRequest object
sub get_buildrequest_by_id {
    my $self = shift;
    my $id = shift || die "get_buildrequest_by_id requires a buildrequest id";

    my $data = $self->_get('buildrequests/'.$id);

    my $ret = Buildbot::BuildRequest->new(%{$data->{'buildrequests'}->[0]});

    return $ret;
}

# Returns a Buildbot::BuildSet object
sub get_buildset_by_id {
    my $self = shift;
    my $id = shift || die "get_buildset_by_id requires a buildset id";

    my $data = $self->_get('buildsets/'.$id);

    my $ret = Buildbot::BuildSet->new(%{$data->{'buildsets'}->[0]});

    return $ret;
}

# Returns an arrayref of Buildbot::Change objects
sub get_changes_by_revision {
    my $self = shift;
    my $rev = shift || die "get_changes_by_revision requires a revision string";

    my $data = $self->_get('changes?revision='.$rev);

    my $ret = [];

    foreach my $c (@{$data->{'changes'}}) {
        push @$ret, Buildbot::Change->new(%$c);
    }

    return $ret;
}

# Returns a single Buildbot::Builder object
sub get_builder_by_id {
    my $self = shift;
    my $id = shift || die "get_builder_by_id requires a builder id";

    return $self->builders->{$id};
}

# Returns a single Buildbot::Builder object
sub get_builder_by_name {
    my $self = shift;
    my $name = shift || die "get_builder_by_name requires a builder name";

    my @res = grep {$_->name eq $name} values %{$self->builders};
    die "ambiguous builder name $name" if @res > 1;
    die "no such builder name $name" if @res == 0;
    my $ret = $res[0];

    return $ret;
}

# Returns an arrayref of Buildbot::Step objects
sub get_steps_by_build {
    my $self = shift;
    my $id = shift || die "get_steps_by_build requires a build id";

    my $data = $self->_get('builds/'.$id.'/steps');

    my $ret = [];

    foreach my $s (sort {$a->{'number'} <=> $b->{'number'}}
                        @{$data->{'steps'}}
    ) {
        push @$ret, Buildbot::Step->new(%$s);
    }

    return $ret;
}

# Returns an arrayref of Buildbot::Log objects
sub get_logs_by_step {
    my $self = shift;
    my $id = shift || die "get_logs_by_step requires a step id";

    my $data = $self->_get('steps/'.$id.'/logs');

    my $ret = [];

    foreach my $l (sort {$a->{'logid'} <=> $b->{'logid'}}
                        @{$data->{'logs'}}
    ) {
        push @$ret, Buildbot::Log->new(%$l);
    }

    return $ret;
}

# Returns the log content as a string
sub get_log_text {
    my $self = shift;
    my $id = shift || die "get_log_text requires a log id";

    my $res = $self->ua->get($self->url.'logs/'.$id.'/raw');
    die $res->status_line unless $res->is_success;

    my $ret = $res->decoded_content;

    return $ret;
}

# Returns a Buildbot::Build object
sub get_build_by_builder_and_number {
    my $self = shift;
    my $builder = shift ||
        die "get_build_by_builder_and_number requires a builder object";
    my $buildnum = shift ||
        die "get_build_by_builder_and_number requires a build number";

    my $builderid = $builder->builderid;

    my $data = $self->_get('builders/'.$builderid.'/builds/'.$buildnum);

    my $ret = Buildbot::Build->new(%{$data->{'builds'}->[0]});

    return $ret;
}

1;
