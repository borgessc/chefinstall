#
# Cookbook Name:: icingamon
# Recipe:: dependencies
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.

# install packages for icinga2 / classicui2 / web2

case node['platform_family']
when 'debian'
  # package libjpeg62-dev conflicts with libgd2-xpm-dev
  # perhaps can be removed.
  os_packages = %w(g++ mailutils build-essential)
  include_recipe 'apt'
when 'rhel'
  os_packages = %w(gcc gcc-c++ glibc glibc-common mailx)
  # yum epel repository is required for php-pecl-imagick
  #include_recipe 'yum-epel'

end

# dependencies
os_packages.each do |p|
  package p
end

apt_package("software-properties-common") do
          package_name "software-properties-common"
          action [:install]
end

execute "sudo add-apt-repository  -y ppa:formorer/icinga"

apt_update 'all platforms' do
  #frequency 86400
  #action :periodic
  action :update
end
