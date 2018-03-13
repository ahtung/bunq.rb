module BunqRb
  # CashRegister
  class CashRegister
    include BunqRb::Shared

    implements :post, :put, :get, :list

    attr_reader :id, :name, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @name = hsh["name"]
      @status = hsh["status"]
    end

    def self.create(hsh = {}, user_id, monetary_account_id)
      url = uri(user_id, monetary_account_id)
      response = Client.send_method(:post, url, hsh)
      response[0]["Id"]
    end

    def self.uri(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/cash-register"
    end
  end
end
