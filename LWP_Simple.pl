#!usr/bin/perl -w
## 获取页面内容
use strict;

use LWP::Simple qw(get);

my $url = shift || "http://www.youtube.com/watch?v=hLQl3WQQoQ0&list=RDaJOTlE1K90k&index=15";
my $content = get($url);
print $content;

