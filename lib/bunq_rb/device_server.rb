module BunqRb
  class DeviceServer
    URI = '/v1/device-server'

    def self.create(hash = {})
      faraday_response = Client.connection.post(URI, hash)
      json_response = JSON.parse(faraday_response.body) # TODO: (dunyakirkali) error handling
    end
  end
end
