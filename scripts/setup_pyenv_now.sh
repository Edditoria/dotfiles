#!/usr/bin/env bash

# By default, install.sh will not run functions/setup_pyenv. You can source this file directly.

# IMPORTANT: You need to open a shell that:
# - Disable asdf.
# - Enable pyenv.

source "$DOTFILES/functions/setup_pyenv.sh"
setup_pyenv
