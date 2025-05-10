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

  # Iterate over the '.conf' files in the directory where this script is located.
  for config_file in "${script_directory_path}/"*.conf; do

    # Check if the file being iterated over is valid.
    if [ -f "${config_file}" ]; then

      # Get the base name of the file i.e. extract the file name from the path.
      config_file_name="$(basename "${config_file}")"

      # Initialize the current timestamp to be used for making backup files.
      timestamp_now="$(date +"%d-%b-%Y-%I-%M-%S-%p")"

      # Check if a file by the same name exists under '/etc/modprobe.d' and is a symbolic link.
      if [ -L "/etc/modprobe.d/${config_file_name}" ]; then

        # Unlink it.
        echo "'/etc/modprobe.d/${config_file_name}' exists as a symbolic link, unlinking it."
        sudo unlink "/etc/modprobe.d/${config_file_name}"

      # Otherwise, check if it is a regular file.
      elif [ -f "/etc/modprobe.d/${config_file_name}" ]; then

        # Backup and disable the file by renaming it.
        echo "'/etc/modprobe.d/${config_file_name}' exists, creating backup."
        sudo mv -f "/etc/modprobe.d/${config_file_name}" "/etc/modprobe.d/${config_file_name}.backup.${timestamp_now}"

      # Otherwise, if the file does not exist at all.
      else

        # Do nothing.
        :

      fi

      # Unset the variable used.
      unset config_file_name
      unset timestamp_now

      # Copy the configuration file into the '/etc/modprobe.d' directory.
      echo "Installing '${config_file}' into '/etc/modprobe.d'"
      sudo cp "${config_file}" '/etc/modprobe.d'

    fi

  done

  # Unset the variables used.
  unset config_file
  unset script_directory_path

fi

# Unset the variables used.
unset current_user_id