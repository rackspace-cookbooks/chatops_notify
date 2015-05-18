require 'chef/provider/lwrp_base'
require_relative 'chatops'

class Chef
  class Provider
    class SlackNotify < Chef::Provider::LWRPBase
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

        converge_by("Notify Slack - #{new_resource}") do
          body = { channel: "##{new_resource.channel}", username: new_resource.username, text: "#{text}", icon_emoji: new_resource.icon_emoji }
          http_uri(body)
        end
      end
    end
  end
end
