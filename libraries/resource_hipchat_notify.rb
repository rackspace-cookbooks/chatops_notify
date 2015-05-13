# encoding: UTF-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class HipchatNotify < Chef::Resource::LWRPBase
      self.resource_name = :hipchat_notify
      actions :notify
      default_action :notify

      attribute :color, kind_of: String, default: 'green'
      attribute :webhook, kind_of: String, default: nil
      attribute :notify, kind_of: [TrueClass, FalseClass], default: false
      attribute :message, kind_of: String, default: nil
      attribute :message_format, kind_of: String, default: 'text'
    end
  end
end
