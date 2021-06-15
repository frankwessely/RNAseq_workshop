#!/bin/bash

FA_FILE_GZ="./Reference_training/ensembl_GRCh38_cdna_ncrna_v99_noalt.fa.gz"
FA_FILE="./Reference_training/ensembl_GRCh38_cdna_ncrna_v99_noalt.fa"
GENE_MAP_FILE="./Reference_training/ensembl_GRCh38_v98_cdna_ncrna_v99_noalt_gene_map_training.txt"

## alternative: use zgrep if available to avoid decompressing
gunzip -c $FA_FILE_GZ > $FA_FILE

paste \
<(grep '^>' $FA_FILE | cut -d ' ' -f 1-7 | tr ' ' '\t' | \
sed -E 's/gene:|gene_symbol:|gene_biotype:|transcript_biotype:|chromosome:GRCh38:|scaffold:GRCh38://g' | \
sed -E 's/:[0-9]+:[0-9]+:1|:[0-9]+:[0-9]+:-1//g') \
<(grep '^>' $FA_FILE | cut -d ' ' -f 8- | sed -E 's/description:| \[Source:.*//g') \
 | tr -d '>' > $GENE_MAP_FILE
  
rm $FA_FILE
