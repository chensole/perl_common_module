#!usr/bin/perl -w
use strict;
 
# File Name: bioseqIO.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-12

use Bio::SeqIO;

my $file = shift;

# get the bioseq object

my $in = Bio::SeqIO -> new (-file => $file,-format => "Fasta");

#print $in,"\n";

# get the sequence,use Bio::Seq methods

my $a;
while (my $seq = $in -> next_seq() ) {

	$a = $seq;
	last;
	
}

# get the sequence ID

print $a -> id,"\n";



# get the subset sequence

print $a -> subseq(1,10),"\n";




# write the sequence to a new file 

# my $out = Bio::SeqIO -> new (-file => '>clachr01.fa',
#							 -format => "Fasta"         # 可以输出其他形式
					 		
#					 		);

# $out -> write_seq ($a);



# the SeqIO can binding the filehandle,it can reformat the sequence

my $in1 = Bio::SeqIO ->newFh(-file => 'clachr01.fa',-format => "Fasta");

# world's shortest Fasta <-> EMBL format converter

my $out1 = Bio::SeqIO -> newFh(-format => 'EMBL'); # 创建一个 bioseqIO 类的文件句柄

# a string transform the Bio::SeqIO object

my $string = ">seq1\nATAAAAAAGGGGG\n";
my $seqIO = Bio::SeqIO -> new(-string => $string);

while (my $seq = $seqIO -> next_seq() ){

	print $seq -> id,"\n";
}


# write_seq 方法并不直接将数据写入文件，而是先写入内存中特定的缓冲区,在 Bio::SeqIO 中每写一条序列会刷新一次缓冲区
# flush方法是用来刷新缓冲区的，即将缓冲区中的数据立刻写入文件，同时清空缓冲区。

# 本人不建议使用
my $out2 = Bio::SeqIO -> new(-file => '>chr01fasta',
							 -format => "Fasta",
							 -flush => 0     # flush = 0, you can write multiple sequence to the same file       
						);


while (my $seq = $seqIO -> next_seq()) {


	$out2 -> write_seq($seq);

}


# fastq transform to fasta

my $in3 = Bio::SeqIO -> new (-file => 'test.fq',-format => 'fastq');

my $out3 = Bio::SeqIO -> new(-file => ">test.fa",-format => "fasta");

while (my $seq = $in3 -> next_seq() ) {

	$out3 -> write_seq($seq);

}


