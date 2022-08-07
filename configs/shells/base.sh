export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"

export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

# nvm for npm
export NVM_DIR=$HOME/.nvm
if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
	source $(brew --prefix nvm)/nvm.sh
fi

# rbenv for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv for python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
