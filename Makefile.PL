use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'REST::Buildbot',
    AUTHOR           => q{Dan Collins <DCOLLINS@cpan.org>},
    VERSION_FROM     => 'lib/REST/Buildbot.pm',
    ABSTRACT_FROM    => 'lib/REST/Buildbot.pm',
    LICENSE          => 'gpl_3',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Moose' => 0,
        'LWP::UserAgent' => 0,
        'JSON' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'REST-Buildbot-*' },
);
