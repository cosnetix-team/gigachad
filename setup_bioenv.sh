echo "Configuring Conda channels for Bioconda..."
# Add channels for Bioconda
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

echo "Updating Conda and creating a new environment for bioinformatics..."
# Update Conda
conda update -n base -c defaults conda -y

# Create a new environment named 'bioenv'
conda create -n bioenv -y gatk picard

# Activate the environment
source activate bioenv

echo "Installing Java using Ubuntu's package manager..."
sudo apt update
sudo apt install -y openjdk-17-jdk  # You can specify a different version if needed

echo "Verifying Java installation..."
java -version  # Check that Java is installed and working

# Configure local system for locale settings if needed
echo "Configuring local system for Picard..."
sudo apt install -y locales
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

echo "Installation complete! Use 'conda activate bioenv' to start using GATK."

