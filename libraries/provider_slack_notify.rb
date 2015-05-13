require 'chef/provider/lwrp_base'
require 'net/http'

class Chef
  class Provider
    class SlackNotify < Chef::Provider::LWRPBase
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

        uri = URI.parse(new_resource.webhook)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        initheader = { 'Content-Type' => 'application/json' }
        req = Net::HTTP::Post.new(uri.path, initheader)
        req.body = { channel: "##{new_resource.channel}", username: new_resource.username, text: "#{text}", icon_emoji: new_resource.icon_emoji }.to_json
        response = http.request(req)
        puts response
      end
    end
  end
end
