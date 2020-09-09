use strict;
use warnings;

for (my $i=1; $i <=$ARGV[0]; $i++) {
  print "\n$i ";
  if($i % 6 == 0){
    print "FizzBuzz";
  }elsif($i % 3 == 0){
    print "Buzz";
  }elsif($i % 2 == 0){
    print "Fizz";
  }
}
print "\n";
