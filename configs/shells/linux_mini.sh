export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export DISABLE_DEVICONS=false # for Neovim config.
# export XDG_CONFIG_HOME="$HOME/.config"

export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

export BAT_CONFIG_PATH="$DOTFILES/configs/bat/bat.conf"
export BAT_CONFIG_DIR="$DOTFILES/configs/bat"

export MISE_GO_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/golang/default_golang_packages.conf"
export MISE_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/default_python_packages.conf"
export MISE_NODE_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/default_npm_packages.conf"
export MISE_RUBY_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/ruby/default_gems.conf"

# Keep for plugin development only:
export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/asdfrc"

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
source "$DOTFILES/configs/shells/functions/set.sh"
source "$DOTFILES/configs/shells/functions/alias.sh"

init_fzf
init_mise
# init_asdf 'Linux_mini'
set_flutter
alias_lazy && alias_quick && alias_yell && alias_override
set_prompt_style

# Not use anymore:
# export NVM_DIR="$HOME/.nvm"
# init_nvm 'Linux_mini'
