module BunqRb
  # MonetaryAccount
  class MonetaryAccount
    include BunqRb::Shared

    implements :get, :list

    attr_reader :id, :currency
    attr_reader :user_id

    def initialize(hsh = {})
      @id = hsh["id"]
      @currency = hsh["currency"]

      @user_id = hsh["user_id"]
    end

    def self.uri
      "/v1/user/#{@user_id}/monetary-account"
    end
  end
end
