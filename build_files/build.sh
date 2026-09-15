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
    network-manager-applet \
    cascadia-code-nf-fonts \
    cascadia-mono-nf-fonts \
    jetbrains-mono-fonts-all \
    tar \
    xz \
    curl \
    wget || true

echo "=== Installing Mise Runtime Manager ==="
curl -fL https://mise.jdx.dev/mise-latest-linux-x64 -o /usr/bin/mise
chmod 755 /usr/bin/mise

echo "=== Installing JetBrainsMono Nerd Font ==="
mkdir -p /usr/share/fonts/JetBrainsMono
curl -fL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz -o /tmp/JetBrainsMono.tar.xz
tar -xJf /tmp/JetBrainsMono.tar.xz -C /usr/share/fonts/JetBrainsMono
rm -f /tmp/JetBrainsMono.tar.xz
fc-cache -f /usr/share/fonts

echo "=== Enabling System Services ==="
systemctl enable podman.socket


