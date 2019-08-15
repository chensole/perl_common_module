#!usr/bin/perl -w
use strict;
 
# File Name: bioseq.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-12

use Bio::Seq;
use Bio::SeqIO;
# get the sequence from a file

my $in = Bio::SeqIO -> new (-file => 'test.fa',-format => 'fasta');

my $a;
while (my $seq = $in -> next_seq() ) {

	$a = $seq;

}



# get the string from the Bio::Seq object

print $a -> seq(),"\n";


# get the sequence length

print $a -> length(),"\n";


# get the id

print $a -> id(),"\n";


# get the alphabet (dna rna protein)

print $a -> alphabet,"\n";



# get the reverse complementary Bio::Seq object

print $a -> revcom -> seq,"\n";



# translate sequence

print $a -> translate -> seq,"\n";




# get the subsequence from the Bio::Seq object (genrate a string)

print $a -> subseq(5,10),"\n";   # start begin 1



# get the subseqquence from the Bio::Seq object (genrate a Bio::Seq object)

print $a -> trunc(5,10) -> seq,"\n";







