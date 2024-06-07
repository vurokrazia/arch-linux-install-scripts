#!/bin/bash

# Install tmux
sudo pacman -Syu --noconfirm tmux

# Verify installation
if command -v tmux &> /dev/null
then
  echo "tmux installed successfully."
else
  echo "tmux installation failed."
fi
