export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
# export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"
export NVM_DIR="$HOME/.nvm"
export CHROME_EXECUTABLE='/snap/bin/chromium' # for flutter.
export PATH="$HOME/.rbenv/bin:$PATH"

# Set tab width
# Credit: https://askubuntu.com/questions/63424/how-to-change-tab-width-in-terminal-in-ubuntu-10-04#comment2204539_251033
[[ $- == *i* ]] && tabs -2

# Linuxbrew aka Homebrew
if [[ -f "$HOME/.linuxbrew/bin/brew" ]]; then
	eval "$($HOME/.linuxbrew/bin/brew shellenv)"
else
	echo '[x_x] Cannot find Homebrew.'
fi

# golang
# export PATH=$PATH:/usr/local/go/bin
# NOTE: No need to set GOPATH and GOROOT since go1.8

source "$DOTFILES/configs/shells/functions/init.sh"
init_asdf 'Linux_mini'
# init_nvm 'Linux_mini'
init_rbenv 'Linux_mini'
# init_pyenv 'Linux_mini'

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
