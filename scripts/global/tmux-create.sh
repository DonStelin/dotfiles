#!/usr/bin/env bash
target=$(
    {

        find "$HOME/Environment"  -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/College"  -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/Dev"      -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/Notes"    -mindepth 0 -maxdepth 1 -type d -print
    } | fzf --height=90% --border=rounded --margin=15%,20%
)

path="$target/$1"
mkdir "$path"

if [ -n "$TMUX" ]; then
    tmux new-session -d -s "$1" -c "$path"
    tmux switch-client -t "$1"
else
    tmux new-session -s "$1" -c "$path"
fi
