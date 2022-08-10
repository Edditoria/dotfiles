export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
# export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export NVM_DIR="$HOME/.nvm"
export CHROME_EXECUTABLE='/snap/bin/chromium' # for flutter.
export PATH="$HOME/.rbenv/bin:$PATH"

# Linuxbrew aka Homebrew
if [[ -f "$HOME/.linuxbrew/bin/brew" ]]; then
	eval "$($HOME/.linuxbrew/bin/brew shellenv)"
else
	echo '[x_x] Cannot find Homebrew.'
fi

# asdf (inc: node, python, etc.)
function init_asdf {
	if [[ -f $HOME/apps/asdf/asdf.sh ]]; then
		source $HOME/apps/asdf/asdf.sh
	else
		echo '[x_x] Cannot find asdf.'
	fi
}

# nvm for node
function init_nvm {
	if [[ -s "$NVM_DIR/nvm.sh" ]]; then
		source "$NVM_DIR/nvm.sh"
	else
		echo '[x_x] Cannot find nvm.sh file.'
	fi
	if [[ -s "$NVM_DIR/bash_completion" ]]; then
		source "$NVM_DIR/bash_completion"
	else
		echo '[x_x] Cannot find bash_completion of nvm.'
	fi
}

# rbenv for ruby
function init_rbenv {
	if which rbenv > /dev/null; then
		eval "$(rbenv init -)"
	else
		echo '[x_x] Cannot find rbenv.'
	fi
}

# golang
# export PATH=$PATH:/usr/local/go/bin
# NOTE: No need to set GOPATH and GOROOT since go1.8

init_asdf
# init_nvm
init_rbenv
source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
