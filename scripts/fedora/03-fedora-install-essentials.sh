#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo 'Installing the required packages.'
sudo dnf install \
         --assumeyes \
         --refresh \
         --offline \
         --setopt=fastestmirror=True \
         --setopt=gpgcheck=True \
         --setopt=localpkg_gpgcheck=True \
	 vim \
	 git \
	 kmodtool \
	 akmods \
	 mokutil \
	 openssl \
	 ShellCheck \
	 shfmt \
	 powertop \
	 iwd

echo ''
echo 'It is recommended to reboot immediately by running the below command:'
echo 'sudo dnf offline reboot --assumeyes'

# Exit with a successful error code.
exit 0
