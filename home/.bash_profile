alias gd='cd ~/dev'
alias tt='cat ~/dev/dotfiles/notes/tt.txt'
alias gg='cat ~/dev/dotfiles/notes/gg.txt'

alias aa='alias'
alias be='bundle exec'
alias ls='ls -Gha'
alias ll='ls -l'
alias ..='cd .. && ls'

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
export NVM_DIR=~/.nvm
if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
  source $(brew --prefix nvm)/nvm.sh
fi

# rbenv for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
