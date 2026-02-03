#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source "$REPO_DIR/scripts/lib/pkg.sh"

install_zsh() {
  if is_fedora; then
    sudo dnf install -y zsh
  elif is_arch; then
    sudo pacman -S --noconfirm --needed zsh
  fi
}

echo -e "\n...Installing zsh..."
install_zsh

rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshenv"
rm -rf "$HOME/.config/zsh"

echo "Linking zshenv..."
ln -s "$REPO_DIR/env/.zshenv" "$HOME/.zshenv"

mkdir -p "$HOME/.config"
echo "Linking zsh configuration directory..."
ln -s "$REPO_DIR/env/.config/zsh" "$HOME/.config/zsh"

echo "Zsh installed successfully"
