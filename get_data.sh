#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <job_directory>"
  exit 1
fi

# Assign the first argument to the job_dir variable
job_dir="$1"

# Sample 1
mkdir -p "$job_dir/sample"
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR229/ERR229775/ERR229775_1.fastq.gz
mv ERR229775_1.fastq.gz "$job_dir/sample/"

# Sample 2
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR229/ERR229775/ERR229775_2.fastq.gz
mv ERR229775_2.fastq.gz "$job_dir/sample/"

# Reference (uncomment if needed)
# wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
# mkdir -p "$job_dir/reference"
# mv hg38.fa.gz "$job_dir/reference/"

# Gunzip Sample 1
gunzip "$job_dir/sample/ERR229775_1.fastq.gz"
echo "Sample 1 Gunzipped"

# Gunzip Sample 2
gunzip "$job_dir/sample/ERR229775_2.fastq.gz"
echo "Sample 2 Gunzipped"

# Gunzip Reference (uncomment if needed)
# gunzip "$job_dir/reference/hg38.fa.gz"
# echo "Reference Gunzipped"

