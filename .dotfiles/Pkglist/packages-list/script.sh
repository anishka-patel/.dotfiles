#!/usr/bin/bash
# Creator: Anishka Patel
# Title: Package Generation Script
# Description:
# A script that generates list of packages into various files
# that can be used to install them back.
# Created: 11-09-2022

echo "Starting Packages list generation script."
echo
echo -n "Generation Explicit packages list..."
pacman -Qqe > explicit-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Pacman   packages list..."
pacman -Qn | awk '{print $1}' > pacman-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Aur      packages list..."
pacman -Qm | awk '{print $1}'> aur-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Brew     packages list..."
brew list > brew-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Flatpak  packages list..."
flatpak list | awk '{print $1}' > flatpak-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Snap     packages list..."
snap list --all > snap-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Npm      packages list..."
npm -g list | awk '{print $2}' | awk -F '@' '{print $1}' > npm-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Pip      packages list..."
pip list | awk '{print $1}' > pip-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Go       packages list..."
go list ... > go-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Cargo    packages list..."
cargo install --list | grep -v :$ > cargo-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating VSCodium packages list..."
vscodium --list-extensions > vscodium-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Appimage packages list..."
appimage-cli-tool list | grep -i AppImage | rev | awk '{print $2}' | rev > appimages-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo -n "Generating Apx      packages list..."
apx list -i | awk -F '/' '{print $1}' > apx-packages-list.txt 2>/dev/null
if [ $? -ne 0 ]; then
  echo "Failed"
else
  echo "Completed"
fi
echo
echo "Finished Packages list generation script."
