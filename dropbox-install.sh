# A snippet to install drop box and then open it so you can login if its not already installed

# Install Dropbox first outa the loop because a lot of things live there
if ${BREW} cask list dropbox
then
  ${BREW} cask install dropbox
else
  ${BREW} cask install dropbox
  open ~/Applications/Dropbox.app
  read -p "Press [Enter] after you have logged into Dropbox"
fi 


