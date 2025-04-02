# Require: $DOTFILES and $DEV

# Override the defaults

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'

# Lazy shortcuts

alias l='ls -aAFCG'
alias ll='ls -aAFlhG'
# NOTE: `ls -G` to suppress group name on Linux
alias ..='cd .. && l'
alias gd="cd $DEV && l"

alias gs='git status'
alias gl='git log --pretty=fuller'
alias ggl='git glog'
alias be='bundle exec'
alias py='python3'
alias py3='python3'
alias py2='python2'
alias npmls='npm ls --depth=0' # for legacy nodejs.
alias npmlsg='npm ls -g --depth=0' # legacy old nodejs.

alias m='micro'
alias v='nvim'

# Quick commands

alias myip='curl https://checkip.amazonaws.com'
if [[ "$(uname -s)" == 'Darwin' ]]; then
	alias mylocalip='ipconfig getifaddr en0'
else
	alias mylocalip="hostname -I | awk '{print $1}'"
fi
alias hugo_server='hugo server -D --baseURL=http://$(myip) --bind=0.0.0.0 --port=4000'
alias flutter_server='flutter run -d web-server --web-hostname 0.0.0.0 --web-port 4000'

# Remind myself

alias random='echo "[@_@]ﾉ shuf -n1 -i 0-100 # range is inclusive."'

# Other things

alias ducks='du -cks * | sort -rn | head -15' # have fun!
