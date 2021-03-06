module BunqRb
  # RequestResponse
  class RequestResponse
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/request-response"
    end
  end
end
