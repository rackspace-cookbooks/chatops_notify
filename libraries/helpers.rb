module Helpers
  module Http
    require 'net/http'
    # include Chef::DSL::IncludeRecipe
    def http_uri(body, webhook)
      uri = URI.parse(webhook)
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 10
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      initheader = { 'Content-Type' => 'application/json' }
      req = Net::HTTP::Post.new(uri, initheader)
      req.body = body.to_json
      response = http.request(req)
      # Log response for integration tests
      File.write('/var/log/chatops_notify', "HTTP Response: #{response.code}")
      puts response.code
      response.code
    rescue Timeout::Error
      # Connection failed
      return 'not available - connection timed out'
    end
  end
end
