dotfiles_dir = "#{node.dirs.homedir}/.files"

git dotfiles_dir do
  repository "https://github.com/clifferson/dotfiles.git"
  revision "master"
  notifies :run, "execute[symlink_dotfiles]"
  user node['sudo_user']
end

execute "symlink_dotfiles" do
  command "#{dotfiles_dir}/symlink_dotfiles.sh"
  user node['sudo_user']
  action :nothing
end
