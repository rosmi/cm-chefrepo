#
# Cookbook Name:: configfileupdator
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
hostnames = data_bag("wp-hostnames")
hostnames.each do |hostname|
opts = data_bag_item("wp-hostnames", hostname)

template '/var/www/html' + '/wp-config.php' do
source 'wp-config.php.erb'
 mode 0755
 owner 'root'
group 'root'
variables({
:db_host => opts["db_host"]})
end
end