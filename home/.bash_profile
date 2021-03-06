export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"

alias gd="cd $DEV"
alias tt="cat $DOTFILES/notes/tt.txt"
alias gg="cat $DOTFILES/notes/gg.txt"

alias be='bundle exec'
alias l='ls -AFG'
alias ll='ls -AFG -lh'
alias ..='cd .. && ls -AFG'

alias gs='git status'
alias npmls='npm ls --depth=0'
alias npmlsg='npm ls -g --depth=0'
alias ip='ipconfig getifaddr en0'

export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"

# colorize Terminal for Novel theme
export CLICOLOR=1
# export LSCOLORS=exfxcxdxbxegedabagacad
# default: exfxcxdxbxegedabagacad
export PS1="\n\[$(tput setaf 6)\]\u\[$(tput sgr0)\]@\[$(tput setaf 6)\]\h\[$(tput sgr0)\] in \[$(tput setaf 4)\]\W\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"

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
