#!usr/bin/perl -w
use strict;
 
# File Name: test1.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-07
use Parallel::ForkManager;
use Data::Dumper qw(Dumper);

my $forks = shift or die "Usage: $0 N\n";
my @numbers = map { $_ * 2000000 } reverse 1 .. 10;
my %results;
 
print "Forking up to $forks at a time\n";

# setting the maximum of parallel child process

my $pm = Parallel::ForkManager->new($forks);
 


# use run_to_finish matter 
# this matter will be called once for each child process immediately as the child process terminates

# it receive a number of parameters,the last variable is we need. the last variable store everything we sent back from the child process

$pm->run_on_finish( sub {
    my ($pid, $exit_code, $ident, $exit_signal, $core_dump, $data_structure_reference) = @_;
    my $q = $data_structure_reference->{input};
    $results{$q} = $data_structure_reference->{result};
});


# the foreach ,fot each iteration 'start' will try to creat a new fork , at the same time, the main process will go to 'next' iteration of 
# the outer loop


# the child process is calculating using one of the CPUs of the computer, the main process can run using the other CPU and it can 
# create more child-processes.


# In this case, when one of them finishes the calc function it will call the finish method of Parallel::ForkManager and it will pass to it 
# two values
# in the finish function,the first parameter is the exit code, 0 means success
# the second parameter is a reference to a data structure it wishes to send back the main process 

foreach my $q (@numbers) {
    my $pid = $pm->start and next;
    my $res = calc($q);
    $pm->finish(0, { result => $res, input => $q });
}


# the call to wait_all_children make sure the parent process will indeed wait till all the process it created have finished 

$pm->wait_all_children;
 
print Dumper \%results;
 
sub calc {
    my ($n) = @_;
    my $sum = 0;
    for (1 .. $n) {
        $sum += 1 + rand()/100;
    }
    return $sum;
}
