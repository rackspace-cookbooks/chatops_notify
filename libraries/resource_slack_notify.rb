# encoding: UTF-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class SlackNotify < Chef::Resource::LWRPBase
      self.resource_name = :slack_notify
      actions :notify
      default_action :notify

      attribute :channel, kind_of: String, default: nil
      attribute :webhook, kind_of: String, default: nil
      attribute :username, kind_of: String, default: 'chef-client'
      attribute :message, kind_of: String, default: nil
      attribute :icon_emoji, kind_of: String, default: ':fork_and_knife:'
    end
  end
end
