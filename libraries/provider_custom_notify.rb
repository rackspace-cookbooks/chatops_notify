require 'chef/provider/lwrp_base'
require 'net/http'

class Chef
  class Provider
    class CustomNotify < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :notify do
        converge_by("Notify  #{new_resource.webhook} - #{new_resource}") do
          uri = URI.parse(new_resource.webhook)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          initheader = { 'Content-Type' => 'application/json' }
          req = Net::HTTP::Post.new(uri, initheader)
          req.body = new_resource.body.to_json
          response = http.request(req)
          puts response
        end
      end
    end
  end
end
