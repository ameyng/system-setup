#!/usr/bin/env bash

echo -e 'Uninstalling certain packages from which some will be replaced with equivalent flatpak packages later.'
sudo dnf remove firefox \
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
                gnome-calendar

echo -e 'Uninstalling certain package groups.'
sudo dnf group remove firefox \
                      libreoffice \ 
                      guest-desktop-agents

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

echo -e 'Upgrading the system.'
sudo dnf upgrade

echo -e "Rebooting in 10 seconds, press 'Ctrl + C' to terminate."
sleep 10
systemctl reboot