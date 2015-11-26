git "#{node.dirs.homedir}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  user node.sudo_user
  #not_if "test -d /home/#{user_id}/.oh-my-zsh"
end
