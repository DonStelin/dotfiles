#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source "$REPO_DIR/scripts/lib/pkg.sh"
nvim_path="$XDG_CONFIG_HOME/nvim"

install_neovim() {
  if is_fedora; then
    sudo dnf install -y neovim
  elif is_arch; then
    sudo pacman -S --noconfirm --needed neovim
  fi
}

echo -e "\n...Installing neovim..."
install_neovim

rm -rf "$nvim_path"
echo "Linking neovim configuration..."
ln -s "$REPO_DIR/env/.config/nvim" "$nvim_path"
echo "Neovim installed successfully"
