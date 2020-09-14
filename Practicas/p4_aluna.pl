=for comment
use Data::Dump qw(dump);
open(FILE, '>', "p4_aluna.txt") or die $!;
sub crawler{
  $ref = $_[0];
  $site=@_[1];
  $level=@_[2];
  if($level>2 or exists($ref->{$site})){
    return;
  }
  $ref->{$site}=1;
  print "Entrando a $site\nValor de level=$level\n";
  @code = split(/\n/,`wget -qO- $site`);
  @link = grep(/<a.*href=.*>/,@code);
  foreach $line (@link){
    if($line =~ /<a.*href="([\s\S]+?)".*>/){
      unless($1 eq "#"){
        if(index($1, "/") == 0){
          next;
          #$url=$site.(split('/',$1))[1].$1;
        }else{
          $url=$1;
        }
        push(@urls,$1);
        print"\t"x$level;
        print"$url\n";
      }
    }
  }
  foreach (@urls){
    print"for para $_\n";
    crawler($ref,$_,$level+1);
  }
}
crawler(\%visited,$ARGV[0],1);
dump(%visited);
close(FILE);
DECIDI DEJAR ESTE INENTO POR QUE SOLO HACIA LA RECURSIVIDAD UNA VEZ Y NO ENCONTRÉ SOLOCUIÓN
=cut
open(FILE, '>', "p4_aluna.txt") or die $!;
$site=$ARGV[0];
if (substr($site,-1) eq "/"){
  $site=substr($site,0,-1);
}
@code = split(/\n/,`wget -qO- $site`);
@link = grep(/<a.*href=.*>/,@code);
foreach $line (@link){

  if($line =~ /<a.*href="([\s\S]+?)".*>/){
    if(index($1, "#") != 0){
      if(index($1, "/") == 0){
        $url=$site.$1;
      }else{
        $url=$1;
      }
      push(@urls,$url);
    }
  }
}

print FILE "$site:\n";
foreach (@urls){
  print FILE "\t$_ :\n";
  @code = split(/\n/,`wget -qO- $_`);
  @link = grep(/<a.*href=.*>/,@code);
  foreach $line (@link){
    if (substr($line,-1) eq "/"){
      $line=substr($line,0,-1);
    }
    if($line =~ /<a.*href="([\s\S]+?)".*>/){
      if(index($1, "#") != 0){
        if(index($1, "/") == 0){
          $url=$_.$1;
        }else{
          $url=$1;
        }
        print FILE "\t\t$url\n";
      }
    }
  }
}
close(FILE);
