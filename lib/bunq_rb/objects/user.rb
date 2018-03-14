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

    def self.uri
      "/v1/user"
    end

    def monetary_accounts
      BunqRb::MonetaryAccount.all(@id)
    end
  end
end
