# Require to source base.sh first.

# export XDG_CONFIG_HOME="$HOME/.config"

# Linuxbrew aka Homebrew
eval "$($HOME/.linuxbrew/bin/brew shellenv)"

# asdf (inc: node, python, etc.)
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/default_npm_packages"
if [ -f $HOME/apps/asdf/asdf.sh ]; then
	source $HOME/apps/asdf/asdf.sh
fi

# nvm for node
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# rbenv for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# golang
# export PATH=$PATH:/usr/local/go/bin
# NOTE: No need to set GOPATH and GOROOT since go1.8

# flutter
export CHROME_EXECUTABLE='/snap/bin/chromium'
