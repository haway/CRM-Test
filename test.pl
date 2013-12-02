#!/usr/bin/perl

use Data::Dumper;
use XML::Simple;

my %jconfig;

$jconfig = {
      'logdir'        => '/var/log/foo/',
      'debugfile'     => '/tmp/foo.debug',
      'server'        => {
          'sahara'        => {
              'osversion'     => '2.6',
              'osname'        => 'solaris',
              'address'       => [ '10.0.0.101', '10.0.1.101' ]
          },
          'gobi'          => {
              'osversion'     => '6.5',
              'osname'        => 'irix',
              'address'       => [ '10.0.0.102' ]
          },
          'kalahari'      => {
              'osversion'     => '2.0.34',
              'osname'        => 'linux',
              'address'       => [ '10.0.0.103', '10.0.1.103' ]
          }
      }
};

print $jconfig->{'logdir'}, "\n";

my $jj = XMLin( '2xml.simple', 
		KeyAttr => { server => 'id' },
		ForceArray => [ 'ip', 'use', 'owner' ] );

print Dumper( $jj );

foreach my $sn ( sort keys $$jj{'server'} ){
	print $sn, "\n";
	PrintOwner( $jj->{'server'}->{ $sn } );
}


sub PrintOwner{
	my @Owner = @_;
	print Dumper( @Owner );

}

