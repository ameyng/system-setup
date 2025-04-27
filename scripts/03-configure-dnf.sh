#!/usr/bin/env bash

echo -e "Enabling the below configuration options for the 'dnf' package manager."
echo -e ' - Enable using the fastest available mirrors.'
echo -e ' - Allow a maximum of 8 downloads in parallel.'
echo -e ' - Enforce GPG key checks for local package installation.'
echo -e ' - Enforce fetching of the latest package metdata every time.'

sudo cp ../libdnf5.conf.d/99-essential-tweaks.conf /etc/dnf/libdnf5.conf.d/
