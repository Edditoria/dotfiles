export DOTFILES="/workspaces/.codespaces/.persistedshare/dotfiles"

# I source one file directly in my machine:
# source "$DOTFILES/configs/shells/codespaces.sh"

# But you can write your own and source what you like:

# source "$DOTFILES/configs/shells/functions/init.sh"
# init_nvm 'CodeSpaces' # and etc.
source "$DOTFILES/configs/shells/functions/alias.sh"
# source "$DOTFILES/configs/shells/functions/prompt_style.sh"
