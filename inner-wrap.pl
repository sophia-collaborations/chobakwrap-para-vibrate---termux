use strict;
use argola;

my $vbtime = 1000;
my $vbminim = 100;

sub opto__msec_do {
  $vbtime = int(&argola::getrg() + 0.45);
} &argola::setopt('-msec',\&opto__msec_do);

sub opto__sec_do {
  $vbtime = int((&argola::getrg() * 1000) + 0.45);
} &argola::setopt('-sec',\&opto__sec_do);

&argola::runopts();

if ( $vbtime < ( $vbminim - 0.5 ) ) { exit(0); }

exec("termux-vibrate","-f","-d",$vbtime);



