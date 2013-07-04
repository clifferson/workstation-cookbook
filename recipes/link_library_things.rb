include_recipe "sprout-osx-apps::dropbox"

library_prefs = "/Users/#{node['current_user']}/Library/Preferences"
plist_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/plists"

%w(com.irradiatedsoftware.SizeUp.plist).each do |plist|

  link "#{library_prefs}/#{plist}" do
    to "#{plist_dbox_dir}/#{plist}"
    owner node['current_user']
  end

end
