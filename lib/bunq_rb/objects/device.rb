module BunqRb
  # Device
  class Device
    include BunqRb::Shared

    implements :get, :list

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.uri
      "/v1/device"
    end
  end
end
