# Aliases.

# Exit on any error.
# Exit if any unset variable is used/referenced.
# set -eu

# Check if the Bash session is interactive i.e. not running within a script.
case "${-}" in

  # It is interactive.
  *'i'*)

    # Initialize a variable to check if 'NeoVim' is installed i.e. the binary 'nvim' is available in 'PATH'.
    is_neovim_installed="$(command -v nvim > /dev/null 2>&1; echo $?)"

    # Check if 'NeoVim' is installed.
    if [ 0 -eq "${is_neovim_installed}" ]; then

      # Create aliases to use the 'nvim' binary whenever 'vi' or 'vim' are invoked.
      alias vi='nvim'
      alias vim='nvim'

    fi

    # Unset used variables.
    unset is_neovim_installed

    ;;

  # Default case, do nothing.
  *) ;;

esac
