#
# Cookbook Name:: icingamon
# Recipe:: server_install
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.


#Instaling Icinga Server
apt_package("icinga2") do
          package_name "icinga2"
          action [:install]
end

service 'icinga2' do
  action [:start , :enable]
end
