#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
ghostty_path="$XDG_CONFIG_HOME/ghostty"
ghostty_config="$REPO_DIR/env/.config/ghostty"

source "$REPO_DIR/scripts/lib/pkg.sh"

install_ghostty() {
  if is_fedora; then
    sudo dnf install -y ghostty
  elif is_arch; then
    sudo pacman -S --noconfirm --needed ghostty
  fi
}

echo -e "\n...Installing ghostty..."
install_ghostty

rm -rf "$ghostty_path"
mkdir -p "$XDG_CONFIG_HOME"
ln -s "$ghostty_config" "$ghostty_path"

echo "Ghostty configuration linked successfully"
