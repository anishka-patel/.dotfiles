#! /usr/bin/bash
# Title: Arch KDE Install Guide Script
# Description: A script to guide through KDE setup on archlinux
# Author: Anishka Patel
# Created: [2022-08-29 Mon]
# Usage: ./install-script.sh

sudo pacman -Syu --noconfirm --needed

# sudo apt update && sudo apt upgrade -y

# sudo dnf update && sudo dnf upgrade -y

sudo pacman -S flatpak --noconfirm --needed

sudo pacman -S appimagelauncher --noconfirm --needed

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash



yay -S apx

sudo pacman -S --needed base-devel git --noconfirm --needed

git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si

yay --version

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si

sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap

# Sources: pacman, aur
# yay -S pamac-aur

# Sources: pacman, flatpak, aur
yay -S pamac-flatpak

# Sources: pacman, flatpak, aur, snap
# yay -S pamac-full

yay -S octopi --noconfirm

# Arch distro
sudo pacman -S discover --noconfirm --needed

sudo pacman -S htop glances powertop --noconfirm --needed
# sudo pacman -S sysstat ifstat --noconfirm --needed

sudo pacman -S neofetch --noconfirm --needed

sudo pacman -S fd mlocate --noconfirm --needed

sudo pacman -S df du --noconfirm --needed

sudo pacman -S tldr --noconfirm --needed
sduo pacman -S man-db mandoc --noconfirm --needed

sudo -S git github-cli --noconfirm --needed

# pacman -S xorg

sudo pacman -S sddm --noconfirm --needed

sudo pacman -S plasma --noconfirm --needed

sudo pacman -S plasma-desktop --noconfirm --needed

sudo pacman -S plasma-nm plasma-pa kdeplasma-addons kde-gtk-config --noconfirm --needed

sudo pacman -S konsole yakuake --noconfirm --needed

sudo pacman -S doplhin --noconfirm --needed

sudo pacman -S discover --noconfirm --needed

sudo pacman -S kate kwrite --noconfirm --needed

sudo pacman -S powerdevil --noconfirm --needed

sudo pacman -S ksysguard --noconfirm --needed

# sudo pacman -S kde-applications --noconfirm --needed

# sudo pacman -S kde-utilities --noconfirm --needed

sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service

sudo yay -S nerd-fonts-complete
# sudo pacman -S ttf-cascadia-code ttf-dejavu ttf-fira-code ttf-roboto ttf-roboto-mono noto-fonts noto-fonts-emoji terminus-font --noconfirm --needed

# sudo pacman -S sh bash --noconfirm --needed
sudo pacman -S zsh fish --noconfirm --needed

sudo pacman -S kitty --noconfrim

sudo pacman -S firewall --noconfirm --needed
# sudo pacman -S ufw gufw --noconfirm --needed

sudo pacman -S vi vim --noconfirm --needed
sudo pacman -S neovim emacs --noconfirm --needed
sudo pacman -S kate kwrite --noconfirm --needed
sudo yay -S vscodium-bin
sudo pacman -S geany --noconfirm --needed

sudo pacman -S firefox --noconfirm --needed
sudo yay -S google.chrome --noconfirm
# sudo flatpak install com.google.Chrome -y
# sudo pacman -S brave chromium --noconfirm --needed

# sudo pacman -S python nodejs rust go --noconfirm --needed

sudo pacman -S python ipython --noconfirm --needed
# sudo pacman -S pip --noconfirm --needed

sudo pacman -S nodejs --noconfirm --needed
sudo pacman -S npm --noconfirm --needed

sudo pacman -S rustup rust-analyzer --noconfirm --needed

sudo pacman -S lua luarocks luajit --noconfirm --needed

sudo pacman -S dotnet-host dotnet-sdk dotnet-runtime dotnet-targeting-pack --noconfirm --needed

sudo pacman -S mono mono-addins --noconfirm --needed

sudo pacman -S go --noconfirm --needed

sudo pacman -S godot --noconfirm --needed

sudo pacman -S blender freecad --noconfirm

yay -S aseprite pixelorama grafx2 --noconfirm

sudo pacman -S lmms --noconfirm --needed

sudo pacman -S gwenview gimp krita inkscape --noconfirm --needed

# Video viewing/editing/encoding
sudo pacman -S vlc kdenlive shotcut handbrake --noconfirm --needed

# Audio viewing/editing/composition
sudo pacman -S elias audacity lmms --noconfirm --needed

sudo pacman -S docker --noconfirm --needed
# sudo pacman -S lxc lxd --noconfirm --needed
# sudo pacman -S podman --noconfirm --needed

sudo pacman -S linux-headers linux-lts-headers --noconfirm --needed
sudo pacman -S virtualbox vagarant --noconfirm --needed
sudo pacman -S virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-iso --noconfirm --needed
# sudo pacman -S virt-manager --noconfirm --needed

# sudo pacman -S abiword okular simple-scan --noconfirm --needed
# yay onlyoffice-desktopeditors

yay -S onlyoffice-desktopeditors
# sudo pacman -S libre-office-still --noconfirm --needed

sudo pacman -S abiword --noconfirm --needed

# sudo pacman -S dia --noconfirm --needed
flatpak install drawio

sudo pacman -S okular calibre --noconfirm --needed

sudo pacman -S simple-scan --nocomfirm

sudo pacman -S spectacle uget elinks --noconfirm --needed
yay -S ventoy-bin --noconfirm --needed

# sudo pacman -S flameshot --noconfirm --needed
sudo pacman -S spectacle --noconfirm --needed

sudo flatpak install dropbox -y

sudo pacman -S kio-gdrive --noconfirm --needed

sudo pacman -S elinks --noconfirm --needed

sudo pacman -S uget --noconfrim --needed

yay -S ventoy-bin

   yay -S variety arch-tweak-tool --noconfirm
