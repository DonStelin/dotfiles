#!/usr/bin/env bash

selected=$(tmux list-sessions -F "#{session_name}" | fzf)
[ -z "$selected" ] && exit 0

tmux switch-client -t "$selected"
