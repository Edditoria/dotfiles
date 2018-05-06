# Edditoria Does Dotfiles

A "dotfiles" approach can help you set up a new machine much faster and more importantly keep a consistent system environment. So I join this big dotfiles family! \:3

- What is *xxx does dotfiles*? Please read [Getting Started With Dotfiles][get_start].
- The dotfiles community is so big. Github keeps a good list in <https://dotfiles.github.io/>.

[get_start]: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789 "Getting Started With Dotfiles"


# My Setup

- Current OS: OSX 10.10.5
- Dotfiles dir: `~/dev/dotfiles` *(not `.dotfiles`)*
- App/package managers:
	- Mac AppStore for apps
	- `brew cask` for more apps
	- `brew` for cli tools
	- `nvm` to manage `node` and `npm`
	- `rbenv` and `bundler` to manage `ruby`
	- `pyenv` and `pip` to manage `python`
- Cask apps in customized directory: `/Applications/Cask`
- `nvm alias default` is `carbon` (neither `stable` nor `lts/carbon`)
- Keep `rdoc` and `ri` for `gem install`, but not keep for `gem update`

# Useful Commands

- `tt` and `gg` to print my stupid note for some Terminal commands.
- `. update_appstore.sh` to update Mac apps from AppStore.
- `. update_brew.sh` to update brew and cask apps.
- `. update_npm.sh` to update npm and packages (stable, lts/\*)
- `. backup.sh` to backup a list to brew_leaves.txt, brew_cask_list.txt and app_list.txt, etc.
- `npm check -gu` for each npm version to interactively upgrade npm packages.


---

# Install for New Machine

## Prepare Before Dotfiles

1. Make sure your internet connection is stable.
1. Change your computer name and local host name:

	```shell
	computer_name="EddiMBP" # replace with your preferred name
	sudo scutil --set ComputerName "$computer_name"
	sudo scutil --set LocalHostName "$computer_name"
	dscacheutil -flushcache
	```

1. Install Xcode command line tools or app:

	```shell
	xcode-select --install
	# then click "Install" for CLT only or "Get Xcode" for full Xcode.app
	```

1. Health check:

	```shell
	xcode-select -p # expect return: /Applications/Xcode.app/Contents/Developer
	gcc --version

	# check if git and "osxkeychain helper" are already installed
	git credential-osxkeychain # expect return: "usage:..."
	```

1. Click the nice **Fork** button in [this repo](https://github.com/Edditoria/dotfiles).
1. Clone **your own dotfiles repo** to your local machine in `~/dev/dotfiles`:

	```shell
	export my_git_username='edditoria' # replace your git username
	export dotfiles_dir="$HOME/dev/dotfiles"
	mkdir -p $dotfiles_dir
	git clone https://github.com/$my_git_username/dotfiles.git $dotfiles_dir
	cd $dotfiles_dir && git remote -v && ls
	```

1. Initial install dotfiles:

	```shell
	source setup_dotfiles.sh
	source ~/.bash_profile
	```

1. Initial config Git and GitLab:

	```shell
	source setup_git.sh
	```

	> *note:*
	> Something wrong when you add a SSH key to GitLab? Here is some information you need:
	> - Copy SSH key to clipboard: `pbcopy < ~/.ssh/id_rsa.pub`
	> - Paste the key to this URL: <https://gitlab.com/profile/keys>


## Install Homebrew and Brew Things

1. Install Homebrew:

	```shell
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor # may need to fix some problems
	brew update
	brew install rbenv
	```

1. Install homebrew formulae and cask apps:

	```shell
	cd $DOTFILES && source setup_homebrew.sh
	```

1. Check your brew leaves and cask apps:

	```shell
	brew leaves
	brew cask list
	```

1. Config Atom: in Atom main menu, "Install Shell Commands".
1. Config cask apps, especially Evernote.

## Javascript Dev Env

1. Install npm using nvm:

	```shell
	source ~/.bash_profile
	nvm --version # check
	cd $DOTFILES && source setup_nvm.sh
	```

1. Do some checking:

	```shell
	nvm ls # check
	node -v # check
	node $DOTFILES/test/test_node.js # open browser to see Hello World
	```

1. Install npm packages:

	```shell
	npm install -g coffeescript
	# also check out the npm_*.json files for package lists
	```

1. Install Meteor.js :

	```shell
	curl https://install.meteor.com/ | sh
	```

## Ruby Dev Env

1. Check current Ruby environment:

	```shell
	exec $SHELL -l # restart shell as a login shell
	rbenv -v
	which ruby-build # /Users/Edditoria/.rbenv/shims/gem
	```

1. Install Ruby versions:

	```shell
	cd $DOTFILES && source setup_rbenv.sh
	rails -v # better to check manually
	```

> *note:*
> In my experience, Rails installation failed every single time.
> Different error may occur in the different version of rails in different MacOS.
> Sorry that you may need to investigate the error by yourself.

> *extra note:*
> You still need to `be {command}` (alias of `bundle exec`) and `rbenv rehash` manually.

## Python Dev Env

1. Check the current Python environment:

	```shell
	exec $SHELL -l # restart shell as a login shell
	pyenv -v
	```

1. Install Python versions:

	```shell
	cd $DOTFILES && source setup_pyenv.sh
	```

## Other Things

- Add **Novel_customized** theme to Terminal.
	- Then set as default and re-open Terminal.
- Manually setup apm packages, npm packages, login items according to backup files.
- Manually install apps that are not in caskroom nor Apple AppStore:
	- PushBullet.app (fade out by official)
	- Tune Instructor.app v3.5 (v3.6 requires OSX El Capitan)
	- Chrome, Dropbox, Google Drive \#todo
	- Tuxera NTFS (bundled in Toshiba external hard drive)
- Manually config notification center.
- Check Accessibility in Security & Privacy.

# \#todo

- Merge my Evernote: Setup Dev Env 2014.
- Build checking system:
	- Check dotfiles directory.
	- Compare installed things, and monitor them.
	- Compare updated packages in npm, brew and etc. (using private log).
- A maintenance session in README to includes:
	- Backup npm and meteorjs
	- Update Accessibility in Security & Privacy.
	- Update Login Items in Users & Groups.
