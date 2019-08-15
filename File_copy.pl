#!usr/bin/perl -w
use strict;
 
# File Name: Fil_copy.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-06

use File::Copy;

# 这个模块提供了两个基本的函数 copy 和 move，对于将一个文件的的内容转移到另一个文件很有用，这个模块无法对目录进行移动或复制

# copy 两个参数都可以是文件或者文件句柄，如果目标文件不存在，但父目录存在，则创建文件，若父目录也不存在，则报错

copy "out1.txt","chenzhi.txt" or die "$!";



# move 参数与上面相同

move "out1.txt",".." or die "$!";   # 移动文件到上一层目录
