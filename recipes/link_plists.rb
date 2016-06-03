%w(
  com.your.thing.here
  ).each do |plist|

  link "#{node.dirs.library_prefs}/#{plist}" do
    to "#{node.dirs.icloud_dir}/plists/#{plist}"
    owner node['sudo_user']
  end

end
