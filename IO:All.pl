#!usr/bin/perl -w
use strict;
 
# File Name: IO:All.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-05

use IO::All;

# build the object;

my $io = IO::All->new("Shell.pl");

# my $io = io('Shell.pl')  the same

print $io."\n";


# IO对象取决于上下文

my @lines = $io->slurp;        # slurp 一次读取所有内容

my @good_line = grep {not /use/} @lines;   # 去掉带有 use 的行

io('test')->print(@good_line);   # 输出一个新文件 test



# file find 找出所有.pl 的文件

my @want_file_name = map {$_ ->name} grep {$_ -> name =~ /\.pl/} io("/home/zhi/perl_parctice/Commom_module")-> all_files;
print "@want_file_name\n";


# 合并目录内的所有文件  并在每个文件开头输入 名称和文件大小

#for my $file (io("/home/zhi/perl_parctice/Commom_module")->all_files) {

#	my $output = sprintf ("----%s(%s)\n",$file->name,-s $file->name).$file->slurp;
#	io('tar_like')->append($output);  # append 类似于 print 

#}


# IO::All file used an array reference

my $file1 = io("test");

print $file1->[1],"\n";   # 打印第一行





# 从最后一行开始读入文件

$file1 -> backwards;

while (my $line = $file1->getline) {

	print "$line\n";
	
}


# 输出文件名
print io('/home/zhi/perl_parctice/Commom_module/test')->filename,"\n";


# 输出文件路径

print io('/home/zhi/perl_parctice/Commom_module/test')->filepath,"\n";



# 打印每一个文件的第一行

print $_ -> getline for io('/home/zhi/perl_parctice/Commom_module')-> all_files;



# 统计文件信息

printf "%s\t%s\t%s\n",$_->name,$_->uid,$_->size for io('.')->all;
