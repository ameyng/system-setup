#!/usr/bin/env bash

echo -e 'Installing the required packages.'
sudo dnf install kmodtool akmods mokutil openssl

echo -e 'Generating the key for enrollment.'
sudo kmodgenca -a

echo -e 'Enrolling the public key in MOK.'
sudo mokutil --import /etc/pki/akmods/certs/public_key.der

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'
