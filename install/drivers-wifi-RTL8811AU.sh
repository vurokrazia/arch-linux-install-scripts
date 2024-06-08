#!/bin/bash

# Function to install yay
install_yay() {
  echo "Installing yay..."
  sudo pacman -S --needed git base-devel
  cd /opt
  sudo git clone https://aur.archlinux.org/yay.git
  sudo chown -R $USER:users yay
  cd yay
  makepkg -si
}

# Check if yay is installed
if ! command -v yay &> /dev/null
then
  install_yay
else
  echo "yay is already installed."
fi

# Install rtl88xxau driver
yay -S rtl88xxau-aircrack-dkms-git

# Load the module
sudo modprobe 88xxau

# Install and start NetworkManager
sudo pacman -Syu --noconfirm networkmanager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Verify installation
if command -v nmtui &> /dev/null
then
  echo "Drivers installed and NetworkManager started. Use 'nmtui' to connect to WiFi."
else
  echo "Installation failed."
fi

# Prompt to run nmtui
read -p "Would you like to run 'nmtui' to connect to a WiFi network now? (y/n): " answer
if [ "$answer" == "y" ]; then
  nmtui
fi
