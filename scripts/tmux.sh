#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source "$REPO_DIR/scripts/lib/pkg.sh"

tmux_path="$HOME/.config/tmux"
tmux_config="$REPO_DIR/env/.config/tmux"
tpm_path="$HOME/.tmux/plugins/tpm"

install_tmux() {
    if is_fedora; then
        # TODO: Logica fedora
        :
    elif is_arch; then
        sudo pacman -S --noconfirm --needed tmux
    fi
}

echo -e "\n ...Installing tmux..."
install_tmux

rm -rf "$tmux_path"
mkdir "$tmux_path"
rm -rf $HOME/.config/tmux/tmux.conf
rm -rf $HOME/.config/tmux/tmux-nerd-font-window-name.yml

ln -s "$tmux_config/tmux-nerd-font-window-name.yml" "$tmux_path/tmux-nerd-font-window-name.yml"
ln -s "$tmux_config/tmux.conf" "$tmux_path/tmux.conf"

rm -rf "$tpm_path"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"

"$tpm_path/bin/install_plugins"
