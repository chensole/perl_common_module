#!usr/bin/perl -w
##有时候你需要查看当前目录或者便于回到此目录时，你可以使用Cwd moudle

use strict;
use Cwd;
my $dir = cwd;
print "$dir\n";
