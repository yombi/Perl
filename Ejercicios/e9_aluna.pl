use warnings;
$ruta=".";
foreach("A".."K"){
  $ruta=$ruta."/".$_;
  mkdir $ruta;
  open(FILE, '>', "$ruta/$_.txt") or die;
  close(FILE)
}
