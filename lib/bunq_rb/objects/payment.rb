module BunqRb
  # Payment
  class Payment
    attr_reader :id, :description

    def initialize(hsh = {})
      @id = hsh["id"]
      @description = hsh["description"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/payment"
    end

    def self.all(user_id, monetary_account_id)
      response = Client.send_method(:get, url(user_id, monetary_account_id))
      response.map { |resp| new(resp["Payment"]) }
    end
  end
end
