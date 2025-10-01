#!/usr/bin/env bash

[ -f flatpak-packages-list.txt ] &&
    cat flatpak-packages-list.txt | xargs -L1 flatpak install flathub
