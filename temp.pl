#!/usr/bin/perl
# (c) Travis Dowd
# (d) 6-1-2020
#
# Show machine temps, x86_pkg_temp is cpu
#
use strict;
use warnings;
# make new file with machine temps 
system( "cat /sys/class/thermal/thermal_zone*/temp > TEMP_FILE" );
open( my $fh, "<", "TEMP_FILE") or die $!;
my $var = 0;
while( my $line = <$fh> ) {
    # Convert with this formula: 
    #       (( temp * 0.001 ) * ( 9/5 )) + 32
    my $celsius = $line * 0.001;
    my $modifier = 9/5;
    my $temp = $celsius * $modifier + 32;    
    system( "cat /sys/class/thermal/thermal_zone$var/type | tr '\n' ' '" );
    print ":\t", $temp, "\n";    
    $var++;
}
# remove TEMP_FILE
unlink "TEMP_FILE"
