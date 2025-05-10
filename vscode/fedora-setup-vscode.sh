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

  # Import the GPG key for the official 'VS Code' repository.
  echo "Importing the GPG key of the official 'VS Code' repository 'https://packages.microsoft.com/keys/microsoft.asc'."
  rpm --import https://packages.microsoft.com/keys/microsoft.asc

  # Add the official 'VS Code' repository.
  echo "Adding the official 'VS Code' repository."
  printf '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' | tee /etc/yum.repos.d/vscode.repo > /dev/null

  # Install 'VS Code'.
  echo "Installing 'VS Code'."
  dnf install --offline --refresh --assumeyes code
  echo 'Please reboot your computer using the below command.'
  echo "'sudo dnf offline reboot'"

fi

# Unset the variables used.
unset current_user_id