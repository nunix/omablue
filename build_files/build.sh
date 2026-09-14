#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

echo "=== Installing Omarchy Layer Packages ==="
dnf5 install -y \
    fastfetch \
    starship \
    tmux \
    zsh \
    distrobox \
    cliphist \
    brightnessctl \
    playerctl \
    pavucontrol \
    blueman \
    network-manager-applet || true

echo "=== Enabling System Services ==="
systemctl enable podman.socket


