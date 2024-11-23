#!/bin/bash

echo "Updating system and installing Miniconda..."
# Update system and install Miniconda
sudo apt update && sudo apt upgrade -y

# Download Miniconda installer script
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

# Install Miniconda
bash miniconda.sh -b -p $HOME/miniconda

# Initialize Conda
$HOME/miniconda/bin/conda init

# Activate Conda in current shell
source ~/.bashrc

# Remove Miniconda installer script
rm miniconda.sh

echo "Configuring Conda channels for Bioconda..."
# Add channels for Bioconda
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

echo "Updating Conda and creating a new environment for bioinformatics..."
# Update Conda
conda update -n base -c defaults conda -y

# Create a new environment named 'bioenv'
conda create -n bioenv -y

# Activate the environment
conda activate bioenv

echo "Installing GATK..."
# Install GATK
conda install -c bioconda gatk -y

echo "Installation complete! Use 'conda activate bioenv' to start using GATK."

