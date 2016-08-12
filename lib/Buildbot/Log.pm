package Buildbot::Log;
use Moose;

has 'logid'     => (is => 'rw', isa => 'Int');
has 'num_lines' => (is => 'rw', isa => 'Int');
has 'stepid'    => (is => 'rw', isa => 'Int');
has 'complete'  => (is => 'rw', isa => 'Bool');
has 'name'      => (is => 'rw', isa => 'Str');
has 'slug'      => (is => 'rw', isa => 'Str');
has 'type'      => (is => 'rw', isa => 'Str');

1;
