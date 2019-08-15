#!usr/bin/perl -w
use strict;
 
# File Name: Benchmark.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-07-22

# 计算代码运行时间

use Benchmark;
my $time1 = new Benchmark;
for (my $i = 0; $i < 1000000;$i++) {
	my $var = 1;

}
my $time2 = new Benchmark;

my $diff = timediff($time2,$time1);
print timestr($diff);
print "\n";
