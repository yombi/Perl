use warnings;
open(FILE, "| xargs wget");
while(1){
  print FILE "https://openphish.com/feed.txt";
  sleep(500);
}
close(FILE);
