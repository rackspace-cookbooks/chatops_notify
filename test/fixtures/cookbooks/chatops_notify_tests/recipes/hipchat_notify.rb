# Encoding: utf-8
#
# Cookbook Name:: chatops_notify_tests
# Recipe:: hipchat_notify
#
# Copyright 2012-2015, Rackspace

chatops_notify 'deployed Test' do
  chat_platform :hipchat
  webhook node['webhook']
  message 'kitchen test'
end
