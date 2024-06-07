#!/bin/bash

# Install htop
sudo pacman -Syu --noconfirm htop

# Verify installation
if command -v htop &> /dev/null
then
  echo "htop installed successfully."
else
  echo "htop installation failed."
fi
