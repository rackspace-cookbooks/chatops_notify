require 'chef/provider/lwrp_base'
require 'net/http'

class Chef
  class Provider
    class HipchatNotify < Chef::Provider::LWRPBase
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
          uri = URI.parse(new_resource.webhook)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          initheader = { 'Content-Type' => 'application/json' }
          req = Net::HTTP::Post.new(uri, initheader)
          req.body = { color: new_resource.color, notify: new_resource.notify, message: "#{text}", message_format: new_resource.message_format }.to_json
          response = http.request(req)
          puts response
        end
      end
    end
  end
end
