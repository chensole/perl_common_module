#!/usr/bin/perl -w
# File::Spec 是对文件名进行一般的操作
use strict;
use File::Spec;


my $file = File::Spec->catfile('a','b');
print $file,"\n";

# catdir 连接两个或两个以上的目录名，形成一个完整的目录路径

my @dir = qw(chenzhi file);
my $path = File::Spec->catdir(@dir);
print "$path\n";


# catfile 连接一个或多个目录与一个文件名，形成一个完整的文件路径

my $filename = "1.txt";

my $filepath = File::Spec->catfile(@dir,$filename);
print "$filepath\n"; # chenzhi/file/1.txt

# splitpath
my ($volume,$directories,$filename1) = File::Spec->splitpath($filepath);

print "$volume\t$directories\t$filename1\n";

# updir 返回父目录的名字  用 .. 表示 ----- 很少用

my $updir = File::Spec->updir();
print "$updir\n";
print File::Spec->rel2abs($updir),"\n";



# curfile 返回当前目录的一个字符串表示(很少用)
my $curdir = File::Spec->curdir();
print "$curdir\n";

# rootdir 返回一个根目录的字符串表示(很少用)
my $rootdir = File::Spec->rootdir();
print "$rootdir\n"; # 返回/

# file_name_is_absolute 判断是否是绝对路径
use Cwd;
my $mydir = cwd;
my $is_absolute = File::Spec->file_name_is_absolute($mydir);
my $is_absolute1 = File::Spec->file_name_is_absolute($filepath);
print "$is_absolute\n";
print "$is_absolute1\n";


# abs2rel 绝对路径变成相对路径
my $name = "test.pl";
my $path2 = File::Spec->catfile($mydir,$name);
my $relpath = File::Spec->abs2rel($path2);
print "$relpath\n";

# rel2abs 相对路径变成绝对路径
my $abs_path = File::Spec->rel2abs($relpath);
print "$abs_path\n";

