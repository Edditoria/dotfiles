export DEV="/workspaces/"
export DOTFILES="/workspaces/.codespaces/.persistedshare/dotfiles"
# export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask" # Too slow for adhoc up-and-running.
# export NVM_DIR # CodesSpaces implements its own nvm called "NVS".

# asdf is not installed. Get ready only:
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"

# source "$DOTFILES/configs/shells/functions/init.sh"

source "$DOTFILES/configs/shells/functions/alias.sh"
# source "$DOTFILES/configs/shells/functions/prompt_style.sh" # Default is fine. :)
