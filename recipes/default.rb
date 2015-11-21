#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe "workstation::alfred"
include_recipe "workstation::install_dotfiles"
include_recipe "workstation::install_dotvim"
include_recipe "workstation::link_ssh"
include_recipe "workstation::sizeup"
