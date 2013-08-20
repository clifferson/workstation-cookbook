include_recipe "homebrew::cask"
homebrew_cask "alfred"

alfred2_prefs_location_dir = "/Users/#{node['current_user']}/Library/Application\ Support/Alfred\ 2"
alfred2_app_data_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/Alfred\ 2"

link alfred2_prefs_location_dir do
  to alfred2_app_data_dir
end
