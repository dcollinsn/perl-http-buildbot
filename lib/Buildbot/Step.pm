package Buildbot::Step;
use Moose;

has 'buildid'      => (is => 'rw', isa => 'Int');
has 'complete_at'  => (is => 'rw', isa => 'Int');
has 'number'       => (is => 'rw', isa => 'Int');
has 'results'      => (is => 'rw', isa => 'Int');
has 'started_at'   => (is => 'rw', isa => 'Int');
has 'stepid'       => (is => 'rw', isa => 'Int');
has 'complete'     => (is => 'rw', isa => 'Bool');
has 'hidden'       => (is => 'rw', isa => 'Bool');
has 'name'         => (is => 'rw', isa => 'Str');
has 'state_string' => (is => 'rw', isa => 'Str');
has 'urls'         => (is => 'rw', isa => 'ArrayRef');

1;
