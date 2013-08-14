include_recipe "sprout-osx-apps::dropbox"

library_prefs = "/Users/#{node['current_user']}/Library/Preferences"
plist_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/plists"

%w(
  com.irradiatedsoftware.SizeUp.plist
  com.alfredapp.Alfred.plist
  ).each do |plist|

  link "#{library_prefs}/#{plist}" do
    to "#{plist_dbox_dir}/#{plist}"
    owner node['current_user']
  end

end

library_app_support = "/Users/#{node['current_user']}/Library/Application Support"
misc_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/app_data/misc"

# install the SizeUup licence. 
#include_recipe "sprout-osx-apps::sizeup"

directory "#{library_app_support}/SizeUp" do
  owner node['current_user']
end

link "#{library_app_support}/SizeUp/SizeUp.sizeuplicense" do
  to "#{misc_dbox_dir}/SizeUp.sizeuplicense"
  owner node['current_user']
end

# install the Alfred licence.
#include_recipe "sprout-osx-apps::alfred"

directory "#{library_app_support}/Alfred" do
  owner node['current_user']
end

link "#{library_app_support}/Alfred/license.plist" do
  to "#{misc_dbox_dir}/Alfred.license.plist"
  owner node['current_user']
end
