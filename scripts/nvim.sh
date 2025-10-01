#!/bin/bash
source "$REPO_DIR/scripts/lib/pkg.sh"

echo "n\ ...Installing neovim..."
pkg_install nvim

rm -rf "$HOME/.config/nvim"
ln -s "$REPO_DIR/.config/nvim"  "$HOME/.config/nvim"
