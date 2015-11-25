default['sudo_user']                      = ENV['SUDO_USER']
default['dirs']['homedir']                = "/Users/#{node['sudo_user']}"
default['dirs']['dropbox_dir']            = "#{node['dirs']['homedir']}/Dropbox/Hold/app_data"
default['dirs']['library']                = "#{node['dirs']['homedir']}/Library"
default['dirs']['library_prefs']          = "#{node['dirs']['library']}/Preferences"
default['dirs']['library_app_support']    = "#{node['dirs']['library']}/Application\ Support"
