#!/usr/bin/env bash
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source "$REPO_DIR/scripts/lib/pkg.sh"
nvim_path="$HOME/.config/nvim"

install_neovim() {
    if is_fedora; then
        # TODO: Logica fedora
        :
    elif is_arch; then
        sudo pacman -S --noconfirm --needed neovim
    fi
}

echo -e "n\ ...Installing neovim..."
install_neovim

rm -rf "$nvim_path"
ln -s "$REPO_DIR/env/.config/nvim"  "$nvim_path"
