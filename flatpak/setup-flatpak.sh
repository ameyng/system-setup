#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Fetch the list of existing user remotes.
echo "Getting the list of existing 'Flatpak' user remotes."
user_remotes="$(flatpak remotes --user --show-disabled --columns=:s)"

# Check if the list of user remotes is empty.
if [ -z "${user_remotes}" ]; then

  echo 'No user remotes found.'

# Otherwise.
else

  # Iterate over the list of user remotes.
  for remote_name in ${user_remotes}; do

    # Disable the remote.
    echo "Found user remote: ${remote_name}, disabling it."
    flatpak remote-delete --user "${remote_name}"

  done

  # Unset the used variable.
  unset remote_name

fi

# Unset the used variable.
unset user_remotes

# Fetch the list of existing system remotes.
echo "Getting the list of existing 'Flatpak' system remotes."
system_remotes="$(flatpak remotes --system --show-disabled --columns=:s)"

# Check if the list of system remotes is empty.
if [ -z "${system_remotes}" ]; then

  echo 'No system remotes found.'

# Otherwise.
else

  # Iterate over the list of system remotes.
  for remote_name in ${system_remotes}; do

    # Disable the remote.
    echo "Found system remote: ${remote_name}, disabling it."
    sudo flatpak remote-delete --system "${remote_name}"

  done

  # Unset the used variable.
  unset remote_name

fi

# Unset the used variable.
unset system_remotes

# Enable to standard, unfiltered 'Flathub' remote.
echo "Enabling the standard Flathub remote 'https://dl.flathub.org/repo/flathub.flatpakrepo' at the user installation."
flatpak remote-add --user --if-not-exists 'flathub' 'https://dl.flathub.org/repo/flathub.flatpakrepo'

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "$0")" && pwd)"

# Install any user requested apps from the file 'apps-to-install.list'.
echo "Checking if the file 'apps-to-install.list' exists in the directory where this script is located and if it is a valid file."
if [ -f "${script_directory_path}/apps-to-install.list" ]; then

  echo "'apps-to-install.list' exists."

  # Initialize the list of applications to install.
  apps_to_install="$(cat ${script_directory_path}/apps-to-install.list)"

  echo 'Installing the below applications:'
  for application_id in ${apps_to_install}; do echo "- ${application_id}"; done

  # Install the applications at the user level.
  flatpak install --user --assumeyes ${apps_to_install}

  # Unset the used variables.
  unset apps_to_install

  echo "All requested apps installed."

else

  echo "The file 'apps-to-install.list' does not exist in the directory where this script is located or it is not a valid file."

fi

# Unset the used variables.
unset script_directory_path
