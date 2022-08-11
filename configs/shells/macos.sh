export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export DOTFILES_PROFILE='macOS'
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source "$DOTFILES/configs/shells/functions/init.sh"
init_asdf "$DOTFILES_PROFILE"
# init_nvm "$DOTFILES_PROFILE"
init_rbenv "$DOTFILES_PROFILE"
# init_pyenv "$DOTFILES_PROFILE"

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
