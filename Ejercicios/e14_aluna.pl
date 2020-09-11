@code = split(/\n/,`wget -qO- $ARGV[0]`);
@ref = grep(/<a.*href=.*>/,@code);

foreach $line (@ref){
  $line =~ /<a.*href="([\s\S]+?)".*>/;
  print"$1\n";
}
