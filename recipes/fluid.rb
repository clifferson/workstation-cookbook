fluid_download_uri = "http://fluidapp.com/dist/Fluid_1.7.2.zip"

remote_file "#{Chef::Config[:file_cache_path]}/Fluid.zip" do
  source fluid_download_uri
  mode "0644"
  not_if { File.exists?("/Applications/Fluid.app") }
end

execute "unzip fluid" do
  command "unzip -q #{Chef::Config[:file_cache_path]}/Fluid.zip Fluid.app/* -d /Applications/"
  user node['current_user']
  group "admin"
  not_if { File.exists?("/Applications/Fluid.app") }
end
