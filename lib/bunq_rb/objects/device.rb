module BunqRb
  # Device
  class Device
    include BunqRb::Shared

    implements :list

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.url
      "/v1/device"
    end
  end
end
