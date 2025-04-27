#!/usr/bin/env bash

echo -e "Getting the list of existing 'Flatpak' user remotes"
user_remotes="$(flatpak remotes --user --show-disabled --columns=:s)"

if [[ -z ${user_remotes} ]]; then
  echo -e 'No user remotes found.'
else
  for remote_name in ${user_remotes}; do
    echo "Found remote: [U] ${remote_name}, disabling it"
    flatpak remote-delete --user ${remote_name}
  done
fi

echo -e "Getting the list of existing 'Flatpak' system remotes"
system_remotes="$(flatpak remotes --system --show-disabled --columns=:s)"

if [[ -z ${system_remotes} ]]; then
  echo -e 'No system remotes found.'
else
  for remote_name in ${system_remotes}; do
    echo "Found remote: [S] ${remote_name}, disabling it"
    sudo flatpak remote-delete --system ${remote_name}
  done
fi

echo -e "Enabling the standard Flathub remote 'https://dl.flathub.org/repo/flathub.flatpakrepo' at the user installation"
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
