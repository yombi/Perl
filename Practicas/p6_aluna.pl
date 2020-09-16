use strict;
use warnings;

package UppercaseBot;
use base qw(Bot::BasicBot);

sub said {
    my $self      = shift;
    my $arguments = shift;
    my $str= $arguments->{body};
    my $resp="";
    if($str=~ /hola/){
      $resp= "Hola! No soy un bot";
    }elsif($str=~ /mayus/){
      $resp= uc $str;
    }elsif($str=~ /minus/){
      $resp= lc $str;
    }elsif($str=~ /ping/){
      $resp= "pong";
    }elsif($str=~ /chiste/){
      $resp="- Mama que haces en frente de la computadora con los hojos cerrados? - Nada hijo es que Windows me dijo que cierre las pestanias";
    }else{
      $resp="Jeje...no se que responderte";
    }
    $self->say(
        channel => $arguments->{channel},
        body    => $resp,
    );
}
package main;
my $bot = UppercaseBot->new(
    server      => 'localhost',
    port        => '7000',
    channels    => ['#p6_aluna'],
    nick        => 'Bot_p6',
    name        => 'AlunaBOt',
);
$bot->run();
