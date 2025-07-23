#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo 'Updating system packages.'
sudo dnf upgrade \
         --assumeyes \
         --refresh \
         --offline \
         --setopt=fastestmirror=True \
         --setopt=gpgcheck=True \
         --setopt=localpkg_gpgcheck=True

echo ''
echo 'It is recommended to reboot immediately by running the below command:'
echo 'sudo dnf offline reboot --assumeyes'

# Exit with a successful error code.
exit 0
