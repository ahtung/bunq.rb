module BunqRb
  # CashRegister
  class CashRegister
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id, :name, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @name = hsh["name"]
      @status = hsh["status"]
    end

    def self.create(hsh = {}, user_id, monetary_account_id)
      uri = url(user_id, monetary_account_id)
      response = Client.send_method(:post, uri, hsh)
      response[0]["Id"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/cash-register"
    end
  end
end
