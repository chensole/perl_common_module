#!usr/bin/perl -w
use strict;
 
# File Name: Term::ANSIColor1.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-07

use Term::ANSIColor qw(:constants);

# 使用这种方法可以直接把颜色属性放在要输出的问题前面，简化步骤

print BOLD BLUE "test",RESET,"\n";       # 打印完之后想清楚字符串的格式，一定要加上 RESET 属性值


$Term::ANSIColor::AUTORESET = 1;          # 如果不想每条打印语句后面都加上 RESET的话，把这个变量设置为 TRUE，只要属性之间没有逗号，
											# 系统会自动清除

print  RED "the text is red on green\n"; 
print "this text is normal\n";
print "a\n";



print BOLD RED "text\n";

print "text\n";

print BOLD,RED,"test\n";         # 颜色属性之间有逗号，不会自动清除
print "test\n",RESET;

print "aaa\n";





# 不使用模块的话，可以直接使用 ANSI 转义字符

my $black = "\033[0;31m";
print $black."red"
