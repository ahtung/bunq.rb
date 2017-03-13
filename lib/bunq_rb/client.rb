require "addressable/uri"
require "securerandom"
require "faraday"
require "faraday_middleware"

require_relative "client/headers"
require_relative "client/sign_request"

require_relative "objects/device_server"
require_relative "objects/installation"
require_relative "objects/session_server"

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
