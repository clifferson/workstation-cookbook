library_prefs = node.dirs.library_prefs
library_app_support = node.dirs.library_app_support

sizeup_icloud_dir = "#{node.dirs.icloud_app_data_dir}/SizeUp"


# Install the SizeUp prefs plist
sizeup_plist = "com.irradiatedsoftware.SizeUp.plist"

link "#{library_prefs}/#{sizeup_plist}" do
  to "#{sizeup_icloud_dir}/#{sizeup_plist}"
end


# Install the SizeUp licence
directory "#{library_app_support}/SizeUp" do
  owner node['sudo_user']
end

link "#{library_app_support}/SizeUp/SizeUp.sizeuplicense" do
  to "#{sizeup_icloud_dir}/SizeUp.sizeuplicense"
  owner node['sudo_user']
end

# Enable 'accessability compuer control' for SizeUp

# Progmatically access the plist namespace of an application
# /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/<Appname.app>/Contents/Info.plist

accessability_sqlite_db = "/Library/Application\\ Support/com.apple.TCC/TCC.db"

execute "SizeUp accessability" do
  user 'root'
  command "sqlite3 #{accessability_sqlite_db} \"INSERT or REPLACE INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.SizeUp',0,1,1,NULL,NULL);\""
end

# TODOS
# automatically start at login aka "login item"
