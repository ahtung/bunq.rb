module BunqRb
  # SessionServer
  class SessionServer
    URI = "/v1/session-server".freeze

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      new(response[0]["Id"])
    end
  end
end
