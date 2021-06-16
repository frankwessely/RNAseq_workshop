#!/bin/bash

INPUT_DIR="../data/Fastq_files/Fastq_training_subsample_100K/"
OUTPUT_DIR="../output_training/Salmon_mapping/Salmon_quant_110_ensembl_v99_noalt_k31_100K_chr10/"

SALMON_IDX="../data/Salmon_index/salmon_idx_ensembl_GRCh38_cdna_ncrna_v99_noalt_k31_chr10"

mkdir -p $OUTPUT_DIR

for R1 in $INPUT_DIR*1.fastq.gz; 
do	
	R2=$(echo $R1 | sed 's/1.fastq.gz/2.fastq.gz/')
	OUT=$OUTPUT_DIR""$(basename $R1 '_1.fastq.gz')
	
	salmon quant -i $SALMON_IDX \
	--libType A \
	-1 $R1 \
	-2 $R2 \
	-o $OUT \
	-p 2
done
