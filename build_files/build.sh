#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

echo "=== Installing Omarchy Layer Packages ==="
dnf5 install -y --skip-unavailable \
    quickshell \
    fastfetch \
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
    ImageMagick \
    socat \
    bc \
    jq \
    lua \
    git \
    tar \
    xz \
    curl \
    wget || true

echo "=== Installing Mise Runtime Manager ==="
curl -fL https://mise.jdx.dev/mise-latest-linux-x64 -o /usr/bin/mise
chmod 755 /usr/bin/mise

echo "=== Installing Gum TUI Utility ==="
curl -fsSL "https://github.com/charmbracelet/gum/releases/download/v0.17.0/gum_0.17.0_Linux_x86_64.tar.gz" | tar -xz -C /usr/bin/ --wildcards '*/gum' --strip-components=1
chmod 755 /usr/bin/gum

echo "=== Installing JetBrainsMono Nerd Font ==="
mkdir -p /usr/share/fonts/JetBrainsMono
curl -fL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz -o /tmp/JetBrainsMono.tar.xz
tar -xJf /tmp/JetBrainsMono.tar.xz -C /usr/share/fonts/JetBrainsMono
rm -f /tmp/JetBrainsMono.tar.xz

echo "=== Deploying Omarchy Quattro Core ==="
if [ ! -d /usr/share/omarchy ]; then
    git clone --branch omaweed https://github.com/nunix/omarchy.git /usr/share/omarchy
fi

# Install Omarchy font and symlink binaries
mkdir -p /usr/share/fonts/omarchy /usr/local/bin
if [ -f /usr/share/omarchy/config/omarchy.ttf ]; then
    cp /usr/share/omarchy/config/omarchy.ttf /usr/share/fonts/omarchy/
fi

for bin in /usr/share/omarchy/bin/*; do
    [ -f "$bin" ] || continue
    bname=$(basename "$bin")
    ln -sf "$bin" "/usr/bin/$bname"
    ln -sf "$bin" "/usr/local/bin/$bname"
done

# Symlink omablue-update
if [ -f /usr/bin/omablue-update ]; then
    ln -sf /usr/bin/omablue-update /usr/bin/omarchy-update
    ln -sf /usr/bin/omablue-update /usr/local/bin/omarchy-update
fi

fc-cache -f /usr/share/fonts

echo "=== Enabling System Services ==="
systemctl enable podman.socket


