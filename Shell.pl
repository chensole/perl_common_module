#!/usr/bin/perl -w
# Shell模块可以直接在perl里面调用shell command,shell命令直接作为函数调用
use strict;
use Shell;
my $dir = pwd();
print $dir,"\n";

my @file = ls($dir);
print "@file\n";


