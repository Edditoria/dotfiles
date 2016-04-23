#!/usr/bin/env bash

# get current dir
DOTFILES_DIR="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$DOTFILES_DIR/backup"


# install brew formula
brew install $(cat "$BACKUP_DIR/brew_leaves.txt")

# add Cask repo to Homebrew
brew tap caskroom/cask

# install cask apps
brew cask install $(cat "$BACKUP_DIR/brew_cask_list.txt")
