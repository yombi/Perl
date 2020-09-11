use warnings;
sub sum{
  return $_[0]+$_[1];
}
sub res{
  return $_[0]-$_[1];
}
sub multi{
  return $_[0]*$_[1];
}
sub div{
  return $_[0]/$_[1];
}
while($opc=<STDIN>){
  chomp $opc;
  if(index($opc, "+") != -1){
    @nums = split('\+', $opc);
    $res= sum($nums[0],$nums[1]);
    print "$res\n";
  }elsif(index($opc, "-") != -1){
    @nums = split('\-', $opc);
    $res= res($nums[0],$nums[1]);
    print "$res\n";
  }elsif(index($opc, "*") != -1){
    @nums = split('\*', $opc);
    $res= multi($nums[0],$nums[1]);
    print "$res\n";
  }elsif(index($opc, "/") != -1){
    @nums = split('\/', $opc);
    $res= div($nums[0],$nums[1]);
    print "$res\n";
  }elsif($opc eq "historial"){
    foreach $key (keys %historial){
      print $key ."=". $historial{$key}."\n";
    }
  }elsif($opc eq "salir"){
    last
  }
  $historial{"$opc"}=$res;
}
print "Adios\n";
