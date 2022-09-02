export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"
export NVM_DIR="$HOME/.nvm"
export VIMINIT="source $DOTFILES/configs/vim/.vimrc"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source "$DOTFILES/configs/shells/functions/init.sh"
init_asdf 'macOS'
# init_nvm 'macOS'
init_rbenv 'macOS'
# init_pyenv 'macOS'

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
