#!/bin/bash

# Sample 1
mkdir ./job/sample 
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR741/SRR741411/SRR741411_1.fastq.gz
mv SRR741411_1.fastq.gz ./job/sample

# Sample 2
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR741/SRR741411/SRR741411_2.fastq.gz
mv SRR741411_2.fastq.gz ./job/sample

# Reference
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
mkdir -p ./job/reference
mv hg38.fa.gz ./job

# Guntar Sample 1
gunzip ./job/sample/SRR741411_1.fastq.gz
echo "Sample 1 Gunzipped"

# Guntar Sample 2
gunzip ./job/sample/SRR741411_2.fastq.gz
echo "Sample 2 Gunzipped"

# Guntar Reference
gunzip ./job/reference/hg38.fa.gz
echo "done"
