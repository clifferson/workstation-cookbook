default['sudo_user']                   = ENV['SUDO_USER']

default['dirs']['homedir']             = "/Users/#{node['sudo_user']}"
default['dirs']['library']             = "#{node['dirs']['homedir']}/Library"

default['dirs']['icloud_dir']          = "#{node['dirs']['library']}/Mobile\ Documents/com~apple~CloudDocs"
default['dirs']['icloud_hold_dir']     = "#{node['dirs']['icloud_dir']}/Hold"
default['dirs']['icloud_app_data_dir'] = "#{node['dirs']['icloud_hold_dir']}/Hold/app_data"

default['dirs']['library_prefs']       = "#{node['dirs']['library']}/Preferences"
default['dirs']['library_app_support'] = "#{node['dirs']['library']}/Application\ Support"

# Remove this at some point
default['dirs']['dropbox_dir']            = "#{node['dirs']['homedir']}/Dropbox/Hold/app_data"

