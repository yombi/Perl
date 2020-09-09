use strict;
use warnings;

sub palindrome{
  my $str=$_[0];
  $str =~ s/\s//g;
  if ($str eq reverse($str)){
    print "@_ es palindromo\n";
  }else{
    print "@_ no es palindromo\n";
  }
}
if (@ARGV){
  foreach my $word (@ARGV){
    palindrome($word);
  }
}else{
  while(my $var=<STDIN>){
    chomp $var;
    unless ($var cmp "salir") {
      last;
    }
    palindrome($var);
  }
}
