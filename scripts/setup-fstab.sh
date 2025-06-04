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

  # Get the path of the directory where this script is located.
  script_directory_path="$(cd "$(dirname "$0")" && pwd)"

  # Initialize the current timestamp to be used for making backup files.
  timestamp_now="$(date +"%d-%b-%Y-%I-%M-%S-%p")"

  # Check if the 'fstab' file exists in the directory where this script is located and if it is a valid file.
  if [ -f "${script_directory_path}/fstab" ]; then

    # Check if the 'fstab' file exists under '/etc'.
    if [ -f '/etc/fstab' ]; then

      # Backup and disable the file by renaming it.
      echo "'/etc/fstab' exists, creating backup."
      mv -f "/etc/fstab" "/etc/fstab.backup.${timestamp_now}"

      # Copy the 'fstab' file into the '/etc' directory.
      echo "Installing 'fstab' into '/etc'."
      cp 'fstab' '/etc'

    fi

  fi

  # Unset the variables used.
  unset script_directory_path
  unset timestamp_now

fi

# Unset the variables used.
unset current_user_id