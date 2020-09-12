open(FILE, '>', "p1_aluna.txt") or die $!;
@lines=split(/\n/,`nmap -sP $ARGV[0]`);
$index=0;
foreach $line (@lines){
  if(index($line, "Host is up") != -1){
    @data=split(' ',$lines[$index-1]);
    push(@hosts, $data[4]);
  }
  $index++;
}
foreach $host (@hosts){
  $index=0;
  print FILE "Host: $host\nPuerto/Protocolo\tEstado\tServicio\tVersion\n";
  @nmap_scan=split(/\n/,`nmap -sV $host`);
  foreach $line (@nmap_scan){
    $index++;
    if($index<6){
      next;
    }elsif(index($line, "Service") != -1){
      last;
    }else{
      ($port_proto,$state,$service,@ver)=split(' ',$line);
      foreach $word(@ver){
        $version.="$word ";
      }
      print FILE "$port_proto\t\t\t$state\t$service\t$version\n";
    }
  }
}
print "Se escribieron las estadisticas en el archivo: p1_aluna.txt\n";
close(FILE);
