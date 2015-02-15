#!/usr/bin/env bash

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

# Install Dropbox first outa the loop becuase a lot of things live there
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
 hipchat
 sizeup
 #fluid
 flux
 iterm2
 adium
 hipchat
 skype
 vlc
 java
 spotify
 league-of-legends
 steam
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


# Do the chef stuff

# Clone the workstation cookbook and berks the deps.
git clone https://github.com/clifferson/workstation-cookbook.git /tmp/workstation-cookbook && cd /tmp/workstation-cookbook && berks vendor cookbooks










### This is the end

## PLIST/Application Settings
#LIBRARY_PREFS="/Users/${USER}/Library/Preferences"
#PLIST_DROPBOX_DIR="/Users/${USER}/Dropbox/Hold/app_data/plists"
#LIBRARY_APPSUPPORT="/Users/${USER}/Library/Application Support"
#
## DrobBox Settings
#DROPBOX_DIR="/Users/${USER}/Dropbox"
#MISC_DROPBDIR="${DROPBOX_DIR}/Hold/app_data/misc"


## Install Plist files from dropbox
#plists=(
#  com.irradiatedsoftware.SizeUp.plist
#  #com.alfredapp.Alfred.plist
#)
#
#for plist in ${plists[@]}; do
#  if [[ -f ${LIBRARY_PREFS}/${plist} ]] && [[ ! -L ${LIBRARY_PREFS}/${plist} ]]
#  then
#    rm ${LIBRARY_PREFS}/${plist} && echo "Deleted ${LIBRARY_PREFS}/${plist} non linked version"
#  fi
#  ln -s ${PLIST_DROPBOX_DIR}/${plist} ${LIBRARY_PREFS}/${plist} && echo "linked ${LIBRARY_PREFS}/${plist}"
#  # May need to chown this to $USER?
#done
###
#
### Install the SizeUp licence. 
#mkdir -p "${LIBRARY_APPSUPPORT}/SizeUp"
#
#ln -s "${MISC_DROPBDIR}/SizeUp.sizeuplicense" "${LIBRARY_APPSUPPORT}/SizeUp/SizeUp.sizeuplicense"
###
#
### Install Alfred 2 prefs
##ALFRED2_PREFS_LOCATION_DIR="${LIBRARY_APPSUPPORT}/Alfred\ 2"
##ALFRED2_APP_DATA_DIR="/Users/${USER}/Dropbox/Hold/app_data/Alfred\ 2"
#
##mkdir -p "${ALFRED2_PREFS_LOCATION_DIR}"
#
##ln -s "${ALFRED2_APP_DATA_DIR}" "${ALFRED2_PREFS_LOCATION_DIR}"
###
#
#### link dotssh
#SSH_DIR="/Users/$USER/.ssh"
#SSH_DROPBOX_DIR="${DROPBOX_DIR}/Hold/ssh_config/"
#
#[[ ! -d ${SSH_DIR} ]] && ln -s "${SSH_DROPBOX_DIR}" "${SSH_DIR}"
####
#
### Install dotfile
# curl -L https://raw.github.com/clifferson/dotfiles/master/install.sh | sh
## This script ^ needs some work
#
### Install vim
#curl -L https://raw.github.com/clifferson/dotvim/master/install.sh | sh
#
### Link dotchef
#[[ -d ln -s "${DROPBOX_DIR}/Hold/dotchef" "~/.chef"

### TODO Can I enable accessiblity automatically?
### TODO Get the alfred prefs into this thing.
### TODO 1passwd
### Tmuxinator?
### chsh -s /bin/zsh # make zsh default shell
