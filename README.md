# edditoria does dotfiles

\[\!\] Alert: I am a noob. This Dotfiles repo is in dirty scratch status. There are something wrong, especially the docs. If you have any comment, please raise out an issue. Many thanks.

\[\!\] Note:
- My current OS: OSX 10.10.5
- dotfiles dir: ~/dev/dotfiles

# Useful Command

- `tt`: print my note "my_command.txt

# Maintenance for Existing Machine \#todo

Before you push dotfiles to Github

```
cd ~/dev/dotfiles
source backup_brew.sh # store a brew_leaves.txt
```

---

# Install for New Machine

## Prepare Before Dotfile

1. Install XQuartz <http://xquartz.macosforge.org/landing/>
1. Install Xcode from MacStore <https://itunes.apple.com/hk/app/xcode/id497799835>
1. ~~Install Xcode Command Line Tools in Xcode app~~
1. check if Xcode is installed
```
xcode-select -p # expect return: /Applications/Xcode.app/Contents/Developer
```
1. check if Xcode Command Line Tool is installed (I have it installed with original Xcode from App Store)
```
gcc --version
```
1. config Git
```
cd ~
git config --global user.name "Edditoria"
git config --global user.email "edditoria@gmail.com"
git config --list
```
1. clone this repo to `~/dev/dotfiles` \#todo
```
cd ~ && mkdir dev && cd dev
git clone [link to repo here]
```
1. config GitLab \#todo use HTTPS instead of SSH
	- Generate SSH Key
	```
	ssh-keygen -t rsa -C "edditoria@gmail.com" # pwd = s
	cat ~/.ssh/id_rsa.pub # Show SSH key
	pbcopy < ~/.ssh/id_rsa.pub # Copy SSH key to clipboard
	```
	- then, paste to Gitlab <https://gitlab.com/profile/keys>
	- You can commit to GitLab now (pwd = s)
1. Initial install Dotfiles
```
cd ~/dev/dotfiles && source install.sh
cd ~
```

## Install Homebrew and Brew Things

- install Homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor # may need to fix some problems
brew update
```
- install homebrew formulae and cask apps
```
cd ~/dev/dotfiles && source install_homebrew.sh
cd ~
```
- config Atom: in Atom main menu, "Install Shell Commands"
- config Github Desktop

## Other Things

in Terminal

- copy Novel and create a profile "customized"
- text settings: DejaVu Sans Mono 14 pt. "book", line spacing "1.03"
- window size: 90 x 24

# \#todo

- merge my Evernote: Setup Dev Env 2014
- build checking system:
	- check dotfile directory
	- compare installed things, and monitor them
