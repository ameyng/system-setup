#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# RPM Fusion.
echo "Setting up the 'RPM Fusion' repositories."

# Initialize the current version of 'Fedora'.
fedora_version="$(rpm -E %fedora)"

# Check if the RPM Fusion free repository key exists on the system.
echo 'Checking if the keys for RPM Fusion free repositories exist on the system.'

if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}" ]; then

  # Import the key.
  echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}"

fi

# Check if the RPM Fusion non-free repository key exists on the system.
echo 'Checking if the keys for RPM Fusion non-free repositories exist on the system.'

if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}" ]; then

  # Import the key.
  echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}"

fi

# Install the repositories.
echo 'Installing the RPM Fusion free and non-free repositories.'
sudo dnf install --assumeyes --setopt=localpkg_gpgcheck=1 https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"${fedora_version}".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"${fedora_version}".noarch.rpm

# Unset the variables used.
unset fedora_version

# Enable the Cisco OpenH264 repository.
echo "Enabling the 'Cisco OpenH264' repository."
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Update the AppStream metadata.
echo "Updating AppStream metadata for the 'RPM Fusion' repositories."
sudo dnf install --assumeyes "rpmfusion-*-appstream-data"

# WezTerm Nightly.
echo "Setting up the 'WezTerm Nightly' COPR repository."
sudo dnf copr enable --assumeyes wezfurlong/wezterm-nightly

# Exit with a successful error code.
exit 0
