#!/usr/bin/env bash
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"

source "$REPO_DIR/scripts/lib/pkg.sh"

install_gamemode() {
  if is_fedora; then
    sudo dnf install -y gamemode
  elif is_arch; then
    sudo pacman -S --noconfirm --needed gamemode
  fi
}

echo -e "\n...Installing gamemode..."
install_gamemode
echo "Gamemode installed successfully"
