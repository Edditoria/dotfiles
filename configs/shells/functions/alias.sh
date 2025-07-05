# Require: $DEV

# Aliases that override the default behaviour of current commands.
# These may affect scripting and damaging your system.
# Think twice before add anything.
function alias_override {
	alias cp='cp -i'
	alias mv='mv -i'
	alias rm='rm -i'
	alias ls='ls --color=auto'
}

# Aliases for lazy me.
# Should avoid common and popular name of commands and CLI tools.
function alias_lazy {
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
}

# Aliases for quick actions so my life is a bit easier.
function alias_quick {
	alias myip='curl https://checkip.amazonaws.com'
	if [[ "$(uname -s)" == 'Darwin' ]]; then
		alias mylocalip='ipconfig getifaddr en0'
	else
		alias mylocalip="hostname -I | awk '{print $1}'"
	fi
	alias hugo_server='hugo server -D --baseURL=http://$(myip) --bind=0.0.0.0 --port=4000'
	alias flutter_server='flutter run -d web-server --web-hostname 0.0.0.0 --web-port 4000'
	alias ducks='du -cks * | sort -rn | head -15' # have fun!
}

# Aliases that yell at me because of my goldfish brain.
function alias_yell {
	alias random='echo "[@_@]ﾉ shuf -n1 -i 0-100 # range is inclusive."'
}
