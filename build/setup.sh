#!/bin/bash

echo "Starting system update and upgrade..."
# Update package list and upgrade all packages
sudo apt update && sudo apt upgrade -y

echo "Installing essential tools..."
# Install essential tools
sudo apt install -y \
    git \
    wget \
    vim \
    curl \
    build-essential \
    software-properties-common \
    zip \
    unzip \
    htop \
    net-tools

echo "Adding deadsnakes PPA for Python 3.11..."
# Install Python 3.11 from deadsnakes PPA
sudo add-apt-repository ppa:deadsnakes/ppa -y

echo "Updating package list after adding PPA..."
sudo apt update

echo "Installing Python 3.11 and related packages..."
sudo apt install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    python3.11-distutils \
    python3.11-lib2to3

echo "Downloading get-pip.py..."
# Download get-pip.py from the official source
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py

echo "Installing pip for Python 3.11..."
# Install pip for Python 3.11 using get-pip.py
sudo python3.11 get-pip.py

echo "Upgrading pip and installing virtualenv..."
# Install virtualenv using the newly installed pip
sudo python3.11 -m pip install --upgrade pip
sudo python3.11 -m pip install virtualenv

echo "Cleaning up get-pip.py..."
# Clean up
rm get-pip.py

echo "Base setup complete! Use 'python3.11' and 'python3.11 -m pip' for Python 3.11."
