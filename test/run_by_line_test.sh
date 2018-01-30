#!/usr/bin/env bash

echo "Expected result:"
echo "Echo from \"item 1\" to \"item 9\". One per line without any empty line"
echo ""
echo "Output:"

. $DOTFILES/utils/run_by_line.sh
run_by_line "echo" "$DOTFILES/test/run_by_line_test.txt"
