export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/.default-npm-packages"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# asdf (includes node, python, etc.)
function init_asdf {
	if [[ -s $(brew --prefix asdf)/libexec/asdf.sh ]]; then
		source $(brew --prefix asdf)/libexec/asdf.sh
		source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
	else
		echo '[x_x] Cannot find asdf.'
	fi
}

# nvm for node
function init_nvm {
	if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
		source $(brew --prefix nvm)/nvm.sh
		source $(brew --prefix nvm)/etc/bash_completion.d/nvm
	else
		echo '[x_x] Cannot find nvm.'
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

# pyenv for python
function init_pyenv {
	if which pyenv > /dev/null; then
		eval "$(pyenv init -)"
	else
		echo '[x_x] Cannot find pyenv.'
	fi
}

init_asdf
# init_nvm
init_rbenv
# init_pyenv
source "$DOTFILES/configs/shells/functions/alias.sh"
source "$DOTFILES/configs/shells/functions/prompt_style.sh"
