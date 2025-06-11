#!/bin/bash

echo "Setting up PySpark on macOS M1..."

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Java 8 (Temurin)
echo "Installing Java 8 (Temurin)..."
brew install --cask temurin8

# Set JAVA_HOME to Java 8
JAVA_HOME_8=$(/usr/libexec/java_home -v1.8)
echo "Setting JAVA_HOME to $JAVA_HOME_8"
echo "export JAVA_HOME=$JAVA_HOME_8" >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
export JAVA_HOME=$JAVA_HOME_8
export PATH=$JAVA_HOME/bin:$PATH

# Reload shell config
source ~/.zshrc

# Create virtual environment for PySpark
echo "Creating Python virtual environment..."
python3 -m venv pyspark_env
source pyspark_env/bin/activate

# Upgrade pip and install PySpark
pip install --upgrade pip
pip install pyspark jupyterlab

echo "✅ Setup complete."
echo "To activate the environment, run: source pyspark_env/bin/activate"
echo "To start JupyterLab, run: jupyter lab"
