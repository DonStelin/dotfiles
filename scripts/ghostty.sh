#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
ghostty_path="$XDG_CONFIG_HOME/ghostty"
ghostty_config="$REPO_DIR/env/.config/ghostty"

install_ghostty() {
  sudo dnf install -y ghostty
}

echo -e "\n...Installing ghostty..."
install_ghostty

rm -rf "$ghostty_path"
mkdir -p "$XDG_CONFIG_HOME"
ln -s "$ghostty_config" "$ghostty_path"

echo "Ghostty configuration linked successfully"
