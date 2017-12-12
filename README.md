# edditoria does dotfiles

A "dotfiles" approach can help you set up a new machine much faster and more importantly keep a consistent system environment. So I join this big dotfiles family! \:3

- What is *xxx does dotfiles*? Please read [Getting Started With Dotfiles][get-start]
- The dotfiles community is so big. Github keeps a good list: <http://dotfiles.github.io/>

[get-start]: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789 "Getting Started With Dotfiles"

> Caution:
> - This repo is in dirty scratch status. There must be something wrong and a lot of bugs.
> - I only update piece by piece, and some scripts are not tested yet.
> - The scripts may screw up your system environment. Use them at your own risk\~\~
> - Please raise out issue and/or give me a ~~hi five~~ pull request.

# My Setup

- Current OS: OSX 10.10.5
- dotfiles dir: `~/dev/dotfiles` *(not `.dotfiles`)*
- app/package managers:
  - Mac AppStore for apps
  - `brew cask` for more apps
  - `brew` for cli tools
  - `nvm` to manage `npm` to manage `node`
  - `rbenv` & `bundler` to manage `ruby`
  - `pyenv` & `pip` to manage `python`
- I keep my Cask apps in customized directory: `/Applications/Cask` (option is saved in `.bash_profile`)
- My `nvm alias default` is `carbon` (neither `stable` nor `lts/carbon`)
- I keep `rdoc` and `ri` for `gem install`, but not keep for `gem update`

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

1. Install XQuartz <http://xquartz.macosforge.org/landing/>
1. Install Xcode from MacStore <https://itunes.apple.com/hk/app/xcode/id497799835>
1. Install Xcode Command Line Tools in Xcode.app's preference.
1. Check if Xcode and Xcode CLT is installed:

  ```
  xcode-select -p # expect return: /Applications/Xcode.app/Contents/Developer
  gcc --version
  ```

1. Check if git and `osxkeychain helper` are already installed:

  ```
  git credential-osxkeychain # expect return: "usage:..."
  ```

1. Press the nice **Fork** button in [this repo](https://github.com/Edditoria/dotfiles)
1. Clone to your local machine in `~/dev/dotfiles`.

  ```
  mkdir ~/dev && cd ~/dev
  git clone https://github.com/{your.username}/dotfiles.git
  cd dotfiles && git remote -v
  ```

1. Initial config Git and GitLab:

  ```
  source init_git.sh
  ```

  > *note:*
  > If something wrong when you add a SSH key to GitLab, here is the information you need:
  > - Copy SSH key to clipboard: `pbcopy < ~/.ssh/id_rsa.pub`
  > - Paste the key to this URL: <https://gitlab.com/profile/keys>

1. Initial install Dotfiles:

  ```
  cd ~/dev/dotfiles && source install_home_dotfiles.sh
  cd ~ && source ~/.bash_profile
  ```

## Install Homebrew and Brew Things

1. install Homebrew:

  ```
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor # may need to fix some problems
  brew update
  ```

1. install homebrew formulae and cask apps:

  ```
  cd ~/dev/dotfiles && source install_brew_cask_formulae.sh
  ```

1. check your brew leaves and cask apps:

  ```
  brew leaves
  brew cask list
  ```

1. config Atom: in Atom main menu, "Install Shell Commands".
1. config cask apps, especially Evernote.

## Javascript Dev Env

1. install npm using nvm:

  ```
  cd ~ && source .bash_profile
  nvm --version # check
  cd ~/dev/dotfiles && source install_npm.sh
  ```

1. do some checking:

  ```
  nvm ls # check
  node -v # check
  node ~/dev/dotfiles/test/test_node.js # open browser to see Hello World
  ```

1. install npm packages:

  ```
  npm install -g coffeescript
  ```

1. install Meteor.js :

  ```
  curl https://install.meteor.com/ | sh
  ```

## Ruby Dev Env

1. check current Ruby environment:

  ```
  exec $SHELL -l # restart shell as a login shell
  rbenv -v
  which ruby-build # /Users/Edditoria/.rbenv/shims/gem
  ```

1. install rbenv and Ruby:

  ```
  cd ~/dev/dotfiles && source install_rbenv.sh
  rails -v # better to check manually
  ```

> *note:*
> In my experience, Rails installation failed **every single time**.
> Different error may occur in the different version of rails in different MacOS.
> Sorry that you may need to investigate the error by yourself.

> *extra note:*
> You still need to `be {command}` (alias of `bundle exec`) and `rbenv rehash`

## Python Dev Env

1. check the current Python environment:

  ```
  exec $SHELL -l # restart shell as a login shell
  pyenv -v
  ```

1. install pyenv and Python:

  ```
  cd ~/dev/dotfiles && source install_pyenv.sh
  ```

## Other Things

- add **Novel_customized** theme to Terminal
  - then set as default and re-open Terminal
- manually install apps that are not in caskroom nor Apple AppStore:
  - PushBullet.app (fade out by official)
  - Tune Instructor.app v3.5 (v3.6 requires OSX El Capitan)
  - Chrome, Dropbox, Google Drive \#todo
  - Tuxera NTFS (bundled in Toshiba external hard drive)
- manually config notification center
- check Accessibility in Security & Privacy

# \#todo

- merge my Evernote: Setup Dev Env 2014
- build checking system:
  - check dotfiles directory
  - compare installed things, and monitor them
  - compare updated packages in npm, brew and etc. (using private log)
- a Maintenance session to includes:
  - backup npm and meteorjs
  - update Accessibility in Security & Privacy
  - update Login Items in Users & Groups
