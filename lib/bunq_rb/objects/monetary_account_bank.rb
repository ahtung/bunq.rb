module BunqRb
  # MonetaryAccountBank
  class MonetaryAccountBank
    include BunqRb::Shared

    implements :list

    attr_reader :id, :currency, :description

    def initialize(hsh = {})
      # puts hsh
      @id = hsh["id"]
      @user_id = hsh["user_id"]
      @currency = hsh["currency"]
      @description = hsh["description"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/monetary-account-bank"
    end

    def payments
      BunqRb::Payment.all(@user_id, @id)
    end

    def bunq_me_tabs
      BunqRb::BunqMeTab.all(@user_id, @id)
    end
  end
end
