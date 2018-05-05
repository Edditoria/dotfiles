#!/usr/bin/env bash

# change OSX settings

# Ask for the administrator password upfront
sudo -v

# Disable the boot up "ding" sound
# sudo nvram SystemAudioVolume=" " # not apply to High Sierra

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true # default no value
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true # testing in High Sierra

# Disable smart quotes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Audo-hide Dock
defaults write com.apple.dock autohide -bool true

# Disable auto-rearrange Spaces
defaults write com.apple.dock mru-spaces -bool false # High Sierra, default no value

# # Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# # doesn't work in Yosemite

# Screeshot
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture name "Screenshot"

killall Dock
killall SystemUIServer
