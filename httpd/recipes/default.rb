#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe 'httpd::users'
include_recipe 'httpd::httpd'
