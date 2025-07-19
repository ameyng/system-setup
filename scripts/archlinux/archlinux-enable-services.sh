#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Enable the required services.
echo 'Enabling the required services.'

# Enable 'NetworkManager' service.
echo "Enabling 'NetworkManager' service."
systemctl enable NetworkManager

# Enable 'fstrim' service.
echo "Enabling 'fstrim' service."
systemctl enable fstrim.timer

# Enable the 'set-intel-sound-card-power-saving' service.
systemctl enable set-intel-sound-card-power-saving.timer

# Exit with a successful error code.
exit 0
