#!/usr/bin/env bash

# setup Terminal.app theme
# credit: https://github.com/ymendel/dotfiles/blob/master/osx/terminal.defaults

# get current directory
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
theme_name="Novel_customized"

open "$dotfiles_dir/$theme_name.terminal"
sleep 2  # wait a bit to make sure the theme is loaded
defaults write com.apple.Terminal "Default Window Settings" -string "$theme_name"
defaults write com.apple.Terminal "Startup Window Settings" -string "$theme_name"
killall Terminal
