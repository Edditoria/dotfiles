#!/usr/bin/env bash

# These scripts will install brew formulae and Cask apps

# get current dir
dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

brew bundle --file=$dotfiles_dir/configs/homebrew/asap.brewfile
brew bundle --file=$dotfiles_dir/configs/homebrew/essentials.brewfile
brew bundle --file=$dotfiles_dir/configs/homebrew/sometimes.brewfile
