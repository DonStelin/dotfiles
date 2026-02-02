#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
script_dir="$REPO_DIR/scripts"

bash "$script_dir/nvim.sh"
bash "$script_dir/font.sh"
bash "$script_dir/tmux.sh"
bash "$script_dir/ghostty.sh"
bash "$script_dir/1password.sh"
bash "$script_dir/dev.sh"
bash "$script_dir/global.sh"
bash "$script_dir/hyprland.sh"
bash "$script_dir/gaming.sh"




