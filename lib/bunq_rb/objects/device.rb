module BunqRb
  # Device
  class Device
    URI = "/v1/device".freeze

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.find(device_id)
      response = Client.send_method(:get, [URI, device_id].join("/"))
      new(response[0].values.first)
    end

    def self.all
      response = Client.send_method(:get, URI)
      response.map { |resp| new(resp.first.first) }
    end
  end
end
