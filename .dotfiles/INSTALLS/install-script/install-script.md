
# Table of Contents

1.  [About Script](#orge629af3)
2.  [Updating cache & packages](#org91b0679)
3.  [Other Package Managers](#org81b676d)
    1.  [Flatpak](#org38f08e3)
    2.  [AppImages](#org9e2a99f)
    3.  [Brew](#org5e92be0)
    4.  [Yay (AUR)](#org31ea7ec)
        1.  [Get `base-devel` and `git`](#orgfa4df79)
        2.  [Get `yay` repository](#orgdc1b169)
        3.  [Install `yay` with `makepkg`](#orga1fa3d2)
        4.  [Check version](#orgb8c645c)
    5.  [Snap](#org96f5ff7)
        1.  [Get `snapd`](#org5521240)
        2.  [Start `snapd.socket` service](#org6951434)
        3.  [Enable classic `snap` support](#orgcee2285)
    6.  [Nix](#org0c190e0)
4.  [Package Manager GUI](#org5dae1c3)
    1.  [Pamac (ARCH)](#org94566a5)
    2.  [Discover (KDE)](#org0fa91d7)
5.  [System Utilities](#org6042e7d)
    1.  [System info utilities](#orgec66095)
    2.  [Finding utilities](#org4636fcb)
    3.  [Disk Management Utilities](#orga2a5b62)
6.  [Help Utilities](#org83c0510)
7.  [Source Code Management](#orge5a3e20)
8.  [Display Server](#orgc585b92)
9.  [Desktop Manager](#orgd5346b7)
10. [Desktop Environment](#org71fc2c3)
    1.  [KDE Plasma Desktop](#org6219b8e)
    2.  [KDE Plasma Desktop Minimal](#orgb58841d)
    3.  [Other Plasma Utilities](#orgcedbd54)
    4.  [KDE Virtual console](#org1dee2fa)
    5.  [KDE File manager](#org9d55ef9)
    6.  [KDE Package Explorer](#org71e86d5)
    7.  [KDE Text Editors](#org6f4d46c)
    8.  [KDE Battery manager](#orgdb40313)
    9.  [KDE System monitor](#org261a082)
    10. [KDE Applications](#org0d86f16)
    11. [KDE Utilities](#orgb72d1e0)
11. [X Session](#org0f0b2ef)
12. [Fonts](#org68602b5)
13. [Shells](#org09daf4e)
14. [Terminals](#org295d1fc)
15. [Firewall](#org5accbe3)
16. [Text Editors](#orge10c685)
17. [Web Browsers](#orgf4532cf)
18. [Languages, Runtime & Development Environment](#orgfefc782)
    1.  [Most Important](#org01cf80f)
    2.  [Python](#org20fb720)
    3.  [Node](#org63cfc0f)
    4.  [Rust](#org778f099)
    5.  [Lua](#org6e684a7)
    6.  [Dotnet](#orgcce246f)
    7.  [Mono](#org1a3fbee)
    8.  [Go](#org18aa919)
19. [Game & 3d Modeling](#org1317a55)
20. [Audio, Video & Multimedia](#orga21af8e)
    1.  [Photo Viewer & editor](#orgd8fc40a)
    2.  [Audio viewer & editor](#orge75377c)
    3.  [Video viewer & editor](#orgd428514)
21. [Virtual Machines & Containers](#orgb70dfe3)
    1.  [Containers](#org71e9341)
    2.  [Virtual Machines](#org98000c7)
22. [Office Utilities](#orgfb75ef8)
    1.  [Most Important](#orga8b1b15)
    2.  [Office Suite](#org26ab1fb)
    3.  [Rich Text Editor](#org7d560d1)
    4.  [Diagram Editor](#orgd9c6788)
    5.  [Document Viewer](#org2ad2378)
    6.  [Document Scan](#org5e4d985)
23. [Other Utilities](#org51a5783)
    1.  [Screenshot](#org251ca1a)
    2.  [Cloud storage](#orgf70b7d9)
        1.  [Dropbox](#org829df9c)
        2.  [Google Drive](#org12721b1)
    3.  [Text Based internet browser](#org76b5265)
    4.  [Download Manager](#orga5a3333)
    5.  [Bootable Media Creation Tool](#orgfb503d5)



<a id="orge629af3"></a>

# About Script

    #! /usr/bin/bash
    # Title: Arch KDE Install Guide Script
    # Description: A script to guide through KDE setup on archlinux
    # Author: Anishka Patel
    # Created: [2022-08-29 Mon]
    # Usage: ./install-script.sh


<a id="org91b0679"></a>

# Updating cache & packages

Arch Linux

    sudo pacman -Syu --noconfirm --needed

Debian / Ubuntu Based Linux

    # sudo apt update && sudo apt upgrade -y

Fedora / RHEL Based Linux

    # sudo dnf update && sudo dnf upgrade -y


<a id="org81b676d"></a>

# Other Package Managers


<a id="org38f08e3"></a>

## Flatpak

    sudo pacman -S flatpak --noconfirm --needed


<a id="org9e2a99f"></a>

## AppImages

    sudo pacman -S appimagelauncher --noconfirm --needed


<a id="org5e92be0"></a>

## Brew

    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash


<a id="org31ea7ec"></a>

## Yay (AUR)


<a id="orgfa4df79"></a>

### Get `base-devel` and `git`

    sudo pacman -S --needed base-devel git --noconfirm --needed


<a id="orgdc1b169"></a>

### Get `yay` repository

    git clone https://aur.archlinux.org/yay.git
    cd yay


<a id="orga1fa3d2"></a>

### Install `yay` with `makepkg`

    makepkg -si


<a id="orgb8c645c"></a>

### Check version

    yay --version


<a id="org96f5ff7"></a>

## Snap


<a id="org5521240"></a>

### Get `snapd`

    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    makepkg -si


<a id="org6951434"></a>

### Start `snapd.socket` service

    sudo systemctl enable --now snapd.socket


<a id="orgcee2285"></a>

### Enable classic `snap` support

    sudo ln -s /var/lib/snapd/snap /snap


<a id="org0c190e0"></a>

## TODO Nix


<a id="org5dae1c3"></a>

# Package Manager GUI


<a id="org94566a5"></a>

## Pamac (ARCH)

    
    # Sources: pacman, aur
    # yay -S pamac-aur
    
    # Sources: pacman, flatpak, aur
    yay -S pamac-flatpak
    
    # Sources: pacman, flatpak, aur, snap
    # yay -S pamac-full


<a id="org0fa91d7"></a>

## Discover (KDE)

    
    # Arch distro
    sudo pacman -S discover --noconfirm --needed


<a id="org6042e7d"></a>

# System Utilities

    sudo pacman -S htop glances powertop --noconfirm --needed
    # sudo pacman -S sysstat ifstat --noconfirm --needed


<a id="orgec66095"></a>

## System info utilities

    sudo pacman -S neofetch --noconfirm --needed


<a id="org4636fcb"></a>

## Finding utilities

    sudo pacman -S fd mlocate --noconfirm --needed


<a id="orga2a5b62"></a>

## Disk Management Utilities

    sudo pacman -S df du --noconfirm --needed


<a id="org83c0510"></a>

# Help Utilities

    sudo pacman -S tldr --noconfirm --needed
    sduo pacman -S man-db mandoc --noconfirm --needed


<a id="orge5a3e20"></a>

# Source Code Management

    sudo -S git github-cli --noconfirm --needed


<a id="orgc585b92"></a>

# Display Server

    # pacman -S xorg


<a id="orgd5346b7"></a>

# Desktop Manager

    sudo pacman -S sddm --noconfirm --needed


<a id="org71fc2c3"></a>

# Desktop Environment


<a id="org6219b8e"></a>

## KDE Plasma Desktop

    sudo pacman -S plasma --noconfirm --needed


<a id="orgb58841d"></a>

## KDE Plasma Desktop Minimal

    sudo pacman -S plasma-desktop --noconfirm --needed


<a id="orgcedbd54"></a>

## Other Plasma Utilities

    sudo pacman -S plasma-nm plasma-pa kdeplasma-addons kde-gtk-config --noconfirm --needed


<a id="org1dee2fa"></a>

## KDE Virtual console

    sudo pacman -S konsole yakuake --noconfirm --needed


<a id="org9d55ef9"></a>

## KDE File manager

    sudo pacman -S doplhin --noconfirm --needed


<a id="org71e86d5"></a>

## KDE Package Explorer

    sudo pacman -S discover --noconfirm --needed


<a id="org6f4d46c"></a>

## KDE Text Editors

    sudo pacman -S kate kwrite --noconfirm --needed


<a id="orgdb40313"></a>

## KDE Battery manager

    sudo pacman -S powerdevil --noconfirm --needed


<a id="org261a082"></a>

## KDE System monitor

    sudo pacman -S ksysguard --noconfirm --needed


<a id="org0d86f16"></a>

## KDE Applications

List of applications: [KDE-Applications | Arch Linux](https://archlinux.org/groups/x86_64/kde-applications/)

    # sudo pacman -S kde-applications --noconfirm --needed


<a id="orgb72d1e0"></a>

## KDE Utilities

List of utilities: [KDE-Utilities | Arch Linux](https://archlinux.org/groups/x86_64/kde-utilities/)

    # sudo pacman -S kde-utilities --noconfirm --needed


<a id="org0f0b2ef"></a>

# X Session

    sudo systemctl enable sddm.service
    sudo systemctl enable NetworkManager.service


<a id="org68602b5"></a>

# Fonts

    sudo yay -S nerd-fonts-complete
    # sudo pacman -S ttf-cascadia-code ttf-dejavu ttf-fira-code ttf-roboto ttf-roboto-mono noto-fonts noto-fonts-emoji terminus-font --noconfirm --needed


<a id="org09daf4e"></a>

# Shells

    # sudo pacman -S sh bash --noconfirm --needed
    sudo pacman -S zsh fish --noconfirm --needed


<a id="org295d1fc"></a>

# Terminals

    sudo pacman -S kitty --noconfrim


<a id="org5accbe3"></a>

# Firewall

    sudo pacman -S firewall --noconfirm --needed
    # sudo pacman -S ufw gufw --noconfirm --needed


<a id="orge10c685"></a>

# Text Editors

    sudo pacman -S vi vim --noconfirm --needed
    sudo pacman -S neovim emacs --noconfirm --needed
    sudo pacman -S kate kwrite --noconfirm --needed
    sudo yay -S vscodium-bin


<a id="orgf4532cf"></a>

# Web Browsers

    sudo pacman -S firefox --noconfirm --needed
    sudo yay -S google.chrome
    # sudo flatpak install com.google.Chrome -y
    # sudo pacman -S brave chromium --noconfirm --needed


<a id="orgfefc782"></a>

# Languages, Runtime & Development Environment


<a id="org01cf80f"></a>

## Most Important

    # sudo pacman -S python nodejs rust go --noconfirm --needed


<a id="org20fb720"></a>

## Python

    sudo pacman -S python ipython --noconfirm --needed
    # sudo pacman -S pip --noconfirm --needed


<a id="org63cfc0f"></a>

## Node

    sudo pacman -S nodejs --noconfirm --needed
    sudo pacman -S npm --noconfirm --needed


<a id="org778f099"></a>

## Rust

    sudo pacman -S rustup rust-analyzer --noconfirm --needed


<a id="org6e684a7"></a>

## Lua

    sudo pacman -S lua luarocks luajit --noconfirm --needed


<a id="orgcce246f"></a>

## Dotnet

    sudo pacman -S dotnet-host dotnet-sdk dotnet-runtime dotnet-targeting-pack --noconfirm --needed


<a id="org1a3fbee"></a>

## Mono

    sudo pacman -S mono mono-addins --noconfirm --needed


<a id="org18aa919"></a>

## Go

    sudo pacman -S go --noconfirm --needed


<a id="org1317a55"></a>

# Game & 3d Modeling

    sudo pacman -S godot blender freecad --noconfirm --needed


<a id="orga21af8e"></a>

# Audio, Video & Multimedia


<a id="orgd8fc40a"></a>

## Photo Viewer & editor

    sudo pacman -S gwenview gimp krita inkscape --noconfirm --needed


<a id="orge75377c"></a>

## Audio viewer & editor

    # Video viewing/editing/encoding
    sudo pacman -S vlc kdenlive handbrake --noconfirm --needed


<a id="orgd428514"></a>

## Video viewer & editor

    # Audio viewing/editing/composition
    sudo pacman -S elias audacity lmms --noconfirm --needed


<a id="orgb70dfe3"></a>

# Virtual Machines & Containers


<a id="org71e9341"></a>

## Containers

    sudo pacman -S docker --noconfirm --needed
    # sudo pacman -S lxc lxd --noconfirm --needed
    # sudo pacman -S podman --noconfirm --needed


<a id="org98000c7"></a>

## Virtual Machines

    sudo pacman -S linux-headers linux-lts-headers --noconfirm --needed
    sudo pacman -S virtualbox vagarant --noconfirm --needed
    sudo pacman -S virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-iso --noconfirm --needed
    # sudo pacman -S virt-manager --noconfirm --needed


<a id="orgfb75ef8"></a>

# Office Utilities


<a id="orga8b1b15"></a>

## Most Important

    # sudo pacman -S abiword okular simple-scan --noconfirm --needed
    # yay onlyoffice-desktopeditors


<a id="org26ab1fb"></a>

## Office Suite

    yay -S onlyoffice-desktopeditors
    # sudo pacman -S libre-office-still --noconfirm --needed


<a id="org7d560d1"></a>

## Rich Text Editor

    sudo pacman -S abiword --noconfirm --needed


<a id="orgd9c6788"></a>

## Diagram Editor

    # sudo pacman -S dia --noconfirm --needed
    flatpak install drawio


<a id="org2ad2378"></a>

## Document Viewer

    sudo pacman -S okular calibre --noconfirm --needed


<a id="org5e4d985"></a>

## Document Scan

    sudo pacman -S simple-scan --nocomfirm


<a id="org51a5783"></a>

# Other Utilities

    sudo pacman -S spectacle uget elinks --noconfirm --needed
    yay -S ventoy-bin --noconfirm --needed


<a id="org251ca1a"></a>

## Screenshot

    # sudo pacman -S flameshot --noconfirm --needed
    sudo pacman -S spectacle --noconfirm --needed


<a id="orgf70b7d9"></a>

## Cloud storage


<a id="org829df9c"></a>

### Dropbox

    sudo flatpak install dropbox -y


<a id="org12721b1"></a>

### Google Drive

    sudo pacman -S kio-gdrive --noconfirm --needed


<a id="org76b5265"></a>

## Text Based internet browser

    sudo pacman -S elinks --noconfirm --needed


<a id="orga5a3333"></a>

## Download Manager

    sudo pacman -S uget --noconfrim --needed


<a id="orgfb503d5"></a>

## Bootable Media Creation Tool

    yay -S ventoy-bin

