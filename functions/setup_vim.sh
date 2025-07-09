#!/usr/bin/env bash

function setup_vim {
	local this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local this_repo_dir=$(dirname "$this_file_dir")

	mkdir -p "$HOME/.vim/autoload"
	mkdir -p "$HOME/.vim/backup"
	mkdir -p "$HOME/.vim/colors"
	mkdir -p "$HOME/.vim/plugged"
	curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s "$this_repo_dir/configs/vim/vimrc" "$HOME/.vim/vimrc"
	echo 'NOTE: You need to manually run `:PlugInstall` in Vim.'
}
