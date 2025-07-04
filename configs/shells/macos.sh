export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export DISABLE_DEVICONS=false # for Neovim config.

export PATH="/usr/local/sbin:$PATH" # as instructed by `brew doctor`.
export LANG=en_US.UTF-8 # to fix missing symbol characters in tmux.
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

export MISE_GO_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/golang/default_golang_packages.conf"
export MISE_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"
export MISE_NODE_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export MISE_RUBY_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/ruby/default_gems.conf"

# Keep for plugin developement only:
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"

export CHROME_EXECUTABLE="$(which chrome || which chromium)" # for flutter.

# Set tab width
# Credit: https://askubuntu.com/questions/63424/how-to-change-tab-width-in-terminal-in-ubuntu-10-04#comment2204539_251033
[[ $- == *i* ]] && tabs -2

source "$DOTFILES/configs/shells/functions/init.sh"
source "$DOTFILES/configs/shells/functions/set.sh"

init_fzf
init_mise
# init_asdf 'macOS'
set_flutter

# Not use anymore:
# export NVM_DIR="$HOME/.nvm"
# init_nvm 'macOS'

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
