#!/bin/bash

sudo pacman -S --noconfirm neovim
rm -rf "$HOME/.config/nvim"
ln -s "../.config/nvim" "$HOME/.config/nvim"

