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

# Install ctop
yay -S ctop

# Verify installation
if command -v ctop &> /dev/null
then
  echo "ctop installed successfully."
else
  echo "ctop installation failed."
fi
