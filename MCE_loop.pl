#!usr/bin/perl -w
use strict;
 
# File Name: MCE_loop.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-08

use MCE::Loop;

# this module provides a parallel loop implementataion through many-core engine


# initialize cores number

MCE::Loop::init {

	max_workers => 8,
	chunk_size => 'auto'
};


mce_loop {
   my ($mce, $chunk_ref, $chunk_id) = @_;	# mce_loop  receive three parameters 
   MCE->say("$chunk_id: $_");	
} 40 .. 48;                                                                     


# when CHUNK_SIZE equals 1
#
# all models in MCE default to 'auto' for chunk_size 

use MCE::Loop;
 
MCE::Loop::init {
   chunk_size => 1      # 当 mce_loop {} 代码块内没有循环时，可设置 chunk_size = 1
};
 
## Array or array_ref
mce_loop { do_work($_) } 1..10000;
mce_loop { do_work($_) } \@list;


# when CHUNK_SIZE greater 1
# 当代码块内存在循环时，需要设置 CHUNK_SIZE 为 'auto' 或者是大于 1 的数

MCE::Loop::init {          ## Chunk_size defaults to 'auto' when
   chunk_size => 'auto'    ## not specified. Therefore, the init
};                         ## function may be omitted.


# For relatively small data, choosing 1 for chunk_size is fine



# mce_loop {code} list -------- input data may be a list , an array ref, or a hash ref 

# $_ contains the item when chunk_size => 1

mce_loop { do_work($_) } \@list;



# 分块

my %res = mce_loop {
   my ($mce, $chunk_ref, $chunk_id) = @_;
   my %ret;
   for my $item (@{ $chunk_ref }) {
      $ret{$item} = $item * 2;
   }
   MCE->gather(%ret);
} \@list;




# mce_loop_f {code} file ----------- the faster of file path
# Workers communicate the next offset position among themselves

# $_ contains the line when chunk_size => 1

mce_loop_f { $_ } "/path/to/file";  # faster


# 分块
my %res = mce_loop_f {
   my ($mce, $chunk_ref, $chunk_id) = @_;
   my $buf = '';
   for my $line (@{ $chunk_ref }) {
      $buf .= $line;
   }
   MCE->gather($chunk_id, $buf);
} "/path/to/file";


# GATHERING DATA

# the gather method is used to have results sent back to the manager process 

my %h1 = mce_loop { MCE->gather($_, $_ * 2) } 1..100;
print "@h1{1..100}\n\n";




my $hugefile = 'very_huge.file';

# mce_loop_f {code} file 
#
my @results = mce_loop_f {

	my ($mce,$slurp_ref,$chunk_id) = @_;     # mce_loop_f receive three parameters 
	
	if ($$slurp_ref =~ /pattern/m) {
	
		my @macthes;

		open my $MEM_FH,'<',$slurp_ref;
		binmode $MEM_FH,':raw';
		while (<$MEM_FH>) {push @matches,$_ if (/pattern/)};
		close $MEM_FH;
		
		MCE -> gather(@macthes);
	}

} $hugefile;


print join ('',@results);

# SHUTDOWN

MCE::Loop->finish;


