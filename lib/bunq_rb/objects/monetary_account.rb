module BunqRb
  # MonetaryAccount
  class MonetaryAccount
    attr_reader :id, :currency

    def initialize(hsh = {})
      @id = hsh["id"]
      @currency = hsh["currency"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/monetary-account"
    end

    def self.all
      response = Client.send_method(:get, url(1913))
      response.map { |resp| new(resp["MonetaryAccountBank"]) }
    end
  end
end
