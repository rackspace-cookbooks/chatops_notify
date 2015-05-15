require 'chef/provider/lwrp_base'
require_relative 'helpers'

class Chef
  class Provider
    class ChatopsNotifySlack < Chef::Provider::LWRPBase
      provides :chatops_notify
      include Helpers::Http
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :notify do
        if new_resource.message.nil?
          text = "*Chef notification*: #{node.chef_environment} - #{node.name}"
        else
          text = new_resource.message
        end

        converge_by("Notify Slack - #{new_resource} ") do
          body = { channel: "##{new_resource.channel}", username: new_resource.username, text: "#{text}", icon_emoji: new_resource.icon_emoji } # ~FC002
          http_uri(body, new_resource.webhook)
        end
      end

      class << self
        # supports the given resource and action (late binding)
        def supports?(resource, _action)
          resource.chat_platform == :slack
        end
      end
    end
  end
end
