#!/usr/bin/env bash

echo -e 'Removing the pre-configured filtered flatpak repositories.'
flatpak remote-delete fedora
flatpak remote-delete fedora-testing

echo -e 'Adding the full/unfiltered Flathub remote repository at the system level.'
flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e 'Adding the full/unfiltered Flathub remote repository at the user level.'
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e 'Installing certain flatpak packages at the system level.'
flatpak install --system org.mozilla.firefox \
                         org.gnome.Calculator \
                         org.gnome.Calendar \
                         org.gnome.SimpleScan \
                         com.brave.Browser

echo -e 'Installing most-used flatpak packages at the user level.'
flatpak install --user com.github.tchx84.Flatseal \
                       com.valvesoftware.Steam \
                       org.freedesktop.Platform.VulkanLayer.gamescope \
                       com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
                       org.wezfurlong.wezterm
