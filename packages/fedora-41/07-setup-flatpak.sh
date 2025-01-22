#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Removing the pre-configured filtered flatpak repositories.'
sudo flatpak remote-delete fedora
sudo flatpak remote-delete fedora-testing

echo -e 'Adding the full/unfiltered Flathub remote repository.'
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

