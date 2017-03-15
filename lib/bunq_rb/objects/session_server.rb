module BunqRb
  # SessionServer
  class SessionServer
    URI = "/v1/session-server".freeze

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      [new(response[0]["Id"]), response[1]["Token"], response[1]["UserCompany"]]
    end
  end
end
