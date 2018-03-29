module BunqRb
  # CustomerStatementExport
  class CustomerStatementExport
    include BunqRb::Shared

    implements :list, :get, :delete

    attr_reader :id, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @status = hsh["status"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/customer-statement"
    end
  end
end
