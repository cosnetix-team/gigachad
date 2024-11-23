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

