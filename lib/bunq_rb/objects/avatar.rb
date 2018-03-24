module BunqRb
  # Avatar
  class Avatar
    include BunqRb::Shared

    implements :get

    attr_reader :uuid

    def initialize(hsh = {})
      @uuid = hsh["uuid"]
    end

    def self.url
      "/v1/avatar"
    end

    def self.create(hash = {})
      response = Client.send_method(:post, url, hash)
      new(response[0]["Uuid"])
    end
  end
end
