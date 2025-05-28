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

  # Uninstall unnecessary packages.
  dnf remove --offline --refresh \
  firefox \
  firefox-langpacks \
  zram-generator \
  zram-generator-defaults \
  tmux \
  snapshot \
  gnome-contacts \
  gnome-weather \
  gnome-clocks \
  gnome-maps \
  mediawriter \
  libreoffice-calc \
  libreoffice-filters \
  libreoffice-help-en \
  libreoffice-ogltrans \
  libreoffice-ure \
  libreoffice-core \
  libreoffice-graphicfilter \
  libreoffice-impress \
  libreoffice-opensymbol-fonts \
  libreoffice-ure-common \
  libreoffice-data \
  libreoffice-gtk3 \
  libreoffice-kf5 \
  libreoffice-pdfimport \
  libreoffice-writer \
  libreoffice-emailmerge \
  libreoffice-gtk4 \
  libreoffice-langpack-en \
  libreoffice-pyuno \
  libreoffice-xsltfilter \
  gnome-boxes \
  baobab \
  gnome-connections \
  gnome-disk-utility \
  evince \
  gnome-characters \
  rhythmbox \
  gnome-tour \
  gnome-calendar \
  gnome-abrt \
  gnome-system-monitor \
  totem \
  yelp \
  qemu-guest-agent \
  podman \
  virtualbox-guest-additions \
  toolbox \
  libproxy-bin \
  vlc-libs \
  vlc-plugin-pipewire \
  vlc-plugins-base \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-apps-menu \
  gnome-shell-extension-background-logo \
  gnome-shell-extension-launch-new-instance \
  gnome-shell-extension-places-menu \
  gnome-shell-extension-window-list \
  gnome-shell-extension-common \
  docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-selinux \
  docker-engine-selinux \
  docker-engine \
  alsa-sof-firmware \
  amd-gpu-firmware \
  amd-ucode-firmware \
  atheros-firmware \
  brcmfmac-firmware \
  iwlegacy-firmware \
  iwlwifi-dvm-firmware \
  libertas-firmware \
  tiwilink-firmware \
  mt7xxx-firmware \
  nvidia-gpu-firmware \
  nxpwireless-firmware \
  libvirt-client \
  libvirt-daemon \
  libvirt-daemon-common \
  libvirt-gconfig \
  libvirt-glib \
  libvirt-gobject \
  libvirt-libs \
  libvirt-ssh-proxy \
  kdebugsettings \
  kmahjongg \
  kmines \
  kpat \
  kolourpaint \
  akregator \
  kaddressbook \
  kgpg \
  kmail \
  kontact \
  korganizer \
  digikam \
  k3b \
  kamera \
  kamoso \
  kmouth \
  krdc \
  qrca \
  ktorrent \
  ktnef \
  kontact \
  pim-sieve-editor \
  neochat \
  plasma-drkonqi.{i686,x86_64} \
  kfind \
  krfb \
  kde-connect

  # Unset the variables used.
  unset current_user_id

  # Try to reboot to finish package removals.
  echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
  dnf offline reboot

fi
