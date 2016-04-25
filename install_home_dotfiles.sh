#!/usr/bin/env bash

# get current dir
DOTFILES_DIR="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlinks

ln -s "$DOTFILES_DIR/home/.bash_profile" ~
ln -s "$DOTFILES_DIR/home/.bashrc" ~
ln -s "$DOTFILES_DIR/home/.gemrc" ~
