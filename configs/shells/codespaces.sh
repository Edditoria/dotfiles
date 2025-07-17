export DEV="/workspaces/"
export DOTFILES="/workspaces/.codespaces/.persistedshare/dotfiles"

# Homebrew is too slow for adhoc up-and-running:
# export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

export BAT_CONFIG_PATH="$DOTFILES/configs/bat/bat.conf"
export BAT_CONFIG_DIR="$DOTFILES/configs/bat"

# Keep for plugin development only:
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/asdfrc"

# CodesSpaces had done for you:
# export NVM_DIR="$HOME/.nvm"

# source "$DOTFILES/configs/shells/functions/init.sh"
source "$DOTFILES/configs/shells/functions/set.sh"
source "$DOTFILES/configs/shells/functions/alias.sh"

alias_lazy && alias_quick && alias_yell && alias_override

# Default is fine :)
# set_prompt_style
