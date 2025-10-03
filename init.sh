#!/usr/bin/env bash
export REPO_DIR="$HOME/Dotfiles"

echo -e "\nInstallation starting..."
echo -e "\nInstalling git"
release_file="/etc/os-release"

if grep -q "Cachy" "$release_file" || grep -q "Arch" "$release_file"; then
    sudo pacman -Syu --noconfirm --needed git paru
fi

if grep -q "Debian" "$release_file" || grep -q "Ubuntu" "$release_file"; then
    sudo apt update
    sudo apt install -y git
fi

if [ -d "$REPO_DIR" ]; then
    echo "The directory already exists"
else
    echo -e "\nCloning repo"
    git clone "https://github.com/DonStelin/dotfiles.git" "$REPO_DIR"
fi

git -C "${REPO_DIR}" switch main

bash "$REPO_DIR/scripts/install.sh"
