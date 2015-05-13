# encoding: UTF-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CustomNotify < Chef::Resource::LWRPBase
      self.resource_name = :custom_notify
      actions :notify
      default_action :notify

      attribute :webhook, kind_of: String, default: nil
      attribute :body, kind_of: String, default: nil
    end
  end
end
