#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"

source "$REPO_DIR/scripts/lib/pkg.sh"

install_1password() {
  if is_fedora; then
    echo "Adding 1Password GPG key..."
    sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    
    echo "Adding 1Password repository..."
    sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    
    echo "Installing 1Password..."
    sudo dnf install -y 1password
  elif is_arch; then
    echo "Installing 1Password..."
    sudo pacman -S --noconfirm --needed 1password
  fi
}

echo -e "\n...Installing 1Password..."
install_1password
echo "1Password installed successfully"
