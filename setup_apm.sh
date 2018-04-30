#!/usr/bin/env bash

# get current dir
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

apm_list_file="$dotfiles_dir/data/apm_list.txt"

source $dotfiles_dir/utils/run_by_line.sh
run_by_line "apm install" $apm_list_file
