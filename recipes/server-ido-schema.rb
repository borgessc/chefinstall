#
# Cookbook Name:: icingamon
# Recipe:: server-ido-schema
#
# Copyright (c) 2016 Sergio Borges, All Rights Reserved.


#load ido schema
execute 'schema_load_ido_mysql' do
 command "\
 mysql -h #{node['icinga2']['ido']['db_host']} \
 -u#{node['icinga2']['ido']['db_user']} \
 -p#{node['icinga2']['ido']['db_password']} \
 #{node['icinga2']['ido']['db_name']} < /usr/share/icinga2-ido-#{node['icinga2']['ido']['type']}/schema/#{node['icinga2']['ido']['type']}.sql \
 && touch /etc/icinga2/schema_loaded_ido_mysql"
 creates '/etc/icinga2//schema_loaded_ido_mysql'
 environment 'MYSQL_HOME' => node['icinga2']['ido']['mysql_home']
 only_if { node['icinga2']['ido']['load_schema'] && node['icinga2']['ido']['type'] == 'mysql' }
end
