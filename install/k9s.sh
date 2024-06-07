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

# Install k9s
yay -S k9s

# Verify installation
if command -v k9s &> /dev/null
then
  echo "k9s installed successfully."
else
  echo "k9s installation failed."
fi
