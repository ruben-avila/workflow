#!/usr/bin/env bash
set -e

# Install base packages (pacman)
sudo pacman -S --needed i3-wm picom rofi alacritty zsh tmux git feh

# Run auto-link.sh to link configs
bash ./auto-link.sh

chmod u+x ./local/bin/*

# Install zsh plugins from local/share/zsh-plugins
git submodule update --init --recursive


echo "Done."


