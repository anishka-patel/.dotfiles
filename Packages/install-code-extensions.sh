#!/usr/bin/env bash

[ -f code-packages-list.txt ] &&
    cat code-packages-list.txt |xargs -L1 code --install-extension
