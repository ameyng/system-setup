#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install necessary/essential packages.
echo 'Installing the required packages.'
pacstrap -i -P /mnt \
               base \
               base-devel \
               bash \
               bash-completion \
               cryptsetup \
               dracut \
               efibootmgr \
               elinks \
               exfatprogs \
               git \
               intel-ucode \
               iptables \
               iwd \
               linux-firmware-cirrus \
               linux-firmware-intel \
               linux-firmware-nvidia \
               linux-firmware-other \
               linux-firmware-realtek \
               linux-firmware-whence \
               linux-lts \
               linux-lts-headers \
               lvm2 \
               man-db \
               networkmanager \
               openssh \
               openssl \
               pacman-contrib \
               pkgfile \
               powertop \
               reflector \
               sudo \
               terminus-font \
               tuned \
               tuned-ppd \
               unzip \
               usbutils \
               vim

# Exit with a successful error code.
exit 0
