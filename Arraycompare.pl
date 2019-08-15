#!usr/bin/perl -w
use strict;
 
# File Name: Arraycompare.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-05

use Array::Compare;

# compare two array whether same or not

my @a = (1,2,3);
my @b = (1,2,3);

my $compare = Array::Compare->new;

if ($compare -> compare(\@a,\@b)) {
	
	print "arrays are the same\n";
}else {

	print "array are different\n";
}
