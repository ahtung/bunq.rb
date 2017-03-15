module BunqRb
  # Installation
  class Installation
    URI = "/v1/installation".freeze

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      [new(response[0]["Id"]), response[1]["Token"], response[2]["ServerPublicKey"]]
    end

    def self.find(id)
      uri = [URI, id].join("/")
      response = Client.send_method(:get, uri)
      new(response[0]["Id"])
    end

    def self.all
      response = Client.send_method(:get, URI)
      response.map { |resp| new(resp["Id"]) }
    end
  end
end
