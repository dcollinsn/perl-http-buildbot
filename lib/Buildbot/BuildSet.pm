package Buildbot::BuildSet;
use Moose;
use Moose::Util::TypeConstraints;
use Buildbot::SourceStamp;

subtype 'ArrayRefOfSourceStamps', as 'ArrayRef[Buildbot::SourceStamp]';

coerce 'ArrayRefOfSourceStamps',
    from 'ArrayRef[HashRef]',
    via { [ map {Buildbot::SourceStamp->new(%$_)} @$_ ] };

has 'bsid'                => (is => 'rw', isa => 'Int');
has 'complete_at'         => (is => 'rw', isa => 'Maybe[Int]');
has 'results'             => (is => 'rw', isa => 'Int');
has 'submitted_at'        => (is => 'rw', isa => 'Int');
has 'complete'            => (is => 'rw', isa => 'Bool');
has 'external_idstring'   => (is => 'rw', isa => 'Maybe[Str]');
has 'parent_buildid'      => (is => 'rw', isa => 'Maybe[Str]');
has 'parent_relationship' => (is => 'rw', isa => 'Maybe[Str]');
has 'reason'              => (is => 'rw', isa => 'Str');
has 'sourcestamps'        => (is => 'rw', isa => 'ArrayRefOfSourceStamps', coerce => 1);


1;
