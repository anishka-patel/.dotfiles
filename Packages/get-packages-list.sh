#!/usr/bin/bash
# Creator: Anishka Patel
# Title: Package Generation Script
# Description:
# A script that generates list of packages into various files
# that can be used to install them back.
# Created: 11-09-2022

status() {
	if [ $? -ne 0 ]; then
		echo "Failed"
	else
		echo "Completed"
	fi
}

echo "Starting Packages list generation script."
echo
echo -n "Generating Rpm-ostree layers list..."
rpm-ostree status >rpm-ostree-layers-list.txt 2>/dev/null
status
echo -n "Generating Rpm      packages list..."
rpm -qa >rpm-packages-list.txt 2>/dev/null
status
echo -n "Generation Pacman   packages list..."
pacman -Qqe >pacman-packages-list.txt 2>/dev/null
status
echo -n "Generating Aur      packages list..."
pacman -Qm | awk '{print $1}' >aur-packages-list.txt 2>/dev/null
status
echo -n "Generating Dnf      packages list..."
dnf list >dnf-packages-list.txt 2>/dev/null
status
echo -n "Generating Brew     packages list..."
brew list --installed-on-request >brew-packages-list.txt 2>/dev/null
status
echo -n "Generating Flatpak  packages list..."
flatpak list --app --columns=application >flatpak-packages-list.txt 2>/dev/null
status
echo -n "Generating Snap     packages list..."
snap list --all >snap-packages-list.txt 2>/dev/null
status
echo -n "Generating Npm      packages list..."
npm -g list | awk '{print $2}' | awk -F '@' '{print $1}' >npm-packages-list.txt 2>/dev/null
status
echo -n "Generating Pip      packages list..."
pip list | awk '{print $1}' >pip-packages-list.txt 2>/dev/null
status
echo -n "Generating Go       packages list..."
go list ... >go-packages-list.txt 2>/dev/null
status
echo -n "Generating Cargo    packages list..."
cargo install --list | grep -v :$ >cargo-packages-list.txt 2>/dev/null
status
echo -n "Generating VSCodium packages list..."
codium --list-extensions >codium-packages-list.txt 2>/dev/null
status
echo -n "Generating VSCode packages list..."
code --list-extensions >code-packages-list.txt 2>/dev/null
status
echo -n "Generating Appimage packages list..."
appimage-cli-tool list | grep -i AppImage | rev | awk '{print $2}' | rev >appimages-packages-list.txt 2>/dev/null
status
echo -n "Generating Apx      packages list..."
apx list -i | awk -F '/' '{print $1}' >apx-packages-list.txt 2>/dev/null
status
echo
echo "Finished Packages list generation script."
