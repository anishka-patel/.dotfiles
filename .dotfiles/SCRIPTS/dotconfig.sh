#!/usr/bin/bash
# Title: Dotconfig Script
# Description: A script file to link relevant files to relevent directories and backup where it is required
# Created: [2022-09-16 Fri]
# Usage: ./dotconfig.sh

if [[ -f ~/.bashrc ]]; then
    echo -n "Backing up old .bashrc file..."
    mv ~/.bashrc ~/.bashrc.bak
    echo "Completed"
fi
echo -n "Setting up bash files..."
cp .bashrc ~/.bashrc
echo "Completed"

if [[ -f ~/.zshrc ]]; then
    echo -n "Backing up old .zshrc file..."
    mv ~/.zshrc ~/.zshrc.bak
    echo "Completed"
fi
echo -n "Setting up zsh files..."
cp .zshrc ~/.zshrc
echo "Completed"

if [[ -f ~/.config/fish/config.fish ]]; then
    echo -n "Backing up old config.fish file..."
    mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak
    echo "Completed"
fi
echo -n "Setting up fish files..."
cp .config/fish/config.fish ~/.config/fish/config.fish
echo "Completed"

if [[ -f ~/.config/kitty/kitty.conf ]]; then
    echo -n "Backing up old kitty.conf file..."
    mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak
    echo "Completed"
fi
echo -n "Setting up kitty files..."
cp .config/kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "Completed"

if [[ -f ~/.exrc ]]; then
    echo -n "Backing up old vim files..."
    mv ~/.exrc ~/.exrc.bak
    echo "Completed"
fi
echo -n "Setting up vi files..."
cp .vimrc ~/.vimrc
echo "Completed"

if [[ -f ~/.vimrc ]]; then
    echo -n "Backing up old vim files..."
    mv ~/.vimrc ~/.vimrc.bak
    echo "Completed"
fi
echo -n "Setting up vim files..."
cp .vimrc ~/.vimrc
echo "Completed"

if [[ -f ~/.config/nvim/init.lua ]]; then
    echo -n "Backing up old nvim/init.lua"
    mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua.bak
    echo "Completed"
fi
echo -n "Setting up nvim/init.lua"
cp .config/nvim/init.lua ~/.config/nvim/init.lua
echo "Completed"
if [[ -f ~/.config/nvim/lua/user/init.lua ]]; then
    echo -n "Backing up old nvim/lua/user/init.lua"
    mv ~/.config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua.bak
    echo "Completed"
fi
echo -n "Setting up nvim/lua/user/init.lua"
cp .config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua
echo "Completed"

if [[ -f ~/.config/lvim/init.lua ]]; then
    echo -n "Backing up old lvim/config.lua"
    mv ~/.config/lvim/config.lua ~/.config/lvim/config.lua.bak
    echo "Completed"
fi
echo -n "Setting up lvim/config.lua"
cp .config/lvim/config.lua ~/.config/lvim/config.lua
echo "Completed"

if [[ -d ~/.doom.d/ ]]; then
    echo -n "Backing up old doom emacs files..."
    mv ~/.doom.d ~/.doom.d.bak
    echo "Completed"
fi
echo -n "Setting up doom files"
cp .doom.d ~/.doom.d
echo "Completed"

echo "Installing vscodium extensions..."
cat packages-list/vscodium-packages-list.txt | xargs -L1 codium --install-extension
echo "Installing vscodium extensions... Completed"
if [[ -d ~/.config/VSCodium/user ]]; then
    echo -n "Backing old codium files"
    mv ~/.config/VSCodium/user/keybindings.json ~/.config/VSCodium/user/keybindings.json.bak
    mv ~/.config/VSCodium/user/settings.json ~/.config/VSCodium/user/settings.json.bak
    echo "Completed"
fi
echo "Moving codium files..."
cp .config/VSCodium/user/keybindings.json ~/.config/VSCodium/user/keybindings.json
cp .config/VSCodium/user/settings.json ~/.config/VSCodium/user/settings.json
echo "Completed"

pip install konsave

echo "Installing KDE Config"
if [[ -e ~/ani-kde-config.knsv ]]; then
    echo -n "Backing up old kde config files..."
    mv ~/ani-kde-config.knsv ~/ani-kde-config.knsv.bak
    echo "Completed"
fi
echo -n "Moving kde config files..."
cp ./exports/ani-kde-config.knsv ~/ani-kde-config.knsv
echo "Completed"
echo -n "Applying kde config files..."
konsave -i ~/ani-kde-config.knsv
echo "Completed"
