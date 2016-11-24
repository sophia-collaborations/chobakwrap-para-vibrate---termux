use strict;
use argola;

my $vbtime = 1000;
my $vbminim = 30;
my $vbreqmin = 10;

sub opto__msec_do {
  $vbtime = int(&argola::getrg() + 0.45);
} &argola::setopt('-msec',\&opto__msec_do);

sub opto__sec_do {
  $vbtime = int((&argola::getrg() * 1000) + 0.45);
} &argola::setopt('-sec',\&opto__sec_do);

sub opto__nomin_do {
  $vbreqmin = 0;
} &argola::setopt('-nomin',\&opto__nomin_do);

&argola::runopts();

if ( $vbreqmin < 5 ) { $vbminim = 0; }
system("echo",("Vibration milliseconds set to " . $vbtime . " (minimum is " . $vbminim . ")"));

if ( $vbtime < ( $vbminim - 0.5 ) ) { exit(0); }

exec("termux-vibrate","-f","-d",$vbtime);



