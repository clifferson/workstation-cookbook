git "/Users/#{node['current_user']}/.vim" do
  repository "https://github.com/clifferson/dotvim.git"
  revision "master"
  user node['current_user']
end

link "/Users/#{node['current_user']}/.vimrc" do
  to "/Users/#{node['current_user']}/.vim/vimrc"
  owner node['current_user']
end

execute "update_git_submodules" do
  command "git submodule update --init"
  cwd "/Users/#{node['current_user']}/.vim"
end
