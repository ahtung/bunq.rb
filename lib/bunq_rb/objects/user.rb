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

    def self.url
      "/v1/user"
    end

    def monetary_accounts
      BunqRb::MonetaryAccountBank.all(@id)
    end

    def cards
      BunqRb::Card.all(@id)
    end
  end
end
