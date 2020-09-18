use System::Info;
 
my $si = System::Info->new;
 
printf "Hostname:              %s\n", $si->host;
printf "Number of CPU's:       %s\n", $si->ncpu;
printf "Processor type:        %s\n", $si->cpu_type;
printf "Processor description: %s\n", $si->cpu;
printf "OS and version:        %s\n", $si->os;
printf "Speed:        %s Mhz\n", $si->cpu =~ s{^.*\b([0-9.]+)\s*[A-Z]Hz.*}{$1}r;