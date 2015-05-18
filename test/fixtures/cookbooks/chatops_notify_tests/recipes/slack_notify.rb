# Encoding: utf-8
#
# Cookbook Name:: chatops_notify_tests
# Recipe:: slack_notify
#
# Copyright 2012-2015, Rackspace

chatops_notify 'deployed Test' do
  chat_platform :slack
  channel node['channel']
  username 'Chef'
  webhook node['webhook']
  message 'kitchen test'
end
