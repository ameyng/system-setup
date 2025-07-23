#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo "Getting the list of existing 'Flatpak' user remotes."
user_remotes="$(flatpak remotes --user --show-disabled --columns=:s)"

# Check if the list of user remotes is empty.
if [ -z "${user_remotes}" ]; then

  echo 'No user remotes found.'

# Otherwise.
else

  # Iterate over the list of user remotes.
  for remote_name in ${user_remotes}; do

    echo "Found user remote: ${remote_name}, disabling it."
    flatpak remote-delete --user "${remote_name}"

  done

  # Unset the used variable.
  unset remote_name

fi

# Unset the used variable.
unset user_remotes

echo "Getting the list of existing 'Flatpak' system remotes."
system_remotes="$(flatpak remotes --system --show-disabled --columns=:s)"

# Check if the list of system remotes is empty.
if [ -z "${system_remotes}" ]; then

  echo 'No system remotes found.'

# Otherwise.
else

  # Iterate over the list of system remotes.
  for remote_name in ${system_remotes}; do

    echo "Found system remote: ${remote_name}, disabling it."
    sudo flatpak remote-delete --system "${remote_name}"

  done

  # Unset the used variable.
  unset remote_name

fi

# Unset the used variable.
unset system_remotes

echo "Enabling the standard Flathub remote 'https://dl.flathub.org/repo/flathub.flatpakrepo' at the system and user installation."
sudo flatpak remote-add --system --if-not-exists 'flathub' 'https://dl.flathub.org/repo/flathub.flatpakrepo'
flatpak remote-add --user --if-not-exists 'flathub' 'https://dl.flathub.org/repo/flathub.flatpakrepo'

# Exit with a successful error code.
exit 0
