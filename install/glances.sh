#!/bin/bash

# Install glances
sudo pacman -Syu --noconfirm glances

# Verify installation
if command -v glances &> /dev/null
then
  echo "glances installed successfully."
else
  echo "glances installation failed."
fi
