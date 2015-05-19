# Encoding: utf-8
#
# Cookbook Name:: chatops_notify_tests
# Recipe:: custom_notify
#
# Copyright 2012-2015, Rackspace

chatops_notify 'deployed Test' do
  chat_platform :custom
  webhook node['webhook']
  body ''
end
