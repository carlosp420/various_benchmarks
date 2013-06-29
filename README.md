# Benchmaking for PyPhylogenomics

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

## Benchmark 1 
### Evaluar tiempo de ejecucion para dustmaker & makeblastdb masked
Usando 'unmasked' genome de *Acromyrmex echinatior*:

    wget http://www.antgenomes.org/downloads/aech/Aech_v2.0.fa.gz
    gunzip Aech_v2.0.fa.gz
    bash do_benchmark1.sh

