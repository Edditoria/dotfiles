#!/usr/bin/env bash

# get current dir
DOTFILES_DIR="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"


# install brew formula
brew install $(cat "$DOTFILES_DIR/brew_leaves.txt")

# add Cask repo to Homebrew
brew tap caskroom/cask

# build symlink for every cask app install
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# install cask apps
brew cask install $(cat "$DOTFILES_DIR/brew_cask_list.txt")
