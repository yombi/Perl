open(FILE, '<', "correos.txt") or die $!;
foreach(<FILE>){
  if ($_ =~ /[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+/){
    @fields = split /@/, $_;
    $hash{$fields[1]}=[$_];
  }
}
foreach $key ( keys %hash ) {
    print "Dominio: $key\n";
    foreach $domain (@{$hash{$key}}){
      print "\t$domain\n";
    }
}
close(FILE);
