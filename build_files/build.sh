#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 remove -y firefox

dnf5 install -y google-noto-fonts-all gnome-tweaks adw-gtk3-theme

dnf5 install -y openssl

dnf5 group install -y --with-optional virtualization

dnf5 install -y niri waybar rofi-wayland network-manager-applet blueman

# dnf5 install -y askpass

# dnf5 install -y gamescope

# NIRI
# dnf5 install -y niri xwayland-satellite

dnf5 -y copr enable solopasha/hyprland
dnf5 -y install swww
dnf5 -y copr disable solopasha/hyprland

# dnf5 -y copr enable errornointernet/quickshell
# dnf5 -y install quickshell
# dnf5 -y copr disable errornointernet/quickshell

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# sudo systemctl enable libvirtd
systemctl enable podman.socket
