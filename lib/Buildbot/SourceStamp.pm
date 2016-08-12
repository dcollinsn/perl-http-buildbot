package Buildbot::SourceStamp;
use Moose;

has 'ssid'       => (is => 'rw', isa => 'Int');
has 'created_at' => (is => 'rw', isa => 'Int');
has 'branch'     => (is => 'rw', isa => 'Str');
has 'codebase'   => (is => 'rw', isa => 'Str');
has 'patch'      => (is => 'rw', isa => 'Maybe[Str]');
has 'project'    => (is => 'rw', isa => 'Str');
has 'repository' => (is => 'rw', isa => 'Str');
has 'revision'   => (is => 'rw', isa => 'Str');

1;
