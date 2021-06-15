#!/bin/bash

INPUT_DIR="./Fastq_files/Fastq_training_subsample_100K/"
OUTPUT_DIR="./FastQC/FastQC_output_100K"

mkdir -p $OUTPUT_DIR

for FASTQ_FILE in $INPUT_DIR*.fastq.gz;  
do
	echo $FASTQ_FILE
	fastqc -o $OUTPUT_DIR -f fastq --noextract $FASTQ_FILE
done
