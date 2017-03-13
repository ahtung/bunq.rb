module BunqRb
  class Installation
    URI = '/v1/installation'

    attr_reader :id, :server_public_key

    @@token = nil
    @@server_public_key = nil

    def initialize(hsh = {}, token = nil, server_public_key = nil)
      @id = hsh['id']
      self.class.token = token
      self.class.server_public_key = server_public_key
    end

    def self.token
      @@token
    end

    def self.token=(value)
      @@token = value
    end

    def self.server_public_key
      @@server_public_key
    end

    def self.server_public_key=(value)
      @@server_public_key = value
    end

    def self.create(hash = {})
      faraday_response = Client.connection.post(URI, hash)
      json_response = JSON.parse(faraday_response.body)['Response'] # TODO: (dunyakirkali) error handling
      new(json_response[0]['Id'], json_response[1]['Token'], json_response[1]['ServerPublicKey'])
    end

    def self.find(id)
      return if @@token.nil?
      uri =  [URI, id].join('/')
      faraday_response = Client.connection.get(uri)
      json_response = JSON.parse(faraday_response.body)['Response'] # TODO: (dunyakirkali) error handling
      new(json_response['Id'])
    end
  end
end
