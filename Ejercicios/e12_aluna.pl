($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
$min=($min<10)?"0".$min:$min;
print 1900+$year."-".($mon+1)."-".$mday." $hour:$min:$sec\n";
