export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

# asdf (inc: python, etc.)
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/default_npm_packages"
source $(brew --prefix asdf)/libexec/asdf.sh
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

# nvm for node
export NVM_DIR=$HOME/.nvm
if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
	source $(brew --prefix nvm)/nvm.sh
	source $(brew --prefix nvm)/etc/bash_completion.d/nvm
fi

# rbenv for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv for python
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
