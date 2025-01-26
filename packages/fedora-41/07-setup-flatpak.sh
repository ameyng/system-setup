#!/usr/bin/env bash

echo -e 'Removing the pre-configured filtered flatpak repositories.'
flatpak remote-delete fedora
flatpak remote-delete fedora-testing

echo -e 'Adding the full/unfiltered Flathub remote repository at the system level.'
sudo flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e 'Adding the full/unfiltered Flathub remote repository at the user level.'
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e 'Installing certain flatpak packages at the system level.'
flatpak install --system org.mozilla.firefox \
                         org.gnome.Calculator \
                         org.gnome.Calendar \
                         org.gnome.SimpleScan \
                         com.brave.Browser \
                         com.github.PintaProject.Pinta

echo -e 'Installing certain flatpak packages at the user level.'
flatpak install --user com.github.tchx84.Flatseal \
                       com.jgraph.drawio.desktop \
                       com.obsproject.Studio \
                       com.usebottles.bottles \
                       com.valvesoftware.Steam \
                       org.freedesktop.Platform.VulkanLayer.gamescope \
                       com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
                       de.haeckerfelix.Fragments \
                       io.github.flattool.Warehouse \
                       it.mijorus.gearlever \
                       net.lutris.Lutris \
                       org.gimp.GIMP \
                       org.gnome.gitlab.somas.Apostrophe \
                       org.inkscape.Inkscape \
                       org.nickvision.tubeconverter \
                       org.wezfurlong.wezterm