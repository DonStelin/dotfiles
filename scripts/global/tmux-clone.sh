#!/usr/bin/env bash

target=$(
    {
        find "$HOME/Environment" -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/College"     -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/Dev"         -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/Notes"       -mindepth 0 -maxdepth 1 -type d -print
    } | fzf --height=90% --border=rounded --margin=15%,20%
)

name="$(basename "${1%.git}")"
dest="$target/$name"

git clone "$1" "$dest"

if [ -n "$TMUX" ]; then
    tmux new-session -d -s "$name" -c "$dest"
    tmux switch-client -t "$name"
else
    tmux new-session -s "$name" -c "$dest"
fi
