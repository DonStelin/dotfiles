#!/usr/bin/env bash

pkg_install() {
    local release_file="/etc/os-release"

    echo "Installing $@"

    if grep -q "Cachy" "$release_file" || grep -q "Arch" "$release_file"; then
        sudo pacman -S --noconfirm --needed "$@" 1> /dev/null
    fi

    if grep -q "Debian" "$release_file"; then
        sudo apt install -y "$@" 1> /dev/null
    fi
}

