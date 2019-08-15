#!usr/bin/perl -w
use strict;
 
# File Name: File_Tee.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-06
use File::Tee qw(tee); 

# 这一模块主要是复制数据从 perl 输出流到另一个或多个输入流  --------- 等价于 Linux 的 tee 


#  usage :  tee $fh,$target,....

			# copy data from $fh to one or several file or streams

my $file = "Cwd.pl";


tee STDOUT,"out.txt";       # 将标准输出保存到 out.txt 文件中 （一定要先定义输出流），默认是 ">>" 模式

print "hello world\n";



# 也可以运用 匿名哈希的方式来定义输出流

tee STDOUT ,{mode=>'>',open=>'out1.txt',lock=>1};

print "helloworld\n";
