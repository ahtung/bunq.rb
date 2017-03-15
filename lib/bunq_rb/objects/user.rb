module BunqRb
  # Installation
  class User
    URI = "/v1/user".freeze

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.find(id)
      uri = [URI, id].join("/")
      response = Client.send_method(:get, uri)
      new(response[0]["UserCompany"])
    end

    def self.all
      response = Client.send_method(:get, URI)
      response.map { |resp| new(resp["UserCompany"]) }
    end
  end
end
