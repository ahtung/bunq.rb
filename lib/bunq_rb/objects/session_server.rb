module BunqRb
  class SessionServer
    URI = '/v1/session-server'

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(hash = {})
      faraday_response = Client.connection.post(URI, hash)
      json_response = JSON.parse(faraday_response.body) # TODO: (dunyakirkali) error handling
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      new(json_response["Response"]['Id'])
    end
  end
end
