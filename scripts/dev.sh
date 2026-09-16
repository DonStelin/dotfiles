#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
yazi_path="$XDG_CONFIG_HOME/yazi"

echo "Installing terminal and dev tools..."

echo "Installing yazi..."
sudo dnf copr enable --assumeyes lihaohong/yazi
sudo dnf install -y yazi

echo "Installing lazygit..."
sudo dnf copr enable --assumeyes dejan/lazygit
sudo dnf install -y lazygit

echo "Installing ripgrep..."
sudo dnf install -y ripgrep

echo "Installing fzf..."
sudo dnf install -y fzf

echo "Installing bat..."
sudo dnf install -y bat

echo "Installing golang..."
sudo dnf install -y golang

echo "Installing typst..."
sudo dnf install -y typst

echo "Installing rustup..."
sudo dnf install -y rustup

echo "Installing fd..."
sudo dnf install -y fd-find

echo "Installing yazi plugins..."
ya pkg add dedukun/bookmarks

echo "Installing yazi configuration..."
ln -sfn "$REPO_DIR/env/.config/yazi" "$yazi_path"
echo "Yazi configuration installed successfully"

echo "Creating directories..."
mkdir -p "$HOME"/{College,Dev,Environment,Cloud,Documents}
echo "Directories created successfully"
