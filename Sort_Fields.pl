#!usr/bin/perl -w
use strict;
 
# File Name: Sort_Fields.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-06

use Sort::Fields;

# 这个模块提供了高效的对行进行排序的技术，可以利用行的某个区域进行实现排序


my @array = <DATA>;

#print "@array\n";

print fieldsort[2],@array;     # 对数组的第二列排序，默认是 ASCII码排序



print fieldsort['1n'],@array;   # 对数组第一列按数字排序，默认是升序


print fieldsort['-1n'],@array;   # 对数组的第一列进行降序



print fieldsort[4,'1n'],@array;   # 对第四列按字母排序，然后对第一列按数字进行升序 ---------- 可以替代 施瓦茨变换 !!!!!!!!!

print fieldsort['4n','3n'],@array;

__DATA__
123   asd   1.22   asdd
32    ewq   2.32   asdd
43    rewq  2.12   ewet
51    erwt  34.2   ewet
23    erww  4.21   ewet
91    fdgs  3.43   ewet
123   refs  3.22   asdd
123   refs  4.32   asdd
