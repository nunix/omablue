#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### 1. Debloat GNOME WM / Shell Stack
echo "=== Removing GNOME Shell and Mutter ==="
dnf5 remove -y \
    gnome-shell \
    gnome-shell-extension* \
    gnome-tour \
    gnome-initial-setup \
    gnome-classic-session* \
    gnome-user-docs \
    mutter \
    gdm || true

### 2. Enable COPR & Install Hyprland Ecosystem
echo "=== Enabling Solopasha Hyprland COPR ==="
dnf5 -y copr enable solopasha/hyprland

echo "=== Installing Omarchy Hyprland Desktop Packages ==="
dnf5 install -y \
    hyprland \
    xdg-desktop-portal-hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    hyprpicker \
    hyprcursor \
    hyprpolkitagent \
    waybar \
    rofi-wayland \
    swaync \
    kitty \
    greetd \
    tuigreet \
    network-manager-applet \
    blueman \
    pavucontrol \
    brightnessctl \
    playerctl \
    grim \
    slurp \
    wl-clipboard \
    cliphist \
    fastfetch \
    starship \
    tmux

# Disable COPR so it does not persist on the image
dnf5 -y copr disable solopasha/hyprland

### 3. Service Management & Greeter Configuration
echo "=== Configuring system services ==="
systemctl disable gdm.service 2>/dev/null || true
systemctl enable greetd.service
systemctl enable podman.socket

# Ensure greeter user has permissions for greetd if created
if id "greeter" &>/dev/null; then
    chmod -R 755 /etc/greetd
fi

