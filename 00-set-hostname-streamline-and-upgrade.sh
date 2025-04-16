#!/usr/bin/env bash

DESIRED_HOSTNAME='G634JZ'

echo -e 'Slimming down the system'
sudo dnf remove --refresh --assumeyes snapshot gnome-contacts gnome-weather gnome-clocks gnome-maps mediawriter libreoffice-calc libreoffice-filters libreoffice-help-en libreoffice-ogltrans libreoffice-ure libreoffice-core libreoffice-graphicfilter libreoffice-impress libreoffice-opensymbol-fonts libreoffice-ure-common libreoffice-data libreoffice-gtk3 libreoffice-kf5 libreoffice-pdfimport libreoffice-writer libreoffice-emailmerge libreoffice-gtk4 libreoffice-langpack-en libreoffice-pyuno libreoffice-xsltfilter gnome-calculator simple-scan gnome-boxes baobab gnome-connections gnome-disk-utility evince gnome-characters gnome-logs gnome-font-viewer rhythmbox gnome-tour gnome-text-editor gnome-calendar gnome-abrt gnome-system-monitor totem loupe yelp qemu-guest-agent podman virtualbox-guest-additions toolbox libproxy-bin vlc-libs vlc-plugin-pipewire vlc-plugins-base

echo -e 'Upgrading the system.'
sudo dnf upgrade --refresh --assumeyes --setopt=fastestmirror=True --setopt=max_parallel_downloads=8

echo -e 'Cleaning up unnecessary packages.'
sudo dnf --refresh --assumeyes autoremove

echo -e "Setting the hostname to '${DESIRED_HOSTNAME}'" 
hostnamectl hostname "${DESIRED_HOSTNAME}"

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'
