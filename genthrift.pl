#!/usr/bin/perl
# $Id$

use warnings;
use strict;
use Data::Dumper;
use Modern::Perl;

my $ifile = 'cassandra.thrift';
my $url = "http://svn.apache.org/repos/asf/cassandra/trunk/interface/$ifile";
say "Retrieving $ifile";
system(svn => export => $url) && die "Couldn't retrieve $ifile: $!";

say "Generating Thrift glue from $ifile";
system(thrift => '--gen' => perl => $ifile) && die "Couldn't generate the Thrift classes: $!";

say "Rewriting Thrift glue";
system "perl -p -i -e 's/Cassandra::/Net::GenCassandra::/g; s/Thrift::TException/Net::GenThrift::Thrift::TException/g; s/use Thrift/use Net::GenThrift::Thrift/g' gen-perl/Cassandra/*.pm";
system "/bin/cp gen-perl/Cassandra/*.pm lib/Net/GenCassandra/";
