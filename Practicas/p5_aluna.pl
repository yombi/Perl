#!/usr/bin/perl
=encoding UTF-8
=head1 NAME
p5_aluna.pl - Calculadora cientifica.
=head1 SYNOPSIS
  > perl p5_aluna.pl [n op m....]
=head2 EXAMPLES
  # 1 + 2 + ( ( 5 * sin 25 ) / 5 / 10 ) - 3 ! - ( sqrt 4 + 3 ^ 5 )
  > perl p5_aluna.pl 1 + 2 + ( ( 5 * s 25 ) / 5 / 10 ) -  f 3 - (  4 r 2 + 3 p 5 )
  # ( ( 2 + 1 ) * 3 ) !
  > perl p5_aluna.pl f ( ( 2 + 1 ) * 3 )
=head1 DESCRIPTION
Este script permite realizar operaciones que haría una calculadora cientifica simple.
Soporta las operaciones de:
-Suma,Resta
-Multiplicación,división
-Potencia n-esima(m p n), raíz n-esima(m r n)
-Factorial(f n)
-Seno(s),coseno(c),tangente(t),cotangente(z)
=head1 LICENSE
Este script fue creado bajo una licencia artística.
Ver L<perlartistic>.
=head1 AUTHOR
Abraham Ivan Luna Castañeda - PBSI 14G
=cut
use Data::Dump qw(dump);
use Math::Trig;
sub jeraq{
  $op=$_[0];
  if ($op eq "+" or $op eq "-"){
    return 1;
  }elsif ($op eq "*" or $op eq "/" or $op eq "f"){
    return 2;
  }elsif ($op eq "r" or $op eq "p"){
    return 3;
  }elsif($op eq 's' or $op eq 'c' or $op eq 't' or $op eq 'z'){
    return 3;
  }
  return 0;
}
sub applyOp{
  $a=$_[0];
  $b=$_[1];
  $op=$_[2];
  if ($op eq '+'){
    return $a + $b;
  }
  if ($op eq '-'){
    return $a - $b;
  }
  if ($op eq '*'){
    return $a * $b;
  }
  if ($op eq '/'){
    return $a / $b;
  }
  if ($op eq 'p'){
    $res=1;
    for($j=0;$j<$b;$j++){
      $res*=$a;
    }
    return $res;
  }
  if ($op eq 'r'){
    return $a ** 1/$b;
  }
  if ($op eq 's'){
    return sin($a);
  }
  if ($op eq 'c'){
    return cos($a);
  }
  if ($op eq 't'){
    return tan($a);
  }
  if ($op eq 'z'){
    return cot($a);
  }
  if ($op eq 'f'){
    $aux=1;
    for($j=1;$j<=$a;$j++){
      $aux=$j*$aux;
    }
    return $aux;
  }
}
sub calc{
  $expr=$_[0];
  $i=0;
  while($i<length($expr)){
    $char=substr($expr, $i, 1);
    #print "Char:$char \n";
    if($char eq " "){
      #print "espacio\n";
      $i+=1;
      next;
    }
    if($char eq '('){
      push(@operators,$char);
    }elsif($char =~ /\d/){
      #print "expr len:".length($expr)."\nexpr[i]=".substr($expr, $i, 1)."\n";
      $val=0;
      while ($i < length($expr) and (substr($expr, $i, 1) =~ /\d/)){
        $val = ($val * 10) + int(substr($expr, $i, 1));
        $i+=1;
        #print "val: $val\n";
      }
      push(@values,$val);
    }elsif($char eq ')'){
      #dump(@operators);
      while (@operators != 0 and $operators[-1] ne '('){
        #print"whileeee\n";
        $val2 = pop(@values);
        $op = pop(@operators);
        if($op eq 's' or $op eq 'c' or $op eq 't' or $op eq 'z' or $op eq 'f'){
          push(@values,applyOp($val2,0,$op));
        }else{
          $val1 = int(pop(@values));
          #print "val2=$val2 val1=$val1 op=$op res=".applyOp($val1,$val2,$op)."\n";
          push(@values,applyOp($val1,$val2,$op));
        }
      }
      pop(@operators);
    }else{
      #print "len:".@operators." jeraq1:".jeraq($operators[-1])." jeraq2:".jeraq($char)."\n";
      #print "jeraq1:".$operators[-1]." jeraq2:".$char."\n";
      while (@operators != 0 and jeraq($operators[-1]) >= jeraq($char)){
      #  print"whileeee\n";
        $val2 = pop(@values);
        $op = pop(@operators);
        if($op eq 's' or $op eq 'c' or $op eq 't' or $op eq 'z' or $op eq 'f'){
          push(@values,applyOp($val2,0,$op));
        }else{
          $val1 = pop(@values);
          #print "val2=$val2 val1=$val1 op=$op res=".applyOp($val1,$val2,$op)."\n";
          push(@values,applyOp($val1,$val2,$op));
        }
      }
      push(@operators,$char);
    }
    #print "i= $i\n";
    $i+=1;
    #dump(@values);
    #dump(@operators);
  }
  while (@operators != 0 ){
    $val2 = pop(@values);
    $op = pop(@operators);
    if($op eq 's' or $op eq 'c' or $op eq 't' or $op eq 'z' or $op eq 'f'){
      push(@values,applyOp($val2,0,$op));
    }else{
      $val1 = pop(@values);
      #print "val2=$val2 val1=$val1 op=$op res=".applyOp($val1,$val2,$op)."\n";
      push(@values,applyOp($val1,$val2,$op));
    }
  }
  return $values[-1];
}
$input=$ARGV[0];
chomp $input;
print calc($input)."\n";
#print calc("f ( ( 2 + 1 ) * 3 ) ")."\n";
#print calc("1 + 3 * ( 10 - 8 + s ( 10 * 7 ) ) + 7")."\n";
#print calc("1 + 2 + ( ( 5 * s 25 ) / 5 / 10 ) -  f 3 - (  4 r 2 + 3 p 5 )")."\n";
