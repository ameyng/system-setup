#!/usr/bin/env bash

echo -e 'Installing some optional applications as user-level flatpaks.'
flatpak install --user com.jgraph.drawio.desktop \
                       com.obsproject.Studio \
                       com.usebottles.bottles \
                       de.haeckerfelix.Fragments \
                       io.github.flattool.Warehouse \
                       it.mijorus.gearlever \
                       net.lutris.Lutris \
                       org.gimp.GIMP \
                       org.gnome.gitlab.somas.Apostrophe \
                       org.inkscape.Inkscape \
                       org.nickvision.tubeconverter

