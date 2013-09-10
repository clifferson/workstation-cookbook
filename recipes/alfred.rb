include_recipe "homebrew::cask"
homebrew_cask "alfred"

alfred2_prefs_location_dir = "/Users/#{node['current_user']}/Library/Application\ Support/Alfred\ 2"
alfred2_app_data_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/Alfred\ 2"

link alfred2_prefs_location_dir do
  to alfred2_app_data_dir
end

execute 'brew cask alfred link' do
  command 'brew cask alfred link'
  user node['current_user']
  not_if { system("brew cask alfred status | grep 'happily linked' > /dev/null 2>&1") }
end
