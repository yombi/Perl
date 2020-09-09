use strict;
use warnings;

while(my $var=<STDIN>){
  chomp $var;
  unless ($var cmp "salir") {
    last;
  }
}
print "Adios\n";
