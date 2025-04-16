#!/usr/bin/env bash

echo -e 'Enabling/installing the RPM Fusion free repository.'
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

echo -e 'Enabling/installing the RPM Fusion non-free repository.'
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo -e 'Enabling the Cisco OpenH264 repository.'
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

echo -e 'Updating the AppStream metadata.'
sudo dnf update @core

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

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

#!/usr/bin/env bash

echo -e 'Installing the required packages.'
sudo dnf install akmod-nvidia \
                 xorg-x11-drv-nvidia-cuda \
                 xorg-x11-drv-nvidia-power \
                 vulkan \
                 xorg-x11-drv-nvidia-cuda-libs \
                 nvidia-vaapi-driver \
                 libva-utils \
                 vdpauinfo \
                 intel-media-driver \
                 libva-nvidia-driver.{i686,x86_64}

echo -e 'Waiting for the NVIDIA kernel module to be built.'
while [[ 0 -ne $(modinfo -F version nvidia > /dev/null 2>&1; echo $?) ]]
do
  echo -e 'Waiting for 1 second.'
  sleep 1
done

echo -e 'Switching to the open source kernel-space driver.'
sudo sh -c 'echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod'

echo -e 'Rebuilding the kernel module.'
sudo akmods --rebuild

echo -e 'NVIDIA kernel module details'
echo -e "Version: $(modinfo -F version nvidia)"
echo -e "License: $(modinfo -F license nvidia)"

echo -e 'Rebuilding the initial RAM disk.'
sudo dracut --force --verbose --no-compress --regenerate-all

echo -e 'Making the following changes to all kernel entries in the GRUB bootloader:'
echo -e '- Disable all watchdogs.'
echo -e '- Disable the NMI watchdog explicitly.'
echo -e "- Disable the Intel 'iTCO_wdt' watchdog explicitly."
echo -e "- Disable the AMD 'sp5100_tco' watchdog explicitly."
echo -e "- Set the default suspend state to 'deep' i.e. in-memory."
echo -e "- Disable the 'nouveau' driver from being loaded in the initial ramdisk stage."
echo -e "- Disable the 'nouveau' driver from being loaded later in the boot process."
echo -e '- Enable the Kernel Mode Setting feature for the NVIDIA driver.'
echo -e '- Enable a framebuffer device for the NVIDIA driver.'
sudo grubby --update-kernel=ALL --args='nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco mem_sleep_default=deep modprobe.blacklist=nouveau rd.driver.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1'
sudo grubby --update-kernel=ALL --remove-args='quiet'

echo -e '\nPrinting the kernel command-line parameters from the default GRUB entry.'
sudo grubby --info=DEFAULT

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'

#!/usr/bin/env bash

echo -e 'Installing the required packages for C/C++, Go, Lua & Rust development.'
sudo dnf install --assumeyes \
                 gcc \
                 libgcc \
                 libgcc.i686 \
                 glibc-devel \
                 glibc-devel.i686 \
                 clang \
                 golang \
                 lua \
                 rust \
                 cargo \
                 clippy \
                 rust-src \
                 rustfmt

#!/usr/bin/env bash

echo -e 'Removing existing/older components if installed.'
sudo dnf remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine

echo -e "Installing the 'dnf-plugins-core' package."
sudo dnf install dnf-plugins-core

echo -e 'Adding the Docker CE repository.'
sudo dnf config-manager addrepo --from-repofile='https://download.docker.com/linux/fedora/docker-ce.repo'

echo -e 'Installing the required Docker CE packages.'
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "Enabling the Docker CE 'systemd' service."
sudo systemctl enable --now docker.service

echo -e "Enabling the containerd 'systemd' service."
sudo systemctl enable --now containerd.service

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

#!/usr/bin/env bash

echo -e "Installing the 'dnf-plugins-core' package."
sudo dnf install dnf-plugins-core

echo -e 'Adding the Brave browser repository.'
sudo dnf config-manager addrepo --from-repofile='https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo'

echo -e 'Installing Brave browser.'
sudo dnf install brave-browser

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

#!/usr/bin/env bash

echo -e 'Importing the required Microsoft signing key.'
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e 'Adding the Visual Studio Code repository.'
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/visual-studio-code.repo > /dev/null

echo -e 'Updating the package repository details.'
dnf check-update

echo -e 'Installing Visual Studio Code.'
sudo dnf install --assumeyes code

#!/usr/bin/env bash

echo -e "Replcaing the free variant of 'ffmpeg' with the non-free variant."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing

echo -e 'Installing the packages required for enabling usage of other codecs in GStreamer applications.'
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

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


#!/usr/bin/env bash

echo -e 'Enabling the WezTerm COPR repository.'
sudo dnf copr enable wezfurlong/wezterm-nightly

echo -e 'Installing WezTerm.'
sudo dnf install wezterm

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove
