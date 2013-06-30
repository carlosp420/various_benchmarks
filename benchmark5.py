#!/usr/bin/env python

# This is to test how long it takes to do a masked BLAST
import subprocess;

genome = "silkgenome.fa";

command = 'dustmasker -in '+ genome + ' -infmt fasta -parse_seqids '
command += '-outfmt maskinfo_asn1_bin -out ' + genome + '_dust.asnb'
print "masking low_complexity regions..."
p = subprocess.check_output(command, shell=True) # identifying low-complexity regions.
print p

command = 'makeblastdb -in ' + genome + ' -input_type fasta -dbtype nucl '
command += '-parse_seqids -mask_data ' + genome + '_dust.asnb '
command += '-out ' + genome + ' -title "Whole Genome without low-complexity regions"'
print "creating database..."
p = subprocess.check_output(command, shell=True)

