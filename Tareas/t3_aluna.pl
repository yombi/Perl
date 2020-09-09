use strict;
use warnings;

if (@ARGV){
  my $var=1;
  my $num=($ARGV[0]%2==0 ? int($ARGV[0]/2-1) : int($ARGV[0]/2));
  while ($var!=int($ARGV[0]/2+1)){
    print " "x$num ."*"x$var . "\n";
    $var++;
  }
  $var=1;
  print"*"x$ARGV[0] ."\n";
  while ($var!=int($ARGV[0]/2+1)){
    print " "x$var ."*"x($ARGV[0]-$var*2) . "\n";
    $var++;
  }
}else{
  print "Usage -> perl code.pl #number\n";
}
