#execute "install_dotfiles" do
#  command "curl -L https://raw.github.com/clifferson/dotfiles/master/install.sh | sh"
#  creates "~/.files"
#  action :run
#end

git "/Users/#{node['current_user']}/.files" do
  repository "https://github.com/clifferson/dotfiles.git"
  notifies :run, "execute[symlink_dotfiles]"
end

execute "symlink_dotfiles" do
  command "/Users/#{node['curent_user']}/.files/symlink_dotfiles.sh"
  action :nothing
end
