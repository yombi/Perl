use Chart::Gnuplot;
open(FILE, '<', "p1_aluna.txt") or die $!;
foreach(<FILE>){
  if(index($_, "Host") != -1){
    $host=(split(':',$_))[1];
    chomp $host;
  }
  if($_=~ /(\d+)\/(\w+)/){
    @port_proto=split('/',$_);
    $port=$port_proto[0];
    $proto=(split(' ',$port_proto[1]))[0];
    $state=(split(' ',$_))[1];
    #print "$host,$port,$proto,$state\n";
    if($port<1024){
      $port_clas{'Bien conocidos'}+=1;
    }elsif($port>1024 and $port<49151){
      $port_clas{'Registrados'}+=1;
    }else{
      $port_clas{'Proposito general'}+=1;
    }
    $port_state{$state}+=1;
    $port_proto{$proto}+=1;
    push(@{$port_dict{$port}},$host);
    $port_count{$host}+=1;
  }
}
close(FILE);
foreach $key (keys %port_dict ) {
  push(@x,$key);
  push(@y,scalar(@{$port_dict{$key}}));
}

$chart = Chart::Gnuplot->new(
    output => "fig/p3_aluna_1.jpg",
    title  => "Número de hosts que utilizan cada puerto detectado",
    xlabel => "Puerto",
    ylabel => "Hosts"
);
$dataSet = Chart::Gnuplot::DataSet->new(
    xdata => \@x,
    ydata => \@y,
    style => "histograms"
);
$chart->plot2d($dataSet);
@x=();
@y=();
foreach $key (keys %port_clas ) {
  push(@x,$key);
  push(@y,$port_clas{$key});
}
foreach $key (keys %port_state ) {
  push(@x,$key);
  push(@y,$port_state{$key});
}
foreach $key (keys %port_proto ) {
  push(@x,$key);
  push(@y,$port_proto{$key});
}
$chart = Chart::Gnuplot->new(
    output => "fig/p3_aluna_2.jpg",
    title  => "Número de puertos segun su clasificación y protocolo",
    xlabel => "Clasificacion",
    ylabel => "Puertos"
);
$dataSet = Chart::Gnuplot::DataSet->new(
    xdata => \@x,
    ydata => \@y,
    style => "histograms"
);
$chart->plot2d($dataSet);
@x=();
@y=();
foreach $key (keys %port_count ) {
  push(@x,$key);
  push(@y,$port_count{$key});
}
$chart = Chart::Gnuplot->new(
    output => "fig/p3_aluna_3.jpg",
    title  => "Número de puertos activos por host",
    xlabel => "Host",
    ylabel => "Puertos"
);
$dataSet = Chart::Gnuplot::DataSet->new(
    xdata => \@x,
    ydata => \@y,
    style => "histograms"
);
$chart->plot2d($dataSet);
