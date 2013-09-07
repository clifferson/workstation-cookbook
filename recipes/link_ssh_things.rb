include_recipe "sprout-osx-apps::dropbox"

ssh_dir = "/Users/#{node['current_user']}/.ssh"
ssh_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/ssh_config"


directory ssh_dir do
  owner node['current_uesr']
  mode 0700
end

%w(
  config
  id_rsa
  id_rsa.pub
  ).each do |ssh_file|
  link "#{ssh_dir}/#{ssh_file}" do
    to "#{ssh_dbox_dir}/#{ssh_file}"
    owner node['current_user']
    mode 0600
  end
end
