#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
nvim_path="$XDG_CONFIG_HOME/nvim"

install_neovim() {
  sudo dnf install -y neovim
}

echo "Installing neovim..."
install_neovim

rm -rf "$nvim_path"
echo "Installing neovim configuration..."
ln -sfn "$REPO_DIR/env/.config/nvim" "$nvim_path"
echo "Neovim installed successfully"
