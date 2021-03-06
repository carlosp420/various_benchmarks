# Benchmaking for PyPhylogenomics
Tests using ant genomes for gene search, masked and unmasked.

```bash
wget http://www.antgenomes.org/downloads/aech/Aech_v2.0.fa.masked.gz
wget http://www.antgenomes.org/downloads/aech/Aech_v3.8.cds.gz
sed -i 's/>Aech_/>AECH/g' Aech_v3.8.cds
wget http://www.antgenomes.org/downloads/cflo_v3.3.fa.zip
mv cflo_v3.3.fa.zip Camponotus.zip
unzip Camponotus.zip 
mv cflo_v3.3.fa Camponotus.fas 
wget http://www.antgenomes.org/downloads/pbar_scaffolds_v03.fasta.zip
unzip pbar_scaffolds_v03.fasta.zip 
mv db-public/genomic/pbar_scaffolds_v03.fasta Pogonomyrmex.fasta
wget http://www.antgenomes.org/downloads/Si_gnF.454scaffolds.fasta.zip
mv db-public/genomic/Si_gnF.454scaffolds.fasta Solenopsis.fasta
```

## Benchmark 1 
### Test execution times for dustmaker (1 processor)
Create a BLAST database using 'unmasked' genome de *Acromyrmex echinatior*, 
dustmaker & makeblastdb -mask_data.

```bash
wget http://www.antgenomes.org/downloads/aech/Aech_v2.0.fa.gz
gunzip Aech_v2.0.fa.gz
bash do_benchmark1.sh
```

```python
command = 'dustmasker -in '+ genome + ' -infmt fasta -parse_seqids '
command += '-outfmt maskinfo_asn1_bin -out ' + genome + '_dust.asnb'
command = 'makeblastdb -in ' + genome + ' -input_type fasta -dbtype nucl '
command += '-parse_seqids -mask_data ' + genome + '_dust.asnb '
command += '-out ' + genome + ' -title "Whole Genome without low-complexity regions"'
```

    mean = 39.3 seconds
    sd = 0.26 seconds

## Benchmark 2
Normal blastn of unmasked genome of *Acromyrmex echinatior*

```python
command = 'blastn -query ' + f + ' -db ' + genome + ' -task blastn '
command += '-evalue ' + str(e_value) + ' -out ' + f + "_out.csv" + ' -num_threads 1 -outfmt 10'
```

    mean = 901.3 seconds
    sd = 1.29 seconds

## Benchmark 3
Do blast of **masked** database of unmasked genome of *Acromyrmex echinatior*

```python
command = 'blastn -query ' + f + ' -db ' + genome + ' -task blastn -db_soft_mask 11 '
command += '-evalue ' + str(e_value) + ' -out ' + f + "_out.csv" + ' -num_threads 1 -outfmt 10'
```

    mean = 872.4 seconds
    sd = 0.88 seconds

## Benchmark 4
Do blast of **unmasked** database of unmasked genome of *Acromyrmex echinatior*

```python
command = 'blastn -query ' + f + ' -db ' + genome + ' -task blastn '
command += '-evalue ' + str(e_value) + ' -out ' + f + "_out.csv" + ' -num_threads 1 -outfmt 10'
```

    mean = 900.7 seconds => 15.01 minutes
    sd = 1.49 seconds

## Benchmark 5
Create a BLAST database using 'unmasked' genome of *B. mori*, 
dustmaker & makeblastdb -mask_data.

```python
command = 'dustmasker -in '+ genome + ' -infmt fasta -parse_seqids '
command += '-outfmt maskinfo_asn1_bin -out ' + genome + '_dust.asnb'
command = 'makeblastdb -in ' + genome + ' -input_type fasta -dbtype nucl '
command += '-parse_seqids -mask_data ' + genome + '_dust.asnb '
command += '-out ' + genome + ' -title "Whole Genome without low-complexity regions"'
```

    mean = 57.1 seconds
    sd = 0.12 seconds

## Benchmak 6
Do blast of **masked** database of unmasked genome of *B. mori*

```python
command = 'blastn -query ' + f + ' -db ' + genome + ' -task blastn -db_soft_mask 11 '
command += '-evalue ' + str(e_value) + ' -out ' + f + "_out.csv" + ' -num_threads 1 -outfmt 10'
```

    mean = 1955.6 seconds => 32.5 minutes
    sd = 3.6 seconds

## Benchmark7
Do blast of **unmasked** database of unmasked genome of *B. mori*

```python
command = 'blastn -query ' + f + ' -db ' + genome + ' -task blastn '
command += '-evalue ' + str(e_value) + ' -out ' + f + "_out.csv" + ' -num_threads 1 -outfmt 10'
```

    mean = 2024.5 seconds => 33.7 minutes
    sd = 3.6 seconds


![Comparison of execution times for benchmarks](benchmarks.pdf)

