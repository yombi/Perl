use IO::Socket::INET;

my $socket = new IO::Socket::INET(
	PeerAddr => '164.90.148.203',
	PeerPort => '10101',
	Proto => 'tcp',
) or die $!;

while (1){
	my $menu="";
	defined $socket->recv($menu,1024) or die "recv: $!";
	print"$menu\n";
	my $entrada=<STDIN>;
	chomp($entrada);
	$socket->send($entrada);
}
