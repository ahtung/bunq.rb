module BunqRb
  # InvoiceByUser
  class InvoiceByUser
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id, :invoice_number, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @invoice_number = hsh["invoice_number"]
      @status = hsh["status"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/invoice"
    end
  end
end
