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
echo "Enabling the standard Flathub remote 'https://dl.flathub.org/repo/flathub.flatpakrepo' at the system and user installation."
flatpak remote-add --system --if-not-exists 'flathub' 'https://dl.flathub.org/repo/flathub.flatpakrepo'
flatpak remote-add --user --if-not-exists 'flathub' 'https://dl.flathub.org/repo/flathub.flatpakrepo'

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "$0")" && pwd)"

# Install any user requested apps from the file 'apps-system.list'.
echo "Checking if the file 'apps-system.list' exists in the directory where this script is located and if it is a valid file."
if [ -f "${script_directory_path}/apps-system.list" ]; then

  echo "'apps-system.list' exists."

  # Initialize the list of applications to install.
  apps_to_install="$(cat ${script_directory_path}/apps-system.list)"

  echo 'Installing the below applications (system):'
  for application_id in ${apps_to_install}; do echo "- ${application_id}"; done

  # Install the applications at the system level.
  flatpak install --system --assumeyes ${apps_to_install}

  # Unset the used variables.
  unset apps_to_install

  echo "All requested system apps installed."

else

  echo "The file 'apps-system.list' does not exist in the directory where this script is located or it is not a valid file."

fi

# Install any user requested apps from the file 'apps-user.list'.
echo "Checking if the file 'apps-user.list' exists in the directory where this script is located and if it is a valid file."
if [ -f "${script_directory_path}/apps-user.list" ]; then

  echo "'apps-user.list' exists."

  # Initialize the list of applications to install.
  apps_to_install="$(cat ${script_directory_path}/apps-user.list)"

  echo 'Installing the below applications (user):'
  for application_id in ${apps_to_install}; do echo "- ${application_id}"; done

  # Install the applications at the user level.
  flatpak install --user --assumeyes ${apps_to_install}

  # Unset the used variables.
  unset apps_to_install

  echo "All requested user apps installed."

else

  echo "The file 'apps-user.list' does not exist in the directory where this script is located or it is not a valid file."

fi

# Unset the used variables.
unset script_directory_path
