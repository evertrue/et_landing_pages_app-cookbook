#
# Cookbook Name:: et_landingpages_app
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("Chef Environment: #{node.chef_environment}")

data_source = data_bag_item('endpoints', 'rds')[node.chef_environment][node['et_rails_app']['db']['source_name']]

node.set['et_rails_app']['db']['schema_name'] = data_source['schema_name']
node.set['et_rails_app']['db']['host'] = data_source['host']

include_recipe 'et_rails_app'
