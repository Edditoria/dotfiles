#!/usr/bin/env bash

# These scripts will initial setup by symlink dotfiles at home directory

# get current dir
dotfiles_dir="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s "${dotfiles_dir}/home/.bash_profile" ~
ln -s "${dotfiles_dir}/home/.bashrc" ~
ln -s "${dotfiles_dir}/home/.gemrc" ~
mkdir -p ~/.bundle
ln -s "${dotfiles_dir}/home/.bundle/config" "${HOME}/.bundle"
mkdir -p ~/.atom
ln -s "${dotfiles_dir}/home/.atom/config.cson" "${HOME}/.atom"
ln -s "${dotfiles_dir}/home/.atom/init.coffee" "${HOME}/.atom"
ln -s "${dotfiles_dir}/home/.atom/keymap.cson" "${HOME}/.atom"
ln -s "${dotfiles_dir}/home/.atom/snippets.cson" "${HOME}/.atom"
ln -s "${dotfiles_dir}/home/.atom/styles.less" "${HOME}/.atom"
