#!/usr/bin/env bash

echo "I can has root?"
sudo true

BREW=/usr/local/bin/brew

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "updating homebrew..."
${BREW} update

# Install GNU core utilities (those that come with OS X are outdated)
${BREW} install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
${BREW} install findutils

# Install Bash 4
#${BREW} install bash

# Install more recent versions of some OS X tools
${BREW} tap homebrew/dupes
${BREW} install homebrew/dupes/grep

# Brew install some shell stuff
binaries=(
  git
  zsh
  zsh-completions
  tmux
  icdiff
  ack
  autojump
  go
)

echo "installing shell stuff..."
${BREW} install ${binaries[@]}

echo "cleaning up brew..."
${BREW} cleanup

echo "installing cask..."
${BREW} install caskroom/cask/brew-cask

# Install Dropbox first outa the loop because a lot of things live there
if ${BREW} cask list dropbox
then
  ${BREW} cask install dropbox
else
  ${BREW} cask install dropbox
  open ~/Applications/Dropbox.app
  read -p "Press [Enter] after you have logged into Dropbox"
fi 

# Brew cask install some apps
apps=(
 alfred
 chefdk
 google-chrome
 1password
 sizeup
 #fluid
 flux
 iterm2
 adium
 hipchat
 #skype
 vlc
 java
 spotify
 #league-of-legends
 #steam
 qq
 vagrant
 virtualbox
)

echo "installing apps..."
${BREW} cask install ${apps[@]}

#echo "linking casks..."
# HAve to do some kind of fix for this.
#brew cask alfred link
##

# Clone the workstation cookbook and run chef-solo
git clone https://github.com/clifferson/workstation-cookbook.git /tmp/workstation && chef-solo -c /tmp/workstation/solo.rb -o workstation

### This is the end

### TODO Can I enable accessiblity automatically?
### TODO Get the alfred prefs into this thing.
### TODO 1passwd
### Tmuxinator?
### chsh -s /bin/zsh # make zsh default shell
