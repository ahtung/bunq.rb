require "addressable/uri"
require "securerandom"
require "faraday"
require "faraday_middleware"

require_relative "client/headers"
require_relative "client/sign_request"

module BunqRb
  # Shared
  # TODO: (dunyakirkali) Extract to file
  module Shared
    extend ActiveSupport::Concern

    module ClassMethods
      def implements(*calls)
        calls.each do |call|
          case call
          when :get
            define_singleton_method(:find) do |*args|
              full_uri = [uri, args.first].join("/")
              response = Client.send_method(:get, full_uri)
              new(response[0].values.first)
            end
          when :list
            define_singleton_method(:all) do
              response = Client.send_method(:get, uri)
              response.map { |resp| new(resp.values.first) }
            end
          when :post
            define_singleton_method(:create) do |*args|
              response = Client.send_method(:post, uri, args)
              new(response[0]["Id"])
            end
          else
            puts "ERROR"
          end
        end
      end
    end
  end
end

require_relative "objects/device"
require_relative "objects/device_server"
require_relative "objects/installation"
require_relative "objects/installation_server_public_key"
require_relative "objects/session_server"
require_relative "objects/user"
require_relative "objects/permitted_ip"
require_relative "objects/monetary_account"
require_relative "objects/attachment_monetary_account"
require_relative "objects/request_inquiry"
require_relative "objects/avatar"
require_relative "objects/permitted_ip"
require_relative "objects/attachment_public"
require_relative "objects/avatar"
require_relative "objects/cash_register"
require_relative "objects/tab_usage_single"

module BunqRb
  # Client
  class Client
    BASE_URL = "https://sandbox.public.api.bunq.com".freeze

    def self.connection
      @connection ||= Faraday.new(url: BASE_URL) do |config|
        config.use Headers
        config.use SignRequest
        config.request :json
        config.request :multipart
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
