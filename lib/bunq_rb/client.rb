require "addressable/uri"
require "securerandom"
require "faraday"
require "faraday_middleware"

require_relative "client/sign_request"

require_relative "device_server"
require_relative "installation"
require_relative "session_server"

class Headers < Faraday::Middleware
  def call(env)
    env[:request_headers]["Cache-Control"] = "no-cache"
    env[:request_headers]["User-Agent"] = "bunq_rb/1.00"
    env[:request_headers]["X-Bunq-Language"] = "nl_NL"
    env[:request_headers]["X-Bunq-Region"] = "nl_NL"
    env[:request_headers]["X-Bunq-Geolocation"] = "0 0 0 0 NL"
    env[:request_headers]["X-Bunq-Client-Request-Id"] = SecureRandom.uuid
    @app.call(env)
  end
end

module BunqRb
  class Client
    BASE_URL = 'https://sandbox.public.api.bunq.com'.freeze

    def self.connection
      @connection ||= Faraday.new(url: BASE_URL) do |config|
        config.use Headers
        config.use SignRequest
        config.request :json
        config.adapter Faraday.default_adapter
      end
    end
  end
end
