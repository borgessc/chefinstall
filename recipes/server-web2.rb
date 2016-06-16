#
# Cookbook Name:: icingamon
# Recipe:: server-web2
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.

# install packages for icinga2 / classicui2 / web2

case node['platform_family']
when 'debian'
  # package libjpeg62-dev conflicts with libgd2-xpm-dev
  # perhaps can be removed.
  os_packages = %w(g++ mailutils php5 php5-cli php5-fpm build-essential
                   libgd2-xpm-dev libjpeg62 libpng12-0
                   libpng12-dev libapache2-mod-php5 git-core imagemagick
                   php5-imagick php-pear php5-xmlrpc php5-xsl php5-mysql
                   php-soap php5-gd php5-ldap php5-pgsql php5-intl)

when 'rhel'
  os_packages = %w(gcc gcc-c++ glibc glibc-common mailx php php-devel gd
                   gd-devel libjpeg libjpeg-devel libpng libpng-devel php-gd
                   php-fpm php-cli php-pear php-xmlrpc php-xsl php-pdo
                   php-soap php-ldap php-mysql php-pgsql php-intl git php-pecl-imagick)
  # yum epel repository is required for php-pecl-imagick
  #include_recipe 'yum-epel'
end

# dependencies
os_packages.each do |p|
  package p
end
