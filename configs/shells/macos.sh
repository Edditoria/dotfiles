export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export DISABLE_DEVICONS=false # for Neovim config.

export LANG=en_US.UTF-8 # to fix missing symbol characters in tmux.
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_installed"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"
export CHROME_EXECUTABLE="$(which chrome || which chromium)" # for flutter.

# Set tab width
# Credit: https://askubuntu.com/questions/63424/how-to-change-tab-width-in-terminal-in-ubuntu-10-04#comment2204539_251033
[[ $- == *i* ]] && tabs -2

source "$DOTFILES/configs/shells/functions/init.sh"
init_asdf 'macOS'
init_chruby 'macOS'

# Fix path not found in VSCode
export FLUTTER_ROOT="$(asdf where flutter)"

# Not use anymore:
# export NVM_DIR="$HOME/.nvm"
# init_nvm 'macOS'
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# init_pyenv 'macOS'

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
