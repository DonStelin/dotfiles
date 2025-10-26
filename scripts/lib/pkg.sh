#!/usr/bin/env bash

# TODO: handle packages that require more steps
#
pkg_install() {
    source /etc/os-release

    echo "Installing $@"

    if [ "$ID" = "arch" ] || [ "$ID" = "cachyos" ]; then
        sudo pacman -S --noconfirm --needed "$@"
        return
    fi

    if [ "$ID" = "debian" ] || [ "$ID" = "ubuntu" ]; then
        sudo apt-get update -y
        sudo apt-get install -y "$@"
        return
    fi

    if [ "$ID" = "fedora" ]; then
        sudo dnf install -y "$@"
        return
    fi
}
