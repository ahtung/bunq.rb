module BunqRb
  # Installation
  class User
    include BunqRb::Shared
    implements :get, :list
    # has_many :monetary_accounts
    # has_many :monetary_account_banks

    attr_reader :id, :display_name

    def initialize(hsh = {})
      @id = hsh["id"]
      @display_name = hsh["display_name"]
    end

    def self.uri
      "/v1/user"
    end
  end
end
