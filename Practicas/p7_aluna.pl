$index=0;
sub vignere{
  $i=0;
  $j=0;
  while($i<length($_[0])){
    if($_[2] eq 'DESCIFRAR'){
      $new_char_pos=($char_to_num{substr($_[0], $i, 1)} - $char_to_num{substr($_[1], $j, 1)})%26;
    }else{
      $new_char_pos=($char_to_num{substr($_[0], $i, 1)} + $char_to_num{substr($_[1], $j, 1)})%26;
    }
    $text.=$num_to_char[$new_char_pos];
    $i+=1;
    $j=($j<length($_[1])-1) ? $j+1:0;
  }
  return $text;
}

for $char ("A".."Z"){
  $num_to_char[$index]=$char;
  $char_to_num{$char}=$index;
  $index+=1;
}
if(@ARGV){
  $plain=uc $ARGV[0];
  $key=uc $ARGV[1];
  $action=uc $ARGV[2];
  print vignere($plain,$key,$action)."\n";
}else{
  print "Texto\n";
  $plain=<STDIN>;
  chomp $plain;
  $plain=uc $plain;
  print "Llave\n";
  $key=<STDIN>;
  chomp $key;
  $key=uc $key;
  print "Cifrar o descifrar\n";
  $action=<STDIN>;
  chomp $action;
  $action=uc $action;
  print vignere($plain,$key,$action)."\n";
}
