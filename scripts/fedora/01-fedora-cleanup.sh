#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo 'Removing unnecessary packages.'
sudo dnf remove \
	 --offline \
	 --assumeyes \
	 --refresh \
	 amd-gpu-firmware \
	 amd-ucode-firmware \
	 atheros-firmware \
	 brcmfmac-firmware \
	 iwlegacy-firmware \
	 iwlwifi-dvm-firmware \
	 libertas-firmware \
	 mt7xxx-firmware \
	 nxpwireless-firmware \
	 tiwilink-firmware \
         plymouth \
	 yelp \
	 snapshot \
	 gnome-contacts \
	 gnome-weather \
	 gnome-clocks \
	 gnome-maps \
	 mediawriter \
	 gnome-boxes \
	 gnome-calculator \
	 gnome-text-editor \
	 firefox \
	 baobab \
	 gnome-connections \
	 gnome-disk-utility \
	 gnome-logs \
	 evince \
	 simple-scan \
	 gnome-font-viewer \
	 loupe \
	 gnome-abrt \
	 gnome-characters \
	 rhythmbox \
	 gnome-tour \
	 gnome-calendar \
	 gnome-system-monitor \
	 totem \
	 gnome-shell-extension-appindicator \
	 gnome-shell-extension-apps-menu \
	 gnome-shell-extension-background-logo \
	 gnome-shell-extension-launch-new-instance \
	 gnome-shell-extension-places-menu \
	 gnome-shell-extension-window-list \
	 gnome-shell-extension-common \
	 kdebugsettings \
	 libreoffice-core \
	 kmahjongg \
	 kpat \
	 kmines \
	 gwenview \
	 kolourpaint \
	 skanpage \
	 khelpcenter \
	 kinfocenter \
	 plasma-welcome \
	 akregator \
	 grantlee-editor \
	 kde-connect \
	 kmail \
	 krdc \
	 krfb \
	 neochat \
	 pim-data-exporter \
	 pim-sieve-editor \
	 dragon \
	 elisa-player \
	 kamoso \
	 qrca \
	 kaddressbook \
	 kontact \
	 korganizer \
	 plasma-drkonqi \
	 firewall-config \
	 kinfocenter \
	 im-chooser \
	 kjournald \
	 kde-partitionmanager \
	 setroubleshoot-server \
	 plasma-systemmonitor \
	 ark \
	 filelight \
	 kcalc \
	 kcharselect \
	 kfind \
	 kgpg \
	 akonadi-import-wizard \
	 kmouth \
	 kwrite \
	 spectacle

echo ''
echo 'It is recommended to reboot immediately by running the below command:'
echo 'sudo dnf offline reboot --assumeyes'

# Exit with a successful error code.
exit 0
