#!/bin/bash

# Variables
lavalink_config="https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/application.yml"
start_script="https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/start.sh"
lavasrc_plugin_jar="https://github.com/topi314/LavaSrc/releases/download/4.0.1/lavasrc-plugin-4.0.1.jar"
lavalink_jar="https://github.com/lavalink-devs/Lavalink/releases/download/4.0.4/Lavalink.jar"

# Function to install nvm for Linux
install_nvm() {
    wget -O- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc
}

# Function to check if Node.js is installed
checkNode() {
    read -p "Have you already installed Node.js? (yes/no): " nodeInstalled
    if [[ $nodeInstalled == "yes" ]]; then
        echo "Node.js is already installed."
    elif [[ $nodeInstalled == "no" ]]; then
        # Install Node.js 18
        nvm install 18
    else
        echo "Invalid input. Please enter 'yes' or 'no'."
        checkNode
    fi
}

# Call function to install nvm
install_nvm

# Call function to check Node.js installation
checkNode

# Create plugins directory
mkdir -p plugins

# Download and move lavasrc-plugin using wget
wget "$lavasrc_plugin_jar" -O plugins/lavasrc-plugin-4.0.1.jar

# Download lavalink and start script using wget
wget "$lavalink_jar" -O Lavalink.jar
wget "$start_script" -O start.sh
wget "$lavalink_config" -O application.yml

# Install pm2
npm install pm2 -g

# Start Lavalink with pm2
pm2 start start.sh --interpreter=bash

echo "Lavalink setup completed."