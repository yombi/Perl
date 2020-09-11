use warnings;
for($i=0;$i<5;$i++){
  $num=int(rand(100));
  $cmd="sed -n $num"."p up.txt";
  $site=`$cmd`;
  $code=`curl $site`;
  open(CODE, '>', "site$i.txt") or die $!;
  print CODE $code;
  close(CODE);
}
