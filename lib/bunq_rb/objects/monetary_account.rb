module BunqRb
  # MonetaryAccount
  class MonetaryAccount
    attr_reader :id, :currency, :description

    def initialize(hsh = {})
      @id = hsh["id"]
      @currency = hsh["currency"]
      @description = hsh["description"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/monetary-account"
    end

    def self.all(user_id)
      response = Client.send_method(:get, url(user_id))
      response.map { |resp| new(resp["MonetaryAccountBank"]) }
    end
  end
end
