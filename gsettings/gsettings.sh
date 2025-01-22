#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e "Applying various tweaks to GNOME using the 'gsettings' CLI utility."

echo -e 'Disabling existing/enabled extensions.'
gsettings set org.gnome.shell enabled-extensions "[]"

echo -e 'Disabling installation of extensions.'
gsettings set org.gnome.shell allow-extension-installation false

echo -e 'Disabling installation of user extensions.'
gsettings set org.gnome.shell disable-user-extensions true

echo -e 'Enabling dark theme.'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo -e "Setting the accent color to 'orange'."
gsettings set org.gnome.desktop.interface accent-color 'orange'

echo -e 'Show battery percentage.'
gsettings set org.gnome.desktop.interface show-battery-percentage true

echo -e 'Scale text size up by 50%.'
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5

echo -e 'Disable desktop scaling.'
gsettings set org.gnome.desktop.interface scaling-factor 0

echo -e 'Enable full font hinting.'
gsettings set org.gnome.desktop.interface font-hinting 'full'

echo -e "Add 'minimize' and 'maximize' buttons to window title-bars."
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

echo -e 'Disable natural scrolling when using a mouse.'
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

echo -e 'Enable tap-to-click when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

echo -e 'Disable edge scrolling when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false

echo -e 'Enable two finger scrolling when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

echo -e 'Disable the touchpad while typing.'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true

echo -e 'Disable natural scrolling when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

echo -e 'Enable tap-and-drag when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true

echo -e 'Enable drag lock when tapping and dragging when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag-lock true

echo -e 'Enable activating windows when the mouse pointer hovers over them.'
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

echo -e 'Enable automatic deletion of temporary files.'
gsettings set org.gnome.desktop.privacy remove-old-temp-files true

echo -e 'Set the time-period for deleting temporary files to one week.'
gsettings set org.gnome.desktop.privacy old-files-age 7

echo -e 'Store recent file history for a month.'
gsettings set org.gnome.desktop.privacy recent-files-max-age 30

echo -e 'Disable dynamic workspaces.'
gsettings set org.gnome.mutter dynamic-workspaces false

echo -e 'Only use one workspace.'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1

echo -e 'Disable hot corners.'
gsettings set org.gnome.desktop.interface enable-hot-corners false

echo -e 'Display the time in 12 hour format.'
gsettings set org.gnome.desktop.interface clock-format '12h'

echo -e 'Display the weekday in the interface.'
gsettings set org.gnome.desktop.interface clock-show-weekday true

echo -e 'When switching applications, consider applications from all workspaces.'
gsettings set org.gnome.shell.app-switcher current-workspace-only false

echo -e 'When switching windows, consider windows from all workspaces.'
gsettings set org.gnome.shell.window-switcher current-workspace-only false

echo -e 'Always display detailed timestamps in the file manager.'
gsettings set org.gnome.nautilus.preferences date-time-format 'detailed'

echo -e 'Rearrange the default order of file/folder metadata visible in the file manager.'
echo -e 'This change is required to display the enabled file/folder metadata in the right order.'
gsettings set org.gnome.nautilus.list-view default-column-order "['name', 'size', 'date_modified', 'owner', 'group', 'permissions', 'mime_type', 'type', 'where', 'date_modified_with_time', 'date_accessed', 'date_created', 'recency', 'starred']"

echo -e 'Show name, size, modification timestamp, owner, group and permissions in the file manager.'
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'date_modified', 'owner', 'group', 'permissions']"

echo -e 'Always use the list view in the file manager.'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

echo -e "Show the 'Create link' option in the file manager."
gsettings set org.gnome.nautilus.preferences show-create-link true

echo -e "Show the 'Delete permanently' option in the file manager."
gsettings set org.gnome.nautilus.preferences show-delete-permanently true

echo -e 'Always show hidden files in the file manager.'
gsettings set org.gnome.nautilus.preferences show-hidden-files true

echo -e 'Display the time in 12 hour format in the file picker menus.'
gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gtk.gtk4.Settings.FileChooser clock-format '12h'

echo -e 'Display the time along with the date in the timestamp column in the file picker menus.'
gsettings set org.gtk.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.gtk4.Settings.FileChooser date-format 'with-time'

echo -e 'Display hidden files/folders in the file picker menus.'
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true

echo -e 'Sort directories first in the file picker menu.'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true

echo -e 'Disable automatic application of software updates.'
gsettings set org.gnome.software allow-updates false

echo -e 'Disable automatic downloading of software updates.'
gsettings set org.gnome.software download-updates false

echo -e 'Disable notifying for available updates.'
gsettings set org.gnome.software download-updates-notify false

echo -e 'Show the application ratings in the GNOME Software application.'
gsettings set org.gnome.software show-ratings true

echo -e 'Set keybinding: Super/Win + Space - Search.'
gsettings set org.gnome.settings-daemon.plugins.media-keys search "['<Super>space']"

echo -e 'Set keybinding: Alt + Tab - Switch windows.'
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

echo -e 'Set keybinding: Super/Win + l - Lock screen.'
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>l']"

echo -e 'Set keybinding: Print Screen - Show screenshot UI.'
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print']"

echo -e 'Set keybinding: Alt + F4 - Close application.'
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"

echo -e 'Set keybinding: Super/Win + Up - Toggle maximization state of window.'
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>Up']"

echo -e 'Set keybinding: Super/Win + Left - Tile the window to the left.'
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"

echo -e 'Set keybinding: Super/Win + Right - Tile the window to the right.'
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"

echo -e 'Set keybindings: Microphone mute toggle, audio mute toggle, volume up/down, toggle playback, stop playback, next/previous track - respective keyboard media keys.'
gsettings set org.gnome.settings-daemon.plugins.media-keys mic-mute "['AudioMicMute']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['AudioNext']"
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['AudioPlay']"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['AudioPrev']"
gsettings set org.gnome.settings-daemon.plugins.media-keys stop "['AudioStop']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['AudioLowerVolume']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['AudioMute']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['AudioRaiseVolume']"