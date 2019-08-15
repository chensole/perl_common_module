#!usr/bin/perl -w
use strict;
 
# File Name: MCE_grep1.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-08

use MCE::Grep;
#my @m1 = grep { /[2357][1468][9]/ } 1..1000; 

my @m2 = mce_grep { /[2357][1468][9]/ } 1..1000;
