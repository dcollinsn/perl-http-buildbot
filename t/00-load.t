#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'HTTP::Buildbot' ) || print "Bail out!\n";
}

diag( "Testing HTTP::Buildbot $HTTP::Buildbot::VERSION, Perl $], $^X" );
