#!usr/bin/perl -w
use strict;
 
# File Name: MCE_grep.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-08

use MCE::Grep;

MCE::Grep::init {

	max_workers => 4
};
# array or array_ref

my @a = mce_grep {$_ % 5 == 0} 1 .. 10000;



# pass an array_ref for depply input data

my @b = mce_grep {$_ -> [1] % 5 == 0} [[1,2],[3,4]];


# file_path glob_ref

my @e = mce_grep_f {/pattern/} "/path/to/file";

my @f = mce_grep_f {/pattern/} $file_handle;


# sequence of numbers (begin,end,step)  ------ default step is 1

my @g = mce_grep_s {%_ *3 == 0} 1,10000,5;

my @f = mce_grep_s {%_ *3 == 0} {

	begin => 1,end => 10000, setp => 5, format => undef
}



# a common scenario is grepping for pattern inside a massive log file 

my $file = "/path/to/file";

my @m = mce_grep_f {/pattern/} $file;     ## it's so fast



# shutdown -------- 保持一个好习惯，代码结束立即停止线程

use MCE::Grep;

MCE::Grep::init {
   chunk_size => 20, max_workers => 'auto'
};

my @a = mce_grep { ... } 1..100;

MCE::Grep::finish;     # 结束



# MCE::Grep 缺少检查是否匹配的实现，因此，可以使用 另一个子模块 MCE::Loop






