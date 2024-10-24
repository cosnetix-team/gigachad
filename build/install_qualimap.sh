#!/bin/bash

echo "Installing Qualimap..."

# Download Qualimap
echo "Downloading Qualimap..."
wget -q https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v2.2.2.zip

# Unzip the package
echo "Unzipping Qualimap..."
unzip -q qualimap_v2.2.2.zip

# Move it to /opt for system-wide availability
echo "Moving Qualimap to /opt..."
sudo mv qualimap /opt/

# Create a symlink to make it accessible from anywhere
echo "Creating symlink for Qualimap..."
sudo ln -s /opt/qualimap/qualimap /usr/local/bin/qualimap

# Clean up
echo "Cleaning up Qualimap installation files..."
rm qualimap_v2.2.2.zip

echo "Qualimap installation complete."
