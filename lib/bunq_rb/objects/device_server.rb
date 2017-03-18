module BunqRb
  # DeviceServer
  class DeviceServer
    include BunqRb::Shared

    implements :post, :get, :list

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.uri
      "/v1/device-server"
    end
  end
end
