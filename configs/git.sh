#!/usr/bin/env bash

# NOTE: Don't commit git (user)name and email in this file. Use functions/setup_git_user instead.
# git config --global user.name Edditoria
# git config --global user.name '(email@address.la)'

git config --global core.autocrlf input #linux and #macos
git config --global color.ui true
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.cp 'cherry-pick --no-commit'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.glog 'log --all --decorate --oneline --graph -16'
git config --global alias.gl 'log --all --decorate --oneline --graph -16'
git config --global alias.last 'log --stat --pretty=fuller HEAD -1'

# Opinionated configs:

git config --global alias.lazy !lazygit
git config --global core.editor micro
git config --global init.defaultbranch main

# Platform specific: #macos
if [[ $OSTYPE == 'darwin'* ]]; then
	git config --global credential.helper osxkeychain
fi
