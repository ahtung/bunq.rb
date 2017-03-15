module BunqRb
  # DeviceServer
  class DeviceServer
    URI = "/v1/device-server".freeze

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      new(response[0]["Id"])
    end
  end
end
