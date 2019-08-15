#!usr/bin/perl -w
use strict;
 
# File Name: bioseqrchIO.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-12

use Bio::Seq;
use Bio::SearchIO;

# 这个模块用于网页版 blast 结果的筛选

my $searchio = Bio::SearchIO -> new (-format => 'blasttable',-file => 'ncbi_WRKY_blast.out');
my $a;
while (my $results = $searchio -> next_result()) {
		#print $results -> query_length,"\n";
	while (my $h = $results -> next_hit) {
		
		while (my $hsp = $h -> next_hsp) {
				
				if($hsp -> percent_identity >= 80) {
				
					print "Hit= ", $h -> name,
					"\tlength= ",$hsp -> length('total'),
					"\tprecent_id",$hsp -> percent_identity,
					"\tevalue", $hsp -> evalue,
					"\t",$hsp -> frac_identical(['query'|'hit'|'total']),
					"\t",$hsp -> query_string,"\n";
				}

		 }
	}
	
}

open OUT,">blast_results.txt" or die "$!";
print "\n\n\n";
my $searchio1 = Bio::SearchIO -> new (-format => 'blast',-file => "N20NVHD1015-Alignment.txt");

while (my $results = $searchio1 -> next_result()) {      # get the first query 
	
		my $query_name = $results -> query_name;
		my $query_length = $results -> query_length;     # get info about the entire report

	while (my $hit = $results -> next_hit() ) {          # get info about the first hit 
		
			my $hit_name = $hit -> name;
			my $hit_length = $hit -> length;


		while (my $hsp = $hit -> next_hsp() ) {          # get info about the first hsp of the first hit 
			
				my $rank = $hsp ->rank;
				my $num_conserved = $hsp -> num_conserved;
				my $num_identity = $hsp -> num_identical;
				my $hsp_length = $hsp -> hsp_length;
				my $bits = $hsp -> bits;
				my $evalue = $hsp -> evalue;
				my $hsp_qstart = $hsp -> query -> start;
				my $hsp_qend = $hsp -> query -> end;
				my $query_strand = $hsp ->query -> strand;
				my $hsp_hstart = $hsp -> hit -> start;
				my $hsp_hend = $hsp -> hit -> end;
				my $hit_strand = $hsp -> hit -> strand;
				my $query_string = $hsp -> query_string;
				my $hit_string = $hsp -> hit_string;
				my $homology_string = $hsp -> homology_string;

				print OUT "$query_name\t$hit_name\t$query_length\t$hit_length\t$rank\t$num_identity\t$num_conserved\t$hsp_length\t",
				"$bits\t$evalue\t$hsp_qstart\t$hsp_qend\t$query_strand\t$hsp_hstart\t$hsp_hend\t$hit_strand\t$hit_string\t$query_string\t",
				"$homology_string\n";

		
		}
	
	}

}


close OUT;









