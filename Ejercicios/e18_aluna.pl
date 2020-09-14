use Crypt::OpenSSL::AES;
open (FILE,"<:raw",$ARGV[0]) or die $!;
open (CIPH,">","e18_cifrado") or die $!;
$key = "MiLlaveSecreta.,";

my $cipher = new Crypt::OpenSSL::AES($key);
while(read (FILE,$bytes,16)){
  $bytes=(length($bytes)<16) ? $bytes." "x(16-length($bytes)):$bytes;
  $encrypted.= $cipher->encrypt($bytes);
}
print CIPH $encrypted;
close(CIPH);
open (CIPH,"<","e18_cifrado") or die $!;
open (DECIPH,">","e18_decifrado") or die $!;
while(read (CIPH,$bytes,16)){
  $bytes=(length($bytes)<16) ? $bytes." "x(16-length($bytes)):$bytes;
  $decrypted.= $cipher->decrypt($bytes);
}

print DECIPH $decrypted;
close(FILE);
close(CIPH);
close(DECIPH);
