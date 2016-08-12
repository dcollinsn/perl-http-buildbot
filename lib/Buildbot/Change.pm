package Buildbot::Change;
use Moose;
use Moose::Util::TypeConstraints;
use Buildbot::SourceStamp;

subtype 'SourceStamp', as 'Buildbot::SourceStamp';

coerce 'SourceStamp',
    from 'HashRef',
    via { Buildbot::SourceStamp->new(%$_) };

has 'changeid'         => (is => 'rw', isa => 'Int');
has 'when_timestamp'   => (is => 'rw', isa => 'Int');
has 'author'           => (is => 'rw', isa => 'Str');
has 'branch'           => (is => 'rw', isa => 'Str');
has 'category'         => (is => 'rw', isa => 'Maybe[Str]');
has 'codebase'         => (is => 'rw', isa => 'Str');
has 'comments'         => (is => 'rw', isa => 'Str');
has 'project'          => (is => 'rw', isa => 'Str');
has 'repository'       => (is => 'rw', isa => 'Str');
has 'revision'         => (is => 'rw', isa => 'Str');
has 'revlink'          => (is => 'rw', isa => 'Str');
has 'files'            => (is => 'rw', isa => 'ArrayRef[Str]');
has 'parent_changeids' => (is => 'rw', isa => 'ArrayRef[Str]');
has 'properties'       => (is => 'rw', isa => 'HashRef');
has 'sourcestamp'      => (is => 'rw', isa => 'SourceStamp', coerce => 1);

1;
