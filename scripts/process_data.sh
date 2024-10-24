#!/bin/bash

cd ./data

# Indexing
echo "Indexing Started"
bwa index ./reference/hg38.fa

# Alignment
echo "Alignment Started"
rmdir ./alignment && mkdir ./alignment
bwa mem ./reference/hg38.fa ./sample/SRR741411_1.fastq ./sample/SRR741411_2.fastq > ./alignment/SRR741411_alignment.sam

# Sort
echo "Sorting Started"
mkdir ./sorted
samtools view -Sb ./alignment/SRR741411_alignment.sam 2>> sorting.log | samtools sort -o ./sorted/SRR741411_sorted.bam 2>> sorting.log
