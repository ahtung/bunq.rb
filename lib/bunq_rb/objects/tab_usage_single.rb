module BunqRb
  # TabUsageSingle
  class TabUsageSingle
    attr_reader :uuid

    def initialize(hsh = {})
      @uuid = hsh["uuid"]
    end

    def self.uri(user_id, monetary_account_id, cash_register_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/cash-register/#{cash_register_id}/tab-usage-single"
    end

    def self.create(hash = {}, user_id, monetary_account_id, cash_register_id)
      response = Client.send_method(:post, uri(user_id, monetary_account_id, cash_register_id), hash)
      new(response[0]["Uuid"])
    end

    def update(hsh = {}, user_id, monetary_account_id, cash_register_id)
      url = self.class.uri(user_id, monetary_account_id, cash_register_id)
      full_path = [url, uuid].join("/")
      response = Client.send_method(:put, full_path, hsh)
      response[0]["Uuid"]
    end
  end
end
