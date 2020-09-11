open(FILE, '<', "/etc/passwd") or die;
foreach(<FILE>){
  if(index($_, "nologin") == -1 and index($_, "false") == -1 and index($_, "sync") == -1){
    @fields = split /:/, $_;
    print "Usuario:$fields[0]\nUser ID:$fields[2]\nGroup ID:$fields[3]\nHome:$fields[5]\n";
    print"Shell:$fields[6]\n";
  }
}
close(FILE);
