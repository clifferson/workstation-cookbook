%w(
  com.hipchat.HipChat.plist
  ).each do |plist|

  link "#{node.dirs.library_prefs}/#{plist}" do
    to "#{node.dirs.dropbox_dir}/plists/#{plist}"
    owner node['sudo_user']
  end

end
