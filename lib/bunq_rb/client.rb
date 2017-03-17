require "addressable/uri"
require "securerandom"
require "faraday"
require "faraday_middleware"

require_relative "client/headers"
require_relative "client/sign_request"

require_relative "objects/device_server"
require_relative "objects/installation"
require_relative "objects/session_server"
require_relative "objects/attachment_public"
require_relative "objects/avatar"
require_relative "objects/permitted_ip"
require_relative "objects/attachment_public"
require_relative "objects/avatar"

module BunqRb
  # Client
  class Client
    BASE_URL = "https://sandbox.public.api.bunq.com".freeze

    def self.connection
      @connection ||= Faraday.new(url: BASE_URL) do |config|
        config.use Headers
        config.use SignRequest
        config.request :json
        config.adapter Faraday.default_adapter
      end
    end

    def self.send_method(method, url, payload = {})
      faraday_response = connection.send(method, url, payload)
      json_response = JSON.parse(faraday_response.body)
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      json_response["Response"]
    end
  end
end
