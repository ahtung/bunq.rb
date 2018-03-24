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
              id = args.pop
              full_uri = [url(*args), id].join("/")
              response = Client.send_method(:get, full_uri)
              new(response[0].values.first)
            end
          when :list
            define_singleton_method(:all) do |*args|
              page_size = BunqRb.configuration.page_size

              Enumerator.new do |yielder|
                older_id = nil

                loop do
                  older_url = Addressable::Template.new("#{url(*args)}{?query*}")
                  params = {}
                  params.merge!({ count: page_size }) if page_size != 10
                  params.merge!({ older_id: older_id }) unless older_id.nil?
                  older_url = older_url.expand(query: params).to_s

                  results = Client.raw_send_method(:get, older_url)

                  if results.success?
                    json_response = JSON.parse(results.body)
                    items = json_response["Response"]
                    raise StopIteration if items.empty?
                    items.map { |item| yielder << new(item.values.first) }
                    raise StopIteration if items.last.values.first["id"].nil?
                    older_id = items.last.values.first["id"]
                  else
                    raise StopIteration
                  end
                end
              end.lazy

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
      # puts "===> #{url}"
      faraday_response = connection.send(method, url, payload)
      json_response = JSON.parse(faraday_response.body)
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      json_response["Response"]
    end

    def self.raw_send_method(method, url, payload = {})
      # puts "===> #{url}"
      connection.send(method, url, payload)
    end
  end
end
