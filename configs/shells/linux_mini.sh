export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export DISABLE_DEVICONS=false # for Neovim config.
# export XDG_CONFIG_HOME="$HOME/.config"

export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_installed"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/.default-python-packages"
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export ASDF_GOLANG_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/golang/default-golang-pkgs"
export CHROME_EXECUTABLE="$(which chrome || which chromium)" # for flutter.

# Set tab width
# Credit: https://askubuntu.com/questions/63424/how-to-change-tab-width-in-terminal-in-ubuntu-10-04#comment2204539_251033
[[ $- == *i* ]] && tabs -2

# Linuxbrew aka Homebrew
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
	echo '[x_x] Cannot find Homebrew.'
fi

# golang
# export PATH=$PATH:/usr/local/go/bin
# NOTE: No need to set GOPATH and GOROOT since go1.8

source "$DOTFILES/configs/shells/functions/init.sh"
init_fzf
init_asdf 'Linux_mini'
init_chruby 'Linux_mini'

# Not use anymore:
# export NVM_DIR="$HOME/.nvm"
# init_nvm 'Linux_mini'
# init_pyenv 'Linux_mini'

source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
