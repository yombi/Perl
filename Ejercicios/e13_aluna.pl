($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
$min=($min<10)?"0".$min:$min;
@mes = qw(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre);
@dia = qw(Domingo Lunes Martes Miercoles Jueves Viernes Sabado);
print "$dia[$wday] $mday de $mes[$mon] de ".(1900+$year).","." $hour:$min:$sec\n";
