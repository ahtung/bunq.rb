module BunqRb
  # Card
  class Card
    include BunqRb::Shared

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.all(user_id)
      response = Client.send_method(:get, url(user_id))
      response.map { |resp| new(resp["CardDebit"]) }
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/card"
    end

    def self.find(user_id, id)
      uri = [url(user_id), id].join("/")
      response = Client.send_method(:get, uri)
      new(response[0]["CardDebit"])
    end
  end
end
