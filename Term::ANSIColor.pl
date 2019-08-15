#!usr/bin/perl -w
use strict;
 
# File Name: Term::ANSIColor.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-07

use Term::ANSIColor;
# Color screen output using escape sequences



# change the font color on the screen
print color('red');

print "the text is red\n";

print "i want to change the color\n";



print color('reset');
print "i am a normal text\n";




# colored() ---------------- add the background color and font color
print colored(['yellow on_magenta'], 'Yellow on magenta.', "\n");

print colored(['red on_bright_yellow'], 'Red on bright yellow.', "\n");

print colored ("Text", 'bold blue on_white'), "\n";







