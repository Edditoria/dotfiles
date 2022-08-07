#!/usr/bin/env bash

# These scripts will initial setup by symlink dotfiles at home directory

# get current dir
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "${dotfiles_dir}/home/.gemrc" ~
mkdir -p ~/.bundle
ln -s "${dotfiles_dir}/home/.bundle/config" "${HOME}/.bundle"
