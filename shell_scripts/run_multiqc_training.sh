#!/bin/bash

INPUT_DIR="./FastQC/FastQC_output_100K"
OUTPUT_DIR="./MultiQC_reports/"

mkdir -p $OUTPUT_DIR

multiqc -o $OUTPUT_DIR \
--title "FastQC training 100K" \
--filename "fastqc_report_training_100K" \
--cl_config "fastqc_config: { fastqc_theoretical_gc: hg38_txome }" \
--module fastqc \
--force \
$INPUT_DIR
