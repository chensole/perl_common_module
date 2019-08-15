#!usr/bin/perl -w
use strict;
 
# File Name: Statistics::Descriptive.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-14

use Statistics::Descriptive;

# this module provide basic functions used in descriptive statics


# creat a new statistics object

my $stat = Statistics::Descriptive::Full -> new();

$stat -> add_data(1,2,3,4);


print $stat -> mean,"\n";

print $stat -> variance,"\n";

print $stat -> count,"\n";

print $stat -> sum,"\n";

print $stat -> max,"\n";

print $stat -> maxdex,"\n";   # get the index of the maximum 

print $stat -> min,"\n";

print $stat -> mindex,"\n";

print $stat -> sample_range,"\n";    # get the range of the data set 

print $stat -> get_data,"\n";     # get the data 


$stat -> clear;  # clean the data object 

my $stat1 = Statistics::Descriptive::Full -> new();

$stat -> add_data(3,1,2,4);

print $stat -> max,"\n";



print $stat -> quantile(0),"\n";    # min 
print $stat -> quantile(1),"\n";    # 25% 分位数
print $stat -> quantile(2),"\n";    # 中位数 
print $stat -> quantile(3),"\n";    # 75% 分位数 
print $stat -> quantile(4),"\n";    # max 







