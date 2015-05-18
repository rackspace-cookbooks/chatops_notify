module Helpers

    module Http
      require 'net/http'
      include Chef::DSL::IncludeRecipe
      def http_uri(body)
        uri = URI.parse(new_resource.webhook)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        initheader = { 'Content-Type' => 'application/json' }
        req = Net::HTTP::Post.new(uri, initheader)
        req.body = body.to_json
        response = http.request(req)
        puts response
      end

  end
end
