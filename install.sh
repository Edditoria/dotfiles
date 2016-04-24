#!/usr/bin/env bash

# get current dir
DOTFILES_DIR="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlinks

ln -s "$DOTFILES_DIR/root/.bash_profile" ~
ln -s "$DOTFILES_DIR/root/.bashrc" ~


# change OSX settings

# Ask for the administrator password upfront
sudo -v

# Disable the boot up "ding" sound
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable smart quotes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Screeshot
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture name "Screenshot"
