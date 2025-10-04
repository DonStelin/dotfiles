#!/usr/bin/env bash
source "$REPO_DIR/scripts/lib/pkg.sh"
nvim_path="$HOME/.config/nvim"

echo -e "n\ ...Installing neovim..."
pkg_install neovim

rm -rf "$nvim_path"
ln -s "$REPO_DIR/env/.config/nvim"  "$nvim_path"
