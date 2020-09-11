use warnings;
open(FILE, '<', "up.txt") or die;
foreach(<FILE>){
  @fields = split /\//, $_;
  $domain=$fields[2];
  if(exists($hash{$domain})){
    push(@{$hash{$domain}}, $_);
  }else{
    $hash{$domain}=[];
    push(@{$hash{$domain}}, $_);
  }
}
print "Elementos ordenados de mayor a menor:\n";
foreach $key ( sort { scalar(@{$hash{$b}}) <=> scalar(@{$hash{$a}}) } keys %hash ) {
    print "Dominio: $key\n";
}
close(FILE);
