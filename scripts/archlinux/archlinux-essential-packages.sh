#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install necessary/essential packages.
echo 'Installing the required packages.'
sudo pacman -Syu \
             git \
             openssh \
             openssl \
             pacman-contrib \
             pkgfile \
             powertop \
             reflector \
             sudo \
             tuned \
             tuned-ppd \
             unzip \
             usbutils

# Exit with a successful error code.
exit 0
