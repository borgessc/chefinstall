#
# Cookbook Name:: icingamon
# Recipe:: mysql-install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


apt_package "mysql server" do
  package_name ['mysql-server' , 'mysql-client']
  action [:install]
end

service "mysql" do
  action [:start , :enable]
do
