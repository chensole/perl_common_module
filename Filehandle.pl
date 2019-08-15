#!usr/bin/perl -w
use strict;
 
# File Name: Filehandle.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-07-31


#  借助这个脚本可以同时创建多个文件句柄，然后针对文件内容，将一个文件分割成不同的文件

use FileHandle;



my %hash;


for my $k ("mRNA","cDNA","exon") {

	my $fh = FileHandle -> new(">$k.txt");    # 创建文件句柄

	$hash{$k} = $fh;
}


map {&read} keys %hash;

close DATA;

sub read {
		while (<DATA>) {
			chomp;
			my @tmp = split /\s?\t/;
			print {$hash{$tmp[1]}} $_;        # 注：文件句柄不能是任意的一个表达式，只能是标量、裸字(IN OUT等等)、或者一个块 {} ,如果将文件句柄储存在 hash 或 数组中，你需要将文件句柄表示放在一个块内，\
												# 不然的话，perl不能将其解释为文件句柄
		}
}











__DATA__
a	mRNA 	12
b	cDNA	12
c	exon	12
