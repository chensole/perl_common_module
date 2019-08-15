#!usr/bin/perl -w
use strict;
 
# File Name: file_find.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-06

# 这个模块主要用于对目录的文件进行遍历
# 自带三个变量 
	
	# $File::Find::name    文件绝对路径名
	# $File::Find::dir 	   目录名
	# $_				   文件名（不含路径）

use File::Find;

my $dir = '/home/zhi/perl_parctice/Commom_module';

find(\&wanted,$dir);   # 本质上是一个循环




sub wanted {

	if ($File::Find::name =~ /\.pl/) {
		print "$File::Find::name","\n";      # 输出符合条件的文件完整路径名
		print "$File::Find::dir","\n";       # 输出目录名称
		print "$_\n";
	}


}
