# encoding: UTF-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class ChatopsNotify < Chef::Resource::LWRPBase
      self.resource_name = :chatops_notify
      actions :notify
      default_action :notify

      # Common attributes
      attribute :chat_platform, kind_of: Symbol, equal_to: [:slack, :hipchat, :custom], default: nil
      attribute :webhook, kind_of: String, default: nil
      attribute :message, kind_of: String, default: nil

      # Slack attributes
      attribute :channel, kind_of: String, default: nil
      attribute :username, kind_of: String, default: 'chef-client'
      attribute :icon_emoji, kind_of: String, default: ':fork_and_knife:'

      # Hipchat attributes
      attribute :color, kind_of: String, default: 'green'
      attribute :notify, kind_of: [TrueClass, FalseClass], default: false
      attribute :message_format, kind_of: String, default: 'text'
    end
  end
end
