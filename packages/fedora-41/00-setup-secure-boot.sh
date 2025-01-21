#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Installing the required packages.'
sudo dnf install kmodtool akmods mokutil openssl

echo -e 'Generating the key for enrollment.'
sudo kmodgenca -a

echo -e 'Enrolling the public key in MOK.'
sudo mokutil --import /etc/pki/akmods/certs/public_key.der

echo -e "Rebooting in 30 seconds, press 'Ctrl + C' to terminate."
sleep 30
sudo systemctl reboot