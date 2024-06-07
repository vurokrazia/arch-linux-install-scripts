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

# Install lazygit
yay -S lazygit

# Verify installation
if command -v lazygit &> /dev/null
then
  echo "lazygit installed successfully."
else
  echo "lazygit installation failed."
fi
