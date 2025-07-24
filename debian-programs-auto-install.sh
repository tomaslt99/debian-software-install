#!/bin/bash

set -e

# Update package list
sudo apt update

# Install essential tools
sudo apt install -y curl gnupg apt-transport-https software-properties-common

# Install Codium
curl -fsSL https://packages.vscodium.com/pub.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://packages.vscodium.com/debs vscodium main" | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install -y codium

# Install Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Install Firefox ESR
sudo apt install -y firefox-esr

# Install LibreWolf
echo "deb [arch=amd64] http://deb.librewolf