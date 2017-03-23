module BunqRb
  # SessionServer
  class SessionServer
    include ActiveModel::Model
    URI = "/v1/session-server".freeze

    attr_accessor :id

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      [new(response[0]["Id"]), response[1]["Token"], response[1]["UserCompany"]]
    end
  end
end
