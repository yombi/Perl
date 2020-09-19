use Convert::Base32;
use String::HexConvert ':all';
open(FILE,"<",$ARGV[0]);
foreach(<FILE>){
  chomp $_;
  $str.=$_;
}
$decoded = decode_base32($str);
print hex_to_ascii($decoded);
close (FILE);
