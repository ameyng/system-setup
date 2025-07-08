# Google Chrome.
# echo "Setting up the 'Google Chrome' repository."
# sudo dnf config-manager setopt google-chrome.enabled=1

# Docker Community Edition.
# echo "Setting up the 'Docker Community Edition' repository."
# sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

# Brave Browser.
# echo "Setting up the 'Brave Browser' repository."
# sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# Asus Linux.
# echo "Setting up the 'Asus Linux' COPR repository."
# sudo dnf copr enable --assumeyes lukenukem/asus-linux

# Visual Studio Code.
# echo "Setting up the 'Visual Studio Code' repository."

# Import the GPG key for the official 'Visual Studio Code' repository.
# echo "Importing the GPG key of the official 'Visual Studio Code' repository 'https://packages.microsoft.com/keys/microsoft.asc'."
# sudo rpmkeys --import https://packages.microsoft.com/keys/microsoft.asc

# Add the official 'Visual Studio Code' repository.
# echo "Adding the official 'Visual Studio Code' repository."
# printf '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
