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