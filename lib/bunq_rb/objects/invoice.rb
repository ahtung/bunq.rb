module BunqRb
  # Invoice
  class Invoice
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id, :invoice_number

    def initialize(hsh = {})
      @id = hsh["id"]
      @invoice_number = hsh["invoice_number"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/invoice"
    end
  end
end
