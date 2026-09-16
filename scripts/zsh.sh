#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"

install_zsh() {
  sudo dnf install -y zsh
}

echo -e "\n...Installing zsh..."
install_zsh

rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"

echo "Linking zshenv..."
ln -s "$REPO_DIR/env/.zshenv" "$HOME/.zshenv"

mkdir -p "$XDG_CONFIG_HOME"
echo "Linking zsh configuration directory..."
ln -s "$REPO_DIR/env/.config/zsh" "$XDG_CONFIG_HOME/zsh"

chsh -s $(which zsh)
echo "Zsh installed successfully"
