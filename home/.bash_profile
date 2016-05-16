alias gd='cd ~/dev'
alias tt='cat ~/dev/dotfiles/my_commands.txt'
alias gg='cat ~/dev/dotfiles/my_commands_git.txt'

alias aa='alias'
alias ls='ls -Gha'
alias ll='ls -l'
alias ..='cd .. && ls'

alias gs='git status'
alias npmls='npm ls -g --depth=0'
alias ip='ipconfig getifaddr en0'


# colorize Terminal for Novel theme
export CLICOLOR=1
# export LSCOLORS=exfxcxdxbxegedabagacad
# default: exfxcxdxbxegedabagacad
export PS1="\n\[$(tput setaf 6)\]\u\[$(tput sgr0)\]@\[$(tput setaf 6)\]\h\[$(tput sgr0)\] in \[$(tput setaf 4)\]\W\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"

# npm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
