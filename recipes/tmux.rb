# Copy of pivotal_workstation::tmux minus installing there custom tmux.conf
include_recipe "pivotal_workstation::homebrew"
include_recipe "pivotal_workstation::git"
brew_install "tmux"
