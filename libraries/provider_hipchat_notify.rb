require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class HipchatNotify < Chef::Provider::LWRPBase
      include Helpers::Http
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :notify do
        if new_resource.message.nil?
          text = "(chef) Chef Notification: #{node.chef_environment} - #{node.name}"
        else
          text = new_resource.message
        end
        converge_by("Notify Hipchat - #{new_resource}") do
          body = { color: new_resource.color, notify: new_resource.notify, message: "#{text}", message_format: new_resource.message_format }
          http_uri(body)
        end
      end
    end
  end
end
