use warnings;
use strict;
open (FILE,"<",$ARGV[0]);
my $zero=0;
my $lines=0;
my $one=0;
foreach(<FILE>){
  chomp $_;
  $one=0;
  for(my $i=0;$i<length($_);$i++){
    $zero+=(substr($_, $i, 1)eq '0')?1:0;
    $one+=substr($_, $i, 1);
  }
  $lines+=($one%2==0 or $zero%3==0)?1:0;
}
print "$lines\n";
