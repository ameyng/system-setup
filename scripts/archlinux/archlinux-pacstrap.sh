#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install necessary/essential packages.
echo 'Installing the required packages.'
pacstrap -i -P /mnt \
               base \
               bash \
               bash-completion \
               cryptsetup \
               dracut \
               efibootmgr \
               fwupd \
               git \
               intel-ucode \
               iptables \
               iwd \
               linux-firmware-cirrus \
               linux-firmware-intel \
               linux-firmware-nvidia \
               linux-firmware-other \
               linux-firmware-realtek \
               linux-lts \
               linux-lts-headers \
               lvm2 \
               man-db \
               mkinitcpio \
               networkmanager \
               openssh \
               openssl \
               pacman-contrib \
               pkgfile \
               plymouth \
               powertop \
               reflector \
               sudo \
               terminus-font \
               tmux \
               unzip \
               usbutils \
               vim

# Exit with a successful error code.
exit 0
