# edditoria does dotfiles

A "dotfiles" approach can help you set up a new machine much faster and more importantly keep a consistent system environment. So I join this big dotfiles family! \:3

- What is *xxx does dotfiles*? Please read [Getting Started With Dotfiles][get-start]
- The dotfiles community is so big. Github keeps a good list: <http://dotfiles.github.io/>

[get-start]: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789 "Getting Started With Dotfiles"

> Caution:
> - This repo is in dirty scratch status. There must be something wrong and a lot of bugs.
> - I only update piece by piece, and the scripts are un-tested yet.
> - The scripts may screw up your system environment. Do it at your own risk\~\~
> - Please raise out issue and/or give me a ~~hi five~~ pull request.

# My Setup

- Current OS: OSX 10.10.5
- dotfiles dir: `~/dev/dotfiles` *(and not `.dotfiles`)*
- I keep my Cask app symlinks in Cask's suggested directory.
  - i.e. `~/Applications/` not `/Applications/`

# Useful Command

- `tt` to print my stupid note for some Terminal commands.
- `source update.sh` to update brew, cask apps and gems.
- `source backup.sh` to backup a list to brew_leaves.txt, brew_cask_list.txt and app_list.txt


---

# Install for New Machine

## Prepare Before Dotfile

1. Install XQuartz <http://xquartz.macosforge.org/landing/>
1. Install Xcode from MacStore <https://itunes.apple.com/hk/app/xcode/id497799835>
1. ~~Install Xcode Command Line Tools in Xcode app.~~
1. check if Xcode is installed:

  ```
  xcode-select -p # expect return: /Applications/Xcode.app/Contents/Developer
  ```

1. check if Xcode Command Line Tool is installed: (It should be pre-installed by Xcode)

  ```
  gcc --version
  ```

1. config Git: \**remember to change your info*

  ```
  cd ~
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  git config --list
  ```

1. config GitLab: \#todo use HTTPS instead of SSH
  - Generate SSH Key: \**remember to change your info*

  ```
  ssh-keygen -t rsa -C "your@email.com" # pwd = s
  cat ~/.ssh/id_rsa.pub # Show SSH key
  pbcopy < ~/.ssh/id_rsa.pub # Copy SSH key to clipboard
  ```

  - then, paste to Gitlab. <https://gitlab.com/profile/keys>
  - You can commit to GitLab now. (pwd = s)
1. clone this repo to `~/dev/dotfiles`.

  ```
  mkdir ~/dev && cd ~/dev
  git clone https://github.com/Edditoria/dotfiles.git dotfiles
  cd dotfiles && git remote -v
  ```

1. initial install Dotfiles:

  ```
  cd ~/dev/dotfiles && source install_bashrc_profile.sh && cd ~
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
1. config cask apps, especially Github Desktop, Evernote.

## Javascript Dev Env

1. install npm using nvm:

  ```
  cd ~ && source .bash_profile
  nvm --version # check
  nvm install stable
  ```

1. do some checking:

  ```
  nvm ls # check
  nvm alias default node # just update to use the latest build
  node -v # check
  node ~/dev/dotfiles/test/test_node.js # open browser to see Hello World
  ```

1. install npm packages:

  ```
  npm install -g coffee-script
  ```

1. install Meteor.js :

  ```
  curl https://install.meteor.com/ | sh
  ```

## Other Things

- add **Novel_customized** theme to Terminal
  - then set as default and re-open Terminal
- check Accessibility in Security & Privacy

# \#todo

- merge my Evernote: Setup Dev Env 2014
- build checking system:
  - check dotfile directory
  - compare installed things, and monitor them
- a Maintenance session to includes:
  - backup npm and meteorjs
  - update Accessibility in Security & Privacy
  - update Login Items in Users & Groups
