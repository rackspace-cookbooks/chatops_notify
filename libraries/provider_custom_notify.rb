require 'chef/provider/lwrp_base'
require_relative 'helpers'

class Chef
  class Provider
    class CustomNotify < Chef::Provider::LWRPBase
      include Helpers::Http
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :notify do
        converge_by("Notify  #{new_resource.webhook} - #{new_resource}") do
          body = new_resource.body.to_json
          http_uri(body)
          req.body = new_resource.body.to_json
        end
      end
    end
  end
end
