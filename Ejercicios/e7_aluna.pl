use warnings;
%hash;
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
close(FILE);
