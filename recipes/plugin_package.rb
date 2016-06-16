#
# Cookbook Name:: icingamon
# Recipe:: plugin_package
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.


%w{ nagios-plugins nagios-plugins-basic nagios-plugins-standard }.each do |pkg|
   package pkg
end

package "nagios-nrpe-plugin" do
  # Required so we don't install nagios3 (and thus apache2+php5) - see http://packages.ubuntu.com/de/precise/nagios-nrpe-plugin
  options "--no-install-recommends"
  action :install
end
