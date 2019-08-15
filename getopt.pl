#!usr/bin/perl -w
use strict;
 
# File Name: getopt.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-07-28

use Getopt::Long;

#my @all_file = ();
#my %flags;
##用来保存接收到的参数
#
#GetOptions(
#        'file|f=s{,}'=>\@all_file,
#        'flags=s'    => \%flags
#
#        #用'|'来给参数一个别名，即在使用时既可以用'-f filename'，也可以用'-file filename'。
#
#        #'='表示此参数一定要有参数值, 若改用':'代替表示参数不一定要有参数值
#
#        #'s'是代表String，表示接收到的参数以字符串的形式保存。若为'i'表传递整数参数, 若为'f'表传递浮点数
#
#        #'{,}'表示紧跟着此参数可能出现的个数不定，如'-f file1 file2 file3'。若无此设置，则需要'-f file1 -f file2 -f file3'
#
#        #如果相关联的变量是个散列, 那么就要求一个键=值（key=value）对, 并被插入到散列里。如'-flags file1=/filepath1 file2=/filepath2'。若无'{,}'，则需要'-flags file1=/filepath1 -flags file2=/filepath2 -flags file3=/filepath3'
#
#        #用''来引用变量
#);

# 在执行了./getopt.pl -f 1.txt 2.txt -flags open=yes -flags delete=no之后，

### @all_file: [
###         '1.txt',
###         '2.txt'
### ]
### %flags: {
###         delete => 'no',
###         open => 'yes'
### }

my ($file,$outfile,$trim);
GetOptions(

	'file=s' => \$file,
	'outfile|o=s' =>\$outfile,
	'trim!' => \$trim,
	'h' => \&help,
);


die &help unless defined $file;


sub help {

	print "the usage is: \n\t ","perl $0 -file -outfile","\n";
	exit;
}
