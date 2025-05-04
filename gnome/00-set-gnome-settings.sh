#!/usr/bin/env bash

echo -e "Applying various tweaks to GNOME using the 'gsettings' CLI utility.\n"

# Interface
echo -e '\nInterface'
echo -e '- Set the accent colour to orange.'
echo -e '- Scale up the text by fifty percent.'
echo -e '- Set the clock format to 12 hours, with AM/PM.'
echo -e '- Show the day of the week on the clock in the top bar.'
echo -e '- Set the overall colour scheme to a dark theme.'
echo -e '- Disable hot corners.'
echo -e '- Enable full hinting for fonts'
echo -e '- Show the battery percentage in the top bar.'
gsettings set org.gnome.desktop.interface accent-color 'orange'
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface font-hinting 'full'
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Mouse
echo -e '\nMouse'
echo -e '- Disable natural scrolling when using the mouse.'
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

# Touchpad
echo -e '\nTouchpad'
echo -e '- Disable the touchpad when typing.'
echo -e '- Disable scrolling using the touchpad edge.'
echo -e '- Disable natural scrolling when using the touchpad.'
echo -e '- Enable tapping and dragging when using the touchpad.'
echo -e '- Enable drag lock when tapping and dragging using the touchpad.'
echo -e '- Enable tap to click when using the touchpad.'
echo -e '- Enable scrolling using two finger gestures when using the touchpad.'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag-lock true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

# Privacy
echo -e '\nPrivacy'
echo -e '- Mark temporary files as old after 7 days.'
echo -e '- Mark recent file entries as old after 7 days.'
echo -e '- Automatically delete old temporary files.'
echo -e '- Disable automatic problem reporting.'
gsettings set org.gnome.desktop.privacy old-files-age 7
gsettings set org.gnome.desktop.privacy recent-files-max-age 7
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy report-technical-problems false

# Extensions
echo -e '\nExtensions'
echo -e '- Disable installation of extensions.'
echo -e '- Disable user extensions.'
echo -e '- Disable all currently enabled extensions.'
gsettings set org.gnome.shell allow-extension-installation false
gsettings set org.gnome.shell disable-user-extensions true
gsettings set org.gnome.shell enabled-extensions "[]"

# GNOME software
echo -e '\nGNOME Software'
echo -e '- Disable automatic installation software updates.'
echo -e '- Disable automatic downloading of software updates.'
echo -e '- Disable software update notifications.'
echo -e "- Show user ratings in the 'GNOME Software' application."
gsettings set org.gnome.software allow-updates false
gsettings set org.gnome.software download-updates false
gsettings set org.gnome.software download-updates-notify false
gsettings set org.gnome.software show-ratings true

# Window preferences
echo -e '\nWindow prefrences'
echo -e '- Enable the minimize, maximize and close buttons at the top-right corner of the windows.'
echo -e '- Enable focusing windows when the mouse pointer hovers over them.'
echo -e '- Enable just a single workspace'
echo -e '- Disable dynamic workspaces.'
echo -e '- Enable workspaces on all displays, not just the primary display.'
echo -e '- Show windows from all workspaces when switching windows.'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.shell.window-switcher current-workspace-only false

# File manager
echo -e '\nFile manager'
echo -e '- Show the exact date and time in the file timestamps.'
echo -e '- Use the list view instead of the grid view.'
echo -e "- Show the 'create link' option in the right-click menu."
echo -e "- Show the 'delete permanently' option in the right-click menu."
echo -e '- Show hidden files.'
echo -e '- Show the name, size, date modified, owner, group and permissions columns/fields in the list view.'
gsettings set org.gnome.nautilus.preferences date-time-format 'detailed'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-create-link true
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.nautilus.list-view default-column-order "['name', 'size', 'date_modified', 'owner', 'group', 'permissions', 'mime_type', 'type', 'where', 'date_modified_with_time', 'date_accessed', 'date_created', 'recency', 'starred']"
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'date_modified', 'owner', 'group', 'permissions']"

# Filepicker
echo -e '\nFilepicker'
echo -e '- Show the timestamps in a 12 hour format.'
echo -e '- Include the time along with the date in the timestamp.'
echo -e '- Show hidden files.'
echo -e '- Sort directories first.'
echo -e '- Set the baseline window size to 1366x768'
gsettings set org.gtk.gtk4.Settings.FileChooser clock-format '12h'
gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gtk.gtk4.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser window-size '(1366,768)'
gsettings set org.gtk.Settings.FileChooser window-size '(1366,768)'

# Miscellaneous
echo -e '\nMiscellaneous'
echo -e '- When adjusting the volume increment/decrement in steps of five percent.'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 5

# Keybindings
echo -e '\nKeybindings'
echo -e '- Disable all keybindings except the ones we will set.'
echo -e '- Alt + F4 -> Close window.'
echo -e '- Super/Win + Up/Down -> Maximize/restore the active window.'
echo -e '- Alt + Tab -> Switch windows.'
echo -e '- Super/Win + Left/Right -> Tile the active window to the left/right.'
echo -e '- Print -> Quick/direct screenshot.'
echo -e '- Super/Win + Print -> Show screenshot UI.'
echo -e '- Shift + Super/Win + l -> Logout.'
echo -e '- Super/Win + l -> Lock screen.'
echo -e '- Super/Win + Space -> Search.'
echo -e '- Enable actions for all keyboard special keys like monitor brightness up/down, volume up/down, etc.'
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"
gsettings set org.gnome.desktop.wm.keybindings always-on-top "[]"
gsettings set org.gnome.desktop.wm.keybindings begin-move "[]"
gsettings set org.gnome.desktop.wm.keybindings begin-resize "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-group "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-panels "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-windows "[]"
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings lower "[]"
gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally "[]"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "[]"
gsettings set org.gnome.desktop.wm.keybindings minimize "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-center "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-n "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "[]"
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]"
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "[]"
gsettings set org.gnome.desktop.wm.keybindings raise "[]"
gsettings set org.gnome.desktop.wm.keybindings raise-or-lower "[]"
gsettings set org.gnome.desktop.wm.keybindings set-spew-mark "[]"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-group "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-panels "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-above "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-on-all-workspaces "[]"
gsettings set org.gnome.mutter.keybindings cancel-input-capture "[]"
gsettings set org.gnome.mutter.keybindings rotate-monitor "[]"
gsettings set org.gnome.mutter.keybindings switch-monitor "[]"
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-1 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-10 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-11 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-12 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-2 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-3 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-4 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-5 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-6 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-7 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-8 "[]"
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-9 "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys battery-status "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys battery-status-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys decrease-text-size "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys eject "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys eject-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys email "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys email-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys help "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys hibernate "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys hibernate-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys home-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys increase-text-size "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-down-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-toggle "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-toggle-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-up-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-in "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-out "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys media "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys media-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys mic-mute-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys next-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys on-screen-keyboard "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys pause "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys pause-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys play-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-forward "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-forward-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-random "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-random-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-repeat "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-repeat-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-rewind "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys playback-rewind-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys power "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys power-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rfkill "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rfkill-bluetooth "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rfkill-bluetooth-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rfkill-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-cycle "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-cycle-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys search-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys stop-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys suspend-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys toggle-contrast "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-off "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-off-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-on "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-on-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-toggle-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down-precise "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down-precise-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down-quiet "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down-quiet-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute-quiet "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute-quiet-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up-precise "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up-precise-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up-quiet "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up-quiet-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up-static "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys www-static "[]"
gsettings set org.gnome.shell.keybindings focus-active-notification "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-1 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-2 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-3 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-4 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-5 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-6 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-7 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-8 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-9 "[]"
gsettings set org.gnome.shell.keybindings screenshot-window "[]"
gsettings set org.gnome.shell.keybindings shift-overview-down "[]"
gsettings set org.gnome.shell.keybindings shift-overview-up "[]"
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"
gsettings set org.gnome.shell.keybindings toggle-application-view "[]"
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"
gsettings set org.gnome.shell.keybindings toggle-overview "[]"
gsettings set org.gnome.shell.keybindings toggle-quick-settings "[]"
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right']"
gsettings set org.gnome.shell.keybindings screenshot "['Print']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>Print']"
gsettings set org.gnome.settings-daemon.plugins.media-keys logout "['<Shift><Super>l']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>l']"
gsettings set org.gnome.settings-daemon.plugins.media-keys search "['<Super>space']"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-down "['KbdBrightnessDown']"
gsettings set org.gnome.settings-daemon.plugins.media-keys keyboard-brightness-up "['KbdBrightnessUp']"
gsettings set org.gnome.settings-daemon.plugins.media-keys mic-mute "['AudioMicMute']"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['AudioPrev']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['AudioNext']"
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['AudioPlay']"
gsettings set org.gnome.settings-daemon.plugins.media-keys stop "['AudioStop']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down "['MonBrightnessDown']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up "['MonBrightnessUp']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['AudioLowerVolume']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['AudioRaiseVolume']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['AudioMute']"
gsettings set org.gnome.settings-daemon.plugins.media-keys suspend "['Sleep']"
gsettings set org.gnome.settings-daemon.plugins.media-keys touchpad-toggle "['TouchpadToggle']"
