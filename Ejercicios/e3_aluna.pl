#use strict;
use warnings;
my %historial;
while(my $opc=<STDIN>){
  chomp $opc;
  print"------ $opc\n";
  if(index($opc, "+") != -1){
    my @nums = split('\+', $opc);
    my $res= int($nums[0])+int($nums[1]);
    print "$res\n";
  }elsif(index($opc, "-") != -1){
    my @nums = split('\-', $opc);
    my $res= int($nums[0])-int($nums[1]);
    print "$res\n";
  }elsif(index($opc, "*") != -1){
    my @nums = split('\*', $opc);
    my $res= int($nums[0])*int($nums[1]);
    print "$res\n";
  }elsif(index($opc, "/") != -1){
    my @nums = split('\/', $opc);
    my $res= int($nums[0])/int($nums[1]);
    print "$res\n";
  }elsif($opc eq "historial"){
    foreach $key (keys %historial){
      print $key ."=". $historial{$key}."\n";
    }
  }elsif($opc eq "salir"){
    last
  }
  $historial{"$opc"}=$res;
  print $historial{"$opc"}."\n";
}
print "Adios\n";
