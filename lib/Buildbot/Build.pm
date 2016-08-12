package Buildbot::Build;
use Moose;

has 'builderid'      => (is => 'rw', isa => 'Int');
has 'buildid'        => (is => 'rw', isa => 'Int');
has 'buildrequestid' => (is => 'rw', isa => 'Int');
has 'complete_at'    => (is => 'rw', isa => 'Maybe[Int]');
has 'masterid'       => (is => 'rw', isa => 'Int');
has 'number'         => (is => 'rw', isa => 'Int');
has 'results'        => (is => 'rw', isa => 'Maybe[Int]');
has 'started_at'     => (is => 'rw', isa => 'Int');
has 'workerid'       => (is => 'rw', isa => 'Int');
has 'complete'       => (is => 'rw', isa => 'Bool');
has 'state_string'   => (is => 'rw', isa => 'Str');
has 'properties'     => (is => 'rw', isa => 'HashRef');

1;
