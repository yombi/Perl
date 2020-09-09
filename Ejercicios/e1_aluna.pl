use strict;

my @palabras=qw(Fermat nació en la primera década del siglo XVII en Beaumont-de-Lomagne, Francia
la mansión de finales del siglo XV donde nació Fermat actualmente es un museo
Era originario de Gascuña donde su padre, Dominique Fermat (un acaudalado mercader de cuero) sirvió
durante tres períodos de un año como uno de los cuatro cónsules de Beaumont-de-Lomagne Su madre se llamaba Claire de Long Pierre tenía un hermano
y dos hermanas y casi con seguridad se crio en su ciudad natal Hay poca evidencia sobre su educación escolar pero probablemente fue en
el Colegio de Navarra de París en Montauban Busto en la Sala Henir-Martin en el Capitolio de Toulouse
Asistió a la Universidad de Orleans desde 1623 y recibió un título de bachiller en derecho civil en 1626 antes de pasar a Burdeos
donde comenzó sus primeras investigaciones matemáticas serias y en 1629 dio una copia de su revisión de la obra de Apolonio De Locis Planis
a uno de los matemáticos locales Hay constancia de que en Burdeos estuvo en contacto con Jean de Beaugrand y durante esta época produjo un
trabajo importante sobre los extremos de una función que entregó a Étienne d'Espagnet quien claramente compartía intereses matemáticos con Fermat);

for (my $i=1; $i <=$ARGV[0]; $i++){
  print $palabras[int(rand(scalar(@palabras)))]." ";
}
print"\n";
