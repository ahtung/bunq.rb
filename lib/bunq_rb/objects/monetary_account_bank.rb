module BunqRb
  # MonetaryAccountBank
  class MonetaryAccountBank
    include BunqRb::Shared

    implements :get, :list#, :post, :put

    attr_reader :id
    attr_reader :user_id

    def initialize(hsh = {})
      @id = hsh["id"]

      @user_id = hsh["user_id"]
    end

    def self.uri
      "/v1/user/#{@user_id}/monetary-account-bank"
    end
  end
end
