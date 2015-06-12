#
# Cookbook Name:: bower
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

Chef::Log.info('Running bower::default')
include_recipe 'git'
include_recipe 'nodejs::npm'
nodejs_npm 'bower'