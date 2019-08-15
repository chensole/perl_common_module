#!usr/bin/perl -w
use strict;
 
# File Name: File_basename.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-06

use File::Basename;

# 这个模块主要是把文件路径解释成三个部分：目录，文件名，后缀名


my $filename = '/home/chenzhi/test/test.pl.txt';

my ($name,$path,$suffix) = fileparse($filename);

print "$name\t$path\t$suffix\n";       # 此时文件后缀为空------ 需指定后缀名


($name,$path,$suffix) = fileparse($filename,qr/\.\w+\.\w+/);  # fileparse 第二个参数指定需要匹配的后缀名

print "$name\t$path\t$suffix\n";



# 上面的函数是对文件路径进行分析，如果只是单纯的想获得文件名或者路径名，可以使用下面的两个函数


# Basename --- 文件名

$name = basename($filename);
print "$name\n";


# dirname ----- 路径名

my $dir = dirname($filename);
print "$dir\n";
