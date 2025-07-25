#!/bin/bash

# Update package list
sudo apt update
sudo apt upgrade -y

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# Chromium
sudo apt install chromium -y

# Firefox
sudo apt-get install firefox-esr -y

# vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi-browser.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=amd64] https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
sudo apt update
sudo apt install vivaldi-stable -y

# librewolf
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# vlc
sudo apt install vlc -y

# virt-manager
sudo apt-get install virt-manager -y

# telegram-desktop
sudo apt-get install telegram-desktop -y


# RustDesk
sudo apt install -y wget xvfb libgtk-3-0 libnotify4 libglib2.0-0 libnss3 libxss1 libasound2
wget https://github.com/rustdesk/rustdesk/releases/download/1.3.3/rustdesk-1.3.3-x86_64.deb
sudo dpkg -i rustdesk-1.3.3-x86_64.deb
sudo apt install -f  # Fix missing dependencies
# at this time only this way can install Rustdesk so after installling RustDesk Upgrade package list

# Install Codium
# MIGHT NEED FIX IT
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg     | gpg --dearmor     | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main'     | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium


#---
#Setting up Network Time Protocol (NTP) on Debian 12

# Install ntpd
sudo apt update
sudo apt install ntp -y

# Configure ntpd
sudo tee /etc/ntp.conf > /dev/null << 'EOF'
server 0.debian.pool.ntp.org iburst
server 1.debian.pool.ntp.org iburst
EOF

# Restart and Check Sync
sudo systemctl restart ntp
#---