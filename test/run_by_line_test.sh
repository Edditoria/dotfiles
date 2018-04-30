#!/usr/bin/env bash

echo "Expected result:"
echo "Echo from \"item 1\" to \"item 9\". One per line without any empty line"
echo ""
echo "Output:"

# get dotfiles dir
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

. $dotfiles_dir/utils/run_by_line.sh
run_by_line "echo" "$dotfiles_dir/test/run_by_line_test.txt"
