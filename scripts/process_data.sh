#!/bin/bash

# cd ./job

# Indexing
echo "Indexing Started"
bwa index ./reference/hg38.fa

# Alignment
echo "Alignment Started"
rm -rf ./alignment 
mkdir ./alignment
bwa mem ./reference/hg38.fa ./sample/ERR229775_1.fastq ./sample/ERR229775_2.fastq > ./alignment/ERR229775_alignment.sam

# Sort
echo "Sorting Started"
rm -rf ./sorted
mkdir ./sorted
samtools view -Sb ./alignment/ERR229775_alignment.sam 2>> sorting.log | samtools sort -o ./sorted/ERR229775_sorted.bam 2>> sorting.log

