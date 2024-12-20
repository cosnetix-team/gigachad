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

# Install GATK
echo "Installing GATK..."
conda install -c bioconda gatk -y

echo "installing java"
conda install -c conda-forge openjdk

echo "Installing Picard"
conda install -c bioconda picard -y

echo "Configuring local system for picard"
sudo apt update
sudo apt install -y locales
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
echo "Installation complete! Use 'conda activate bioenv' to start using GATK."
