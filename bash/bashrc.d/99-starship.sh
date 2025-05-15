# Starship shell prompt.

# Exit on any error.
# Exit if any unset variable is used/referenced.
# set -eu

# Check if the Bash session is interactive i.e. not running within a script.
case "${-}" in

  # It is interactive.
  *'i'*)

    # Initialize a variable to check if 'Starship' is installed i.e. the binary 'starship' is available in 'PATH'.
    is_starship_installed="$(command -v starship > /dev/null 2>&1; echo $?)"

    # Check if 'Starship' is installed.
    if [ 0 -eq "${is_starship_installed}" ]; then

      # Initialize it.
      eval "$(starship init bash)"

    fi

    # Unset used variables.
    unset is_starship_installed

    ;;

  # Default case, do nothing.
  *) ;;

esac
