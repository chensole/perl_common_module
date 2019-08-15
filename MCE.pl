#!usr/bin/perl -w
use strict;
 
# File Name: MCE.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-08
# this module makes it easy to run your existing perl code in parallel 
# across every core on your platform, and get a huge speed boost along the
# way.


# construction using the core API

use MCE;

my $mce = MCE->new(

	max_workers => 5,
	user_func => sub{
	
		my ($mce) = @_;
		$mce -> say("hello from",$mce -> wid);
	}

);

$mce -> run;


# construction using a MCE model

# standard perl code

use feature 'say';
use Nginx::Log::Entry;

sub detect_robot {
    return Nginx::Log::Entry->new($_[0])->was_robot;
}

open(my $LOG, '<', '/var/logs/access.log');
my $count = grep { detect_robot($_) } <$LOG>;
say scalar $count;


# use MCE ,the new code is below
# use MCE::Grep is more faster
use strict;
use warnings;
use feature 'say';
use Nginx::Log::Entry;
use MCE::Grep;    # changing grep to 'mce_grep'

sub detect_robot {
    return Nginx::Log::Entry->new($_[0])->was_robot;
}

open(my $LOG, '<', '/var/logs/access.log');
my $count = mce_grep { detect_robot($_) } $LOG;      # remove the diamond operator
say scalar $count;


# mce_grep_f for working directly with files --------- the function requires a filepath argument

use strict;
use warnings;
use feature 'say';
use Nginx::Log::Entry;
use MCE::Grep;

sub detect_robot {
    return Nginx::Log::Entry->new($_[0])->was_robot;
}

my $count = mce_grep_f { detect_robot($_) } '/var/logs/access.log';   # just input the filename
say scalar $count;



# changing the number of workers
#
# by default,MCE intializes one worker per core,


use MCE::Grep;
MCE::Grep::init({max_workers => 3});





# changing the chunk size











