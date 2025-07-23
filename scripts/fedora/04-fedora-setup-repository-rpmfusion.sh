#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo "Setting up the 'RPM Fusion' repositories."

# Initialize the current version of 'Fedora'.
fedora_version="$(rpm -E %fedora)"

echo ''
echo 'Checking if the keys for the RPM Fusion free repositories exist on the system.'

if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}" ]; then

  echo ''
  echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}"

  echo ''
  echo "Installing the 'RPM Fusion' free repository."
  sudo dnf install \
           --assumeyes \
           --refresh \
           --setopt=fastestmirror=True \
           --setopt=gpgcheck=True \
           --setopt=localpkg_gpgcheck=True \
           https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"${fedora_version}".noarch.rpm \

  echo ''
  echo "Enabling the 'Cisco OpenH264' repository."
  sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

  echo ''
  echo "Updating AppStream metadata for the 'RPM Fusion' free repositories."
  sudo dnf install \
           --assumeno \
           --refresh \
           --setopt=fastestmirror=True \
           --setopt=gpgcheck=True \
           --setopt=localpkg_gpgcheck=True \
           rpmfusion-free-appstream-data

else

  echo ''
  echo "The key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}' does not exist on the system."

fi

echo ''
echo 'Checking if the keys for RPM Fusion non-free repositories exist on the system.'

if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}" ]; then

  echo ''
  echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}"

  echo ''
  echo "Installing the 'RPM Fusion' non-free repository."
  sudo dnf install \
           --assumeyes \
           --refresh \
           --setopt=fastestmirror=True \
           --setopt=gpgcheck=True \
           --setopt=localpkg_gpgcheck=True \
           https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"${fedora_version}".noarch.rpm \

  echo ''
  echo "Enabling the 'Cisco OpenH264' repository."
  sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

  echo ''
  echo "Updating AppStream metadata for the 'RPM Fusion' non-free repositories."
  sudo dnf install \
           --assumeno \
           --refresh \
           --setopt=fastestmirror=True \
           --setopt=gpgcheck=True \
           --setopt=localpkg_gpgcheck=True \
           rpmfusion-nonfree-appstream-data

else

  echo ''
  echo "The key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}' does not exist on the system."

fi

# Unset the variables used.
unset fedora_version

# Exit with a successful error code.
exit 0
