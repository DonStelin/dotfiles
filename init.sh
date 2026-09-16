#!/usr/bin/env bash
export REPO_DIR="$HOME/Dotfiles"

echo "Installing dotfiles..."
echo "Installing git..."

sudo dnf update -y
sudo dnf install -y git

if [ -d "$REPO_DIR" ]; then
  echo "The directory already exists"
else
  echo "Cloning dotfiles repository..."
  git clone "https://github.com/DonStelin/dotfiles.git" "$REPO_DIR"

fi

git -C "${REPO_DIR}" remote set-url origin git@github.com:DonStelin/dotfiles.git
git -C "${REPO_DIR}" switch main

bash "$REPO_DIR/scripts/install.sh"
