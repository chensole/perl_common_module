#!usr/bin/perl -w
use strict;

use Thread;
my @ips = ("221.141.1.222", "89.46.101.122", "199.200.120.37");
my @threads;

foreach (@ips) {
	push @threads,threads->create(\&ping,$_);

}

foreach (@threads) {

	$_->join();
}

sub ping {

	$_ = shift;
	my $ping_log = `ping -c 5 $_`;
	my @ping_log = split /\n/,$ping_log;
	my $time = 0;
	foreach (@ping_log) {
		$time += $1 if /time=(.*)ms/;

	}

	my $avg_time = $time / 5;
	$time = "na" if $time == 0;
	print "$_\t$avg_time\n";
}




my $thr = threads ->create(\&sub1);

sub sub1 {
	print "IN child thread\n";

}
$thr->join();


# 线程标识
# 第一种方式就是通过给不同线程的子程序传递不同参数的方式来区分不同的线程

my $thr2 = threads->create(\&mysub,"first");
my $thr3 = threads->create(\&mysub,"second");
my $thr4 = threads->create(\&mysub,"third");

sub mysub {
    my $thr_num = shift @_;
    print "I am thread $thr_num\n";
}

$thr2->join();
$thr3->join();
$thr4->join();

# 线程状态和join、detach

# perl中的线程实际上是一个子程序代码块，它可能会有子程序的返回值，所以子程序需要接收子程序的返回值，父进程也需要等待子进程退出并为子线程收尸

# join() : 1. 等待子线程退出，等待过程一直阻塞; 2. 子程序退出后为子程序收尸3. 如果子线程有返回值，则收集返回值

my ($str) = threads->create(\&sub2);
my @returndata = $str->join();
print 'thread returned: ', join('@',@returndata),"\n";

sub sub2 {
	return ('fif','foo',2);

}

	
# detach() : 1. 如果不想要等待子程序执行完毕，可以使用detach(),它将子线程脱离父线程，父线程不再阻塞等待。执行detach后，线程的状态变成detached,只有进程退出时detached线程才默默终止(detached状态的线程也依然是线程，是进程的内部调度单元，进程终止，线程都将终止)

# 如果子线程未join也未detach,则父线程不会收尸，并且在进程退出时报告相关消息
sub sub3 {

	for (1 .. 10) {
		print "i am detached thread\n";
		sleep 1;
	}

}
my $thr5 = threads->new(\&sub3)->detach();

print "main thread will exit in 2 seconds\n";
sleep 2; # 2秒后进程终止，detach后的子线程会默默终止


