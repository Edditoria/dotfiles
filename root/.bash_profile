# in Cask, install apps to ~/Applications/
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

alias ..="cd .. && ls"
alias tt="cat ~/dev/dotfiles/my_commands.txt"

# npm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
