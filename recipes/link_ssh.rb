ssh_dir = "#{node.dirs.homedir}/.ssh"
ssh_dbox_dir = "#{node.dirs.icloud_hold_dir}/ssh_config"

link ssh_dir do
  to ssh_dbox_dir
  owner node['sudo_user']
end

file "#{ssh_dir}/id_rsa" do
  mode '0600'
end
