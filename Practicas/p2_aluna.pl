open(FILE, '<', "p1_aluna.txt") or die $!;
foreach(<FILE>){
  if(index($_, "Host") != -1){
    $host=(split(':',$_))[1];
    chomp $host;
  }
  if($_=~ /(\d+)\/(\w+)/){
    @port_proto=split('/',$_);
    $port=$port_proto[0];
    $proto=(split(' ',$port_proto[1]))[0];
    $state=(split(' ',$_))[1];
    #print "$host,$port,$proto,$state\n";
    if($port<1024){
      $port_clas{'Bien conocidos'}+=1;
    }elsif($port>1024 and $port<49151){
      $port_clas{'Registrados'}+=1;
    }else{
      $port_clas{'Proposito general'}+=1;
    }
    $port_state{$state}+=1;
    $port_proto{$proto}+=1;
    push(@{$port_dict{$port}},$host);
    $port_count{$host}+=1;
  }
}
close(FILE);
open(FILE, '>', "p2_aluna.txt") or die $!;
foreach $key (keys %port_dict ) {
  print FILE "Puerto: $key\n\tHosts:".scalar(@{$port_dict{$key}})."\n";
}
foreach $key (keys %port_clas ) {
  print FILE "Clasificacion: $key\n\tCantidad:".$port_clas{$key}."\n";
}
foreach $key (keys %port_state ) {
  print FILE "Clasificacion: $key\n\tCantidad:".$port_state{$key}."\n";
}
foreach $key (keys %port_proto ) {
  print FILE "Clasificacion: $key\n\tCantidad:".$port_proto{$key}."\n";
}
foreach $key (keys %port_count ) {
  @lines=split(/\n/,`ping -c1 $key`);
  foreach $line (@lines){
    if($line=~ /ttl=(\d+)/){
      $OS=($1>64 and $1<128) ? 'Windows':'Linux';
      $OS= (($1>=255) ? "Desconocido" :$OS);
    }
  }
  print FILE "Host: $key\tOS:$OS\n\tPuertos activos:".$port_count{$key}."\n";
}
print "Se escribieron las estadisticas en el archivo: p2_aluna.txt\n";
close(FILE);
