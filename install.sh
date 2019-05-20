#!/usr/bin/env bash

if [ -e .dotfiles_install_tmp/ ]; then
    echo "Working directory is already exist!"
    rm -rf .dotfiles_install_tmp/ 
fi
