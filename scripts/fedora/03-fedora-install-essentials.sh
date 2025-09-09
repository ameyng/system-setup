#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo 'Installing the required packages.'
sudo dnf install \
         --assumeyes \
         --refresh \
         --allowerasing \
         --setopt=fastestmirror=True \
         --setopt=gpgcheck=True \
         --setopt=localpkg_gpgcheck=True \
	 vim \
	 git \
	 mokutil \
	 openssl \
	 ShellCheck \
	 shfmt \
	 powertop \
         flatpak

# Exit with a successful error code.
exit 0
