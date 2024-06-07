#!/bin/bash

# Install neovim
sudo pacman -Syu --noconfirm neovim

# Verify installation
if command -v nvim &> /dev/null
then
  echo "neovim installed successfully."
else
  echo "neovim installation failed."
fi
