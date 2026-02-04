#!/usr/bin/env bash
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
dotfiles_dir="$REPO_DIR"
git -C "$dotfiles_dir" add .
git -C "$dotfiles_dir" commit -m "Autocommit"
git -C "$dotfiles_dir" push

