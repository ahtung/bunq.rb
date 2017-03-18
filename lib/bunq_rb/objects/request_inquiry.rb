module BunqRb
  # RequestInquiry
  class RequestInquiry
    include ActiveModel::Model
    include ActiveModel::Validations

    validates :user_id, presence: true
    validates :monetary_account_id, presence: true

    attr_accessor :id, :created, :updated, :time_responded, :time_expiry, :monetary_account_id, :amount_inquired, :amount_responded,
                  :user_alias_created, :user_alias_revoked, :counterparty_alias, :description, :merchant_reference, :attachment, :status, :batch_id,
                  :scheduled_id, :minimum_age, :require_address, :redirect_url, :address_shipping, :address_billing, :geolocation, :allow_chat

    def self.for_monetary_account(user_id, monetary_account_id)
      full_uri = "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/request-inquiry"
      response = Client.send_method(:get, full_uri)
      response.map { |resp| new(resp.values.first) }
    end

    def self.url(user_id, monetary_account_id, id = nil)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/request-inquiry/#{id}"
    end

    def self.find(id)
      response = Client.send_method(:get, url(1913, 1933, id))
      new(response[0]["RequestInquiry"])
    end

    def self.create(hash = {})
      response = Client.send_method(:post, url(1913, 1933), hash)
      new(response[0]["Id"])
    end
  end
end
