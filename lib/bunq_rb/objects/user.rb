module BunqRb
  # Installation
  class User
    include BunqRb::Shared

    implements :get, :list

    attr_reader :id, :display_name

    def initialize(hsh = {})
      @id = hsh["id"]
      @display_name = hsh["display_name"]
    end

    def monetary_accounts
      @monetary_accounts ||= BunqRb::MonetaryAccount.new(user_id: @id)
      @monetary_accounts.all
    end

    def self.uri
      "/v1/user"
    end
  end
end
