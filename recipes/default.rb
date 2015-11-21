#
# Cookbook Name:: workstation
# Recipe:: default

#include_recipe "workstation::alfred"
include_recipe "workstation::install_dotfiles"
include_recipe "workstation::install_dotvim"
include_recipe "workstation::link_ssh"
include_recipe "workstation::sizeup"
