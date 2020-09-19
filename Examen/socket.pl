use IO::Socket::INET;
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
sub calc{
  $opc=$_[0];
  chomp $opc;
  if(index($opc, "+") != -1){
    @nums = split('\+', $opc);
    $res= sum($nums[0],$nums[1]);
    return $res;
  }elsif(index($opc, "-") != -1){
    @nums = split('\-', $opc);
    $res= res($nums[0],$nums[1]);
    return $res;
  }elsif(index($opc, "*") != -1){
    @nums = split('\*', $opc);
    $res= multi($nums[0],$nums[1]);
    return $res;
  }elsif(index($opc, "/") != -1){
    @nums = split('\/', $opc);
    $res= div($nums[0],$nums[1]);
    return $res;
  }
}

my $socket = new IO::Socket::INET(
	PeerAddr => '164.90.148.203',
	PeerPort => '9733',
	Proto => 'tcp',
) or die $!;


my $op="";
defined $socket->recv($op,1024) or die "recv: $!";
$socket->send(calc($op));
print "$op\n";
defined $socket->recv($op,1024) or die "recv: $!";
print "$op\n";
close($socket);
