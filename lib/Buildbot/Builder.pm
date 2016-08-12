package Buildbot::Builder;
use Moose;

has 'builderid'   => (is => 'rw', isa => 'Int');
has 'description' => (is => 'rw', isa => 'Maybe[Str]');
has 'name'        => (is => 'rw', isa => 'Str');
has 'masterids'   => (is => 'rw', isa => 'ArrayRef[Int]');
has 'tags'        => (is => 'rw', isa => 'Maybe[ArrayRef[Str]]');

1;
