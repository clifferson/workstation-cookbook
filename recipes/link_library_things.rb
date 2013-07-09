include_recipe "sprout-osx-apps::dropbox"

library_prefs = "/Users/#{node['current_user']}/Library/Preferences"
plist_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/plists"

%w(com.irradiatedsoftware.SizeUp.plist).each do |plist|

  link "#{library_prefs}/#{plist}" do
    to "#{plist_dbox_dir}/#{plist}"
    owner node['current_user']
  end

end

library_app_support = "/Users/#{node['current_user']}/Library/Application Support"
misc_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/misc"

# install the sizeup licence. 
include_recipe "pivotal_workstation::sizeup"

directory "#{library_app_support}/SizeUp" do
  owner node['current_user']
end

link "#{library_app_support}/SizeUp/SizeUp.sizeuplicense" do
  to "#{misc_dbox_dir}/SizeUp.sizeuplicense"
  owner node['current_user']
end
