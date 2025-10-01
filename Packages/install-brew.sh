#!/usr/bin/env bash

[ -f brew-packages-list.txt ] && 
    cat brew-packages-list.txt |xargs -L1  brew install 
