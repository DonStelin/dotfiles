#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
plugin_dir="$XDG_DATA_HOME/zsh/plugins"

install_zsh() {
  sudo dnf install -y zsh
}

echo "Installing zsh..."
install_zsh

rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"

echo "Installing zshenv..."
ln -sfn "$REPO_DIR/env/.zshenv" "$HOME/.zshenv"

mkdir -p "$XDG_CONFIG_HOME"
echo "Installing zsh configuration..."
ln -sfn "$REPO_DIR/env/.config/zsh" "$XDG_CONFIG_HOME/zsh"

echo "Installing zsh plugins..."
mkdir -p "$plugin_dir"

if [ -d "$plugin_dir/zsh-syntax-highlighting/.git" ]; then
  git -C "$plugin_dir/zsh-syntax-highlighting" pull --ff-only
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugin_dir/zsh-syntax-highlighting"
fi

if [ -d "$plugin_dir/zsh-completions/.git" ]; then
  git -C "$plugin_dir/zsh-completions" pull --ff-only
else
  git clone https://github.com/zsh-users/zsh-completions "$plugin_dir/zsh-completions"
fi

if [ -d "$plugin_dir/fzf-tab/.git" ]; then
  git -C "$plugin_dir/fzf-tab" pull --ff-only
else
  git clone https://github.com/Aloxaf/fzf-tab "$plugin_dir/fzf-tab"
fi

chsh -s "$(which zsh)"
echo "Zsh installed successfully"
