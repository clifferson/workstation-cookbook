ssh_dir = "#{node.dirs.homedir}/.ssh"
ssh_dbox_dir = "#{node.dirs.homedir}/Dropbox/Hold/ssh_config"

link ssh_dir do
  to ssh_dbox_dir
  owner node['current_user']
end
