#!/usr/bin/env bash
export DOTFILES_PATH="$HOME/Dotfiles"

echo -e "\nInstallation starting..."
echo -e "\nInstalling git"
release_file="/etc/os-release"

if grep -q "Cachy" "$release_file" || grep -q "Arch" "$release_file"; then
    sudo pacman -Syu --noconfirm --needed git
fi

if grep -q "Debian" "$release_file"; then
    sudo apt update
    sudo apt install -y git
fi

if [ -d "$DOTFILES_PATH" ]; then
    echo "The directory already exists"
else
    echo -e "\nCloning repo"
    git clone "https://github.com/DonStelin/dotfiles.git" "$HOME"
    mv "$HOME/dotfiles" "$DOTFILES_PATH"
fi

cd "$DOTFILES_PATH"
git switch main
cd - >/dev/null
