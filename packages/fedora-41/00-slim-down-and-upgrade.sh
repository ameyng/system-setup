#!/usr/bin/env bash

echo -e "Enabling parallel downloads using 'dnf'."
echo -e '\n# Enable downloading upto 16 packages in parallel.\nmax_parallel_downloads=16' | sudo tee -a /etc/dnf/dnf.conf > /dev/null

echo -e 'Uninstalling certain packages from which some will be replaced with equivalent flatpak packages later.'
sudo dnf remove --assumeyes \
                firefox \
                firefox-langpacks \
                snapshot \
                gnome-contacts \
                gnome-weather \
                gnome-clocks \
                gnome-maps \
                mediawriter \
                libreoffice-calc \
                libreoffice-core \
                libreoffice-data \
                libreoffice-emailmerge \
                libreoffice-filters \
                libreoffice-graphicfilter \
                libreoffice-gtk3 \
                libreoffice-gtk4 \
                libreoffice-help-en \
                libreoffice-impress \
                libreoffice-kf5 \
                libreoffice-langpack-en \
                libreoffice-ogltrans \
                libreoffice-opensymbol-fonts \
                libreoffice-pdfimport \
                libreoffice-pyuno \
                libreoffice-ure \
                libreoffice-ure-common \
                libreoffice-writer \
                libreoffice-xsltfilter \
                simple-scan \
                totem \
                gnome-calculator \
                gnome-system-monitor \
                gnome-boxes \
                gnome-characters \
                gnome-connections \
                baobab \
                gnome-disk-utility \
                evince \
                gnome-font-viewer \
                loupe \
                yelp \
                gnome-logs \
                gnome-text-editor \
                gnome-tour \
                rhythmbox \
                gnome-calendar \
                gnome-shell-extension-apps-menu \
                gnome-shell-extension-background-logo \
                gnome-shell-extension-places-menu \
                gnome-shell-extension-window-list \
                amd-gpu-firmware \
                amd-ucode-firmware \
                hyperv-daemons \
                open-vm-tools-desktop \
                qemu-guest-agent \
                spice-vdagent \
                spice-webdavd \
                virtualbox-guest-additions

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove --assumeyes

echo -e 'Upgrading the system.'
sudo dnf upgrade --assumeyes

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'
