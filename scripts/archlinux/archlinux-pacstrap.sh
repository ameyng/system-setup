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
               efibootmgr \
               fwupd \
               git \
               amd-ucode \
               iptables \
               iwd \
               linux-firmware \
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
               tuned \
               tuned-ppd \
               unzip \
               usbutils \
               vim \
               zram-generator

# Exit with a successful error code.
exit 0
