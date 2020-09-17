use warnings;
use IO::Socket;
use lib './';
use Calculadora;
my @num=();

$socket = new IO::Socket::INET (
	LocalHost => '127.0.0.1',
	LocalPort=>'12345',
	Proto=> 'tcp',
	Listen=>1,
	Reuse=>1,
) or die $!;
	$new_socket = $socket->accept();
	$new_socket->send("e16_sockets.\n");
while(1){
	my $entrada="";
	$new_socket->recv($entrada,1024);
	if($entrada =~ /^\d+\s+[-\+\*\/x]{1}\s+[-]?\d+/){
        	@operacion=split /\s+/,$entrada;
		@num=();
		$res=0;
        	push @num,$operacion[0];
        	push @num,$operacion[2];
        	if($operacion[1] eq "+"){
                	$new_socket->send("$entrada = ".Calculadora::suma(@num));
        	}
        	elsif($operacion[1] eq "-"){
                	$new_socket->send("$entrada = ".Calculadora::resta(@num));
        	}
        	elsif($operacion[1] eq "x" || $operacion[1] eq "\*"){
                	$res= Calculadora::mul(@num);
                	$new_socket->send("$entrada = ".Calculadora::mul(@num));
        	}
        	elsif($operacion[1] eq "\/"){
            $new_socket->send("$entrada = ".Calculadora::div(@num));
        	}
	}
}
close($socket);
