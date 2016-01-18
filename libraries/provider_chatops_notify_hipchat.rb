require 'chef/provider/lwrp_base'
require_relative 'helpers'

class Chef
  class Provider
    class ChatopsNotifyHipchat < Chef::Provider::LWRPBase
      provides :chatops_notify
      include Helpers::Http
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :notify do
        text = if new_resource.message.nil?
                 "(chef) Chef Notification: #{node.chef_environment} - #{node.name}"
               else
                 new_resource.message
               end

        converge_by("Notify Hipchat - #{new_resource} ") do
          body = { color: new_resource.color, notify: new_resource.notify, message: text.to_s, message_format: new_resource.message_format } # ~FC002
          http_uri(body, new_resource.webhook)
        end
      end

      class << self
        # supports the given resource and action (late binding)
        def supports?(resource, _action)
          resource.chat_platform == :hipchat
        end
      end
    end
  end
end
