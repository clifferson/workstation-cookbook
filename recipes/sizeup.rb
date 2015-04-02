library_prefs = node.dirs.library_prefs
library_app_support = node.dirs.library_app_support

sizeup_dropbox_dir = "#{node.dirs.dropbox_dir}/SizeUp"


# Install the SizeUp prefs plist
sizeup_plist = "com.irradiatedsoftware.SizeUp.plist"

link "#{library_prefs}/#{sizeup_plist}" do
  to "#{sizeup_dropbox_dir}/#{sizeup_plist}"
end


# Install the SizeUp licence
directory "#{library_app_support}/SizeUp" do
  owner node['current_user']
end

link "#{library_app_support}/SizeUp/SizeUp.sizeuplicense" do
  to "#{sizeup_dropbox_dir}/SizeUp.sizeuplicense"
  owner node['current_user']
end
