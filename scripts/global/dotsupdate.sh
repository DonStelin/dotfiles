#!/usr/bin/env bash
dotfiles_dir="$HOME/Dotfiles"
git -C "$dotfiles_dir" add .
git -C "$dotfiles_dir" commit -m "Autocommit"
git -C "$dotfiles_dir" push

