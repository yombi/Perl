use warnings;
open(UP, '>', "up.txt") or die;
open(FILE, '<', "feed.txt") or die;
foreach(<FILE>){
  chomp ($_);
  $code=`curl -s -o /dev/null -w \'%{http_code}\' $_`;
  if($code == 200){
    print UP $_."\n";
  }
}
close(FILE);
close(UP)
