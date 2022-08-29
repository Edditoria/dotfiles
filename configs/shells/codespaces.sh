export DEV="/workspaces/"
export DOTFILES="/workspaces/.codespaces/.persistedshare/dotfiles"

# Homebrew is too slow for adhoc up-and-running:
# export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

# asdf is not installed. Get ready only:
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"

# CodesSpaces had done for you:
# export NVM_DIR="$HOME/.nvm"

# source "$DOTFILES/configs/shells/functions/init.sh"

source "$DOTFILES/configs/shells/functions/alias.sh"

# Default is fine:)
# source "$DOTFILES/configs/shells/functions/prompt_style.sh"
