#!usr/bin/perl -w
use strict;
 
# File Name: autodie.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-07

use autodie;     

# 可以自动处理报错信息，并退出

open I,"file.txt";          # use the autodie module,you don't need to check the file wheter exists or not 

while(<I>) {

	print $_,"\n";
}

close I;
