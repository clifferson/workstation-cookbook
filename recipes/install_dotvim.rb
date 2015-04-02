homedir = node.dirs.homedir

git "#{homedir}/.vim" do
  repository "https://github.com/clifferson/dotvim.git"
  revision "master"
  user node['current_user']
end

link "#{homedir}/.vimrc" do
  to "#{homedir}/.vim/vimrc"
  owner node['current_user']
end

execute "update_git_submodules" do
  command "git submodule update --init"
  cwd "#{homedir}/.vim"
  user node['current_user']
end
