#!perl
use strict;
use warnings;
use ExtUtils::MakeMaker;
WriteMakefile(
	      NAME         => 'Net::Cassandra::Easy',
	      VERSION_FROM => 'lib/Net/Cassandra/Easy.pm',
	      ABSTRACT     => 'Easy to use interface to Cassandra',
	      AUTHOR       => 'Ted Zlatanov <tzz@lifelogs.com>',
	      LICENSE      => 'perl',
	      PREREQ_PM    =>
	      {
	       'Moose'                     => '0',
	       'Class::Accessor'           => '0',
	       'Bit::Vector'               => '0',
	       'Time::HiRes'               => '0',
	       'Term::ReadLine'            => '0',
	       'Hash::Merge'               => '0',
	       'Modern::Perl'              => '0',
	      },
              EXE_FILES => [ 'cassidy.pl' ],
	     );

