#!/bin/bash

echo "Updating package list..."
sudo apt update

echo "Installing bioinformatics tools via apt..."
sudo apt install -y \
    bwa \
    samtools \
    fastqc \
    bedtools \
    bcftools \
    libhts-dev

echo "Bioinformatics tools installed via apt."
