#!usr/bin/perl -w
use strict;
 
# File Name: bioDBfasta.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-13

use Bio::DB::Fasta;



# create database from a dir

my $db = Bio::DB::Fasta -> new ("/home/zhi/perl_parctice/Commom_module/watermelon_97103_v2.genome.fa");

# --------------------------- get the string

# get the total ID list from Fasta file

my @ids = $db -> get_all_primary_ids;

print "@ids\n";



# get the entire sequence 

print $db -> seq('Cla97Chr01'),"\n";

# get the subsequence

my $seqstr = $db -> seq('Cla97Chr01:410,500');

print "$seqstr\n";




# get the revcom subsequence


my $seqstr1 = $db -> seq('Cla97Chr01:500,410');




# the gene length

my $length = $db -> length("Cla97Chr01");
print "$length\n";


# ------------------  get the Bio::Seq object

my $seqobj = $db -> get_Seq_by_id('Cla97Chr01');


print $seqobj -> subseq(100,200),"\n";
print $seqobj -> trunc(100,200) -> seq,"\n";
print $seqobj -> length,"\n";




# loop through sequence objects

my $stream = $db -> get_PrimarySeq_stream;

while (my $seq = $stream -> next_seq) {

	print $seq -> length,"\n";

}


# filehandle access the Bio::Seq object
my $fh = Bio::DB::Fasta -> newFh('/home/zhi/perl_parctice/Commom_module/watermelon_97103_v2.genome.fa');


while (my $seq = <$fh>) {

	print $seq -> length,"\n";
}


# tie hash access (very easy to work the fasta file)

my %sequence;

tie %sequence,'Bio::DB::Fasta','/home/zhi/perl_parctice/Commom_module/watermelon_97103_v2.genome.fa';

print $sequence{'Cla97Chr01:400,510'},"\n";






