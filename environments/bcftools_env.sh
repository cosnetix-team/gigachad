#!/bin/bash

# Create a new Conda environment named 'bcftools_env' and install bcftools
echo "Creating a new Conda environment named 'bcftools_env' with bcftools..."
conda create -n bcftools_env -c bioconda -y bcftools libopenblas

# Activate the new environment
echo "Activating 'bcftools_env'..."
conda activate bcftools_env

echo "Installation complete! You can now use 'bcftools' in the 'bcftools_env' environment."

