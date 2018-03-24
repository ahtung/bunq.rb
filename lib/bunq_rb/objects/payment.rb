module BunqRb
  # Payment
  class Payment
    include BunqRb::Shared

    implements :list

    attr_reader :id, :created, :updated, :description, :amount

    def initialize(hsh = {})
      @id = hsh["id"]
      @description = hsh["description"]
      @amount = Money.new(hsh["amount"]["value"].to_f * 100, hsh["amount"]["currency"])
      @created = Time.parse(hsh["created"])
      @updated = Time.parse(hsh["updated"])
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/payment"
    end
  end
end
