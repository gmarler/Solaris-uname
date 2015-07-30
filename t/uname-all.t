use strict;
use warnings;
use v5.18.1;
use feature qw(say);

use Test::Most;
use Data::Dumper;
use IPC::System::Simple   qw(capture);

use_ok( 'Solaris::uname' );

# TODO: Make this OOP eventually
# 
# can_ok( 'Solaris::uname', 'uname',
#  q{can call the uname function});

my $uhref = Solaris::uname::uname();

my $fields = {
  sysname  => '-s',
  nodename => '-n',
  release  => '-r',
  version  => '-v',
  machine  => '-m',
};

foreach my $field ( keys %$uhref ) {
  ok( exists $fields->{$field}, "Field $field exists" );
}

foreach my $field ( keys %$fields ) {
  check($field);
}

sub check {
  my $check_field = shift;

  my $cmd = "/usr/bin/uname " . $fields->{$check_field};

  my $value = capture($cmd);

  chomp $value;

  cmp_ok( $value, 'eq', $uhref->{${check_field}},
          "$value is equal to $uhref->{${check_field}}, as expected" );
  
}

done_testing();
