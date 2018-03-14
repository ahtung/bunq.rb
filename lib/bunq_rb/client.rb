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
          when :put
            define_singleton_method(:update) do |*args|
              response = Client.send_method(:post, uri, args)
              new(response[0]["Id"])
            end
          else
            puts "ERROR for: #{call}"
          end
        end
      end
    end
  end
end

Dir[File.dirname(__FILE__) + "/objects/**/*.rb"].each { |f| require f }

module BunqRb
  # Client
  class Client
    def self.connection
      @connection ||= Faraday.new(url: BunqRb.configuration.url) do |config|
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
