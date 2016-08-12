package Buildbot::BuildRequest;
use Moose;

has 'builderid'           => (is => 'rw', isa => 'Int');
has 'buildrequestid'      => (is => 'rw', isa => 'Int');
has 'buildsetid'          => (is => 'rw', isa => 'Int');
has 'claimed_at'          => (is => 'rw', isa => 'Maybe[Int]');
has 'claimed_by_masterid' => (is => 'rw', isa => 'Maybe[Int]');
has 'complete_at'         => (is => 'rw', isa => 'Maybe[Int]');
has 'priority'            => (is => 'rw', isa => 'Int');
has 'results'             => (is => 'rw', isa => 'Int');
has 'submitted_at'        => (is => 'rw', isa => 'Int');
has 'claimed'             => (is => 'rw', isa => 'Bool');
has 'complete'            => (is => 'rw', isa => 'Bool');
has 'waited_for'          => (is => 'rw', isa => 'Bool');

1;
