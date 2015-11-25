alfred2_prefs_location_dir = "#{node['library_app_support']}/Alfred\ 2"
alfred2_app_data_dir = "#{node['dropbox_dir']}/Alfred\ 2"

link alfred2_prefs_location_dir do
  to alfred2_app_data_dir
end

#execute 'brew cask alfred link' do
  #command 'brew cask alfred link'
  #user node['sudo_user']
  #not_if { system("brew cask alfred status | grep 'happily linked' > /dev/null 2>&1") }
#d
