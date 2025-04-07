#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install -y tmux adw-gtk3-theme google-noto-fonts-all steam gamescope telegram-desktop
dnf group install -y --with-optional virtualization

cd /tmp
wget https://li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-3.0-1.noarch.rpm
wget https://li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-vista-3.0-1.noarch.rpm

dnf install -y ./webcore-fonts*

wget https://github.com/amnezia-vpn/amnezia-client/releases/download/4.8.5.0/AmneziaVPN_4.8.5.0_linux.tar.zip
unzip AmneziaVPN_4.8.5.0_linux.tar.zip
tar xvf AmneziaVPN_4.8.5.0_linux.tar
cd AmneziaVPN_4.8.5.0_linux
AmneziaVPN_Linux_Installer.bin install


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable libvirtd

systemctl enable podman.socket
