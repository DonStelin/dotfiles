#!/usr/bin/env bash

source "$REPO_DIR/scripts/lib/pkg.sh"

echo "n\ ...Installing tmux..."
pkg_install tmux
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

rm -rf "$HOME/.config/tmux"
ln -s "$REPO_DIR/.config/tmux" "$HOME/.config/tmux"


