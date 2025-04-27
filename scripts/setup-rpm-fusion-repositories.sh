#!/usr/bin/env bash

# Check if the RPM Fusion free repository key exists on the system.
echo -e "Checking if the keys for RPM Fusion free repositories exist on the system."

if [[ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$(rpm -E %fedora)" ]]; then

  # Import the key.
  echo -e "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$(rpm -E %fedora)'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$(rpm -E %fedora)"

fi

# Check if the RPM Fusion non-free repository key exists on the system.
echo -e "Checking if the keys for RPM Fusion non-free repositories exist on the system."

if [[ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$(rpm -E %fedora)" ]]; then

  # Import the key.
  echo -e "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$(rpm -E %fedora)'."
  sudo rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$(rpm -E %fedora)"

fi

# Install the repositories.
echo -e 'Installing the RPM Fusion free and non-free repositories.'
sudo dnf install --refresh --assumeyes "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Enable the Cisco OpenH264 repository.
echo -e 'Enabling the Cisco OpenH264 repository.'
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Update the AppStream metadata.
echo -e 'Updating AppStream metadata.'
sudo dnf install --refresh --assumeyes "rpmfusion-*-appstream-data"
