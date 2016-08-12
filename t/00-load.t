#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 9;

BEGIN {
    use_ok( 'HTTP::Buildbot' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::Builder' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::Build' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::BuildRequest' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::BuildSet' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::Change' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::Log' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::SourceStamp' ) || print "Bail out!\n";
    use_ok( 'HTTP::Buildbot::Step' ) || print "Bail out!\n";
}

diag( "Testing HTTP::Buildbot $HTTP::Buildbot::VERSION, Perl $], $^X" );
