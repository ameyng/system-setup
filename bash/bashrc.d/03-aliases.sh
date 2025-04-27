# Aliases.

# Check if the Bash session is interactive i.e. not running within a script.
if [[ "${-}" == *"i"* ]]; then

  # Check if NeoVim is installed i.e. the binary 'nvim' is available in 'PATH'.
  if [[ 0 -eq $(command -v nvim > /dev/null 2>&1; echo $?) ]]; then

    # Create aliases to use the 'nvim' binary whenever 'vi' or 'vim' are invoked.
    alias vi='nvim'
    alias vim='nvim'

  fi

fi
