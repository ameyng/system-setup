#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Get the ID of the current user.
current_user_id="$(id -u)"

# Check if the script is not running as 'root'.
if [ "${current_user_id}" -ne 0 ]; then

  echo "Script is not running as 'root'."
  echo "Attempting to switch to 'root'."

  # Re-execute this script as 'root'.
  exec sudo "$0" "$@"

  # Due to the 'exec' command above, the below lines of code will not execute if the script succeeds running as 'root'.
  echo "Failed to switch to the 'root' user."
  exit 1

# Otherwise, if the script is running as 'root'.
else

  # Unset the variables used.
  unset current_user_id

  # RPM Fusion.
  echo "Setting up the 'RPM Fusion' repositories."

  # Initialize the current version of 'Fedora'.
  fedora_version="$(rpm -E %fedora)"

  # Check if the RPM Fusion free repository key exists on the system.
  echo 'Checking if the keys for RPM Fusion free repositories exist on the system.'

  if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}" ]; then

    # Import the key.
    echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}'."
    rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${fedora_version}"

  fi

  # Check if the RPM Fusion non-free repository key exists on the system.
  echo 'Checking if the keys for RPM Fusion non-free repositories exist on the system.'

  if [ -f "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}" ]; then

    # Import the key.
    echo "Importing key: '/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}'."
    rpmkeys --import "/usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${fedora_version}"

  fi

  # Install the repositories.
  echo 'Installing the RPM Fusion free and non-free repositories.'
  dnf install --refresh --assumeyes --setopt=localpkg_gpgcheck=1 "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${fedora_version}.noarch.rpm" "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${fedora_version}.noarch.rpm"

  # Unset the variables used.
  unset fedora_version

  # Enable the Cisco OpenH264 repository.
  echo "Enabling the 'Cisco OpenH264' repository."
  dnf config-manager setopt fedora-cisco-openh264.enabled=1

  # Update the AppStream metadata.
  echo "Updating AppStream metadata for the 'RPM Fusion' repositories."
  dnf install --refresh --assumeyes "rpmfusion-*-appstream-data"

  # Google Chrome.
  echo "Setting up the 'Google Chrome' repository."
  dnf config-manager setopt google-chrome.enabled=1

  # Docker Community Edition.
  echo "Setting up the 'Docker Community Edition' repository."
  dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

  # Brave Browser.
  echo "Setting up the 'Brave Browser' repository."
  dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

  # WezTerm Nightly.
  echo "Setting up the 'WezTerm Nightly' COPR repository."
  dnf copr enable wezfurlong/wezterm-nightly

  # Visual Studio Code.
  echo "Setting up the 'Visual Studio Code' repository."

  # Import the GPG key for the official 'Visual Studio Code' repository.
  echo "Importing the GPG key of the official 'Visual Studio Code' repository 'https://packages.microsoft.com/keys/microsoft.asc'."
  rpm --import https://packages.microsoft.com/keys/microsoft.asc

  # Add the official 'Visual Studio Code' repository.
  echo "Adding the official 'Visual Studio Code' repository."
  printf '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' | tee /etc/yum.repos.d/vscode.repo > /dev/null

fi
