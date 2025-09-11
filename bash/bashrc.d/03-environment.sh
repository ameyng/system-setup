# Environment variables.

# Exit on any error.
# Exit if any unset variable is used/referenced.
# set -eu

# SSH agent under WSL #
#######################

# Check if the 'WSL_DISTRO_NAME' environment variable is set and not null.
if [ "x" = "${WSL_DISTRO_NAME:+x}" ]; then

  # Set the value of the 'SSH_AUTH_SOCK' variable explicitly since it doesn't get reflected from the 'systemd' user daemon.
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}ssh-agent.socket"

fi
