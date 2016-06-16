#
# Cookbook Name:: icingamon
# Recipe:: default
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.
#

# Include main recipes for the project

include_recipe "apt"
include_recipe "icingamon::dependencies"
include_recipe "icingamon::server_install"
include_recipe "icingamon::plugin_package"
