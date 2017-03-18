module BunqRb
  # MonetaryAccountBank
  class MonetaryAccountBank
    include ActiveModel::Model
    include ActiveModel::Validations
    include BunqRb::Shared
    implements :get, :list, :post, :put

    validates :user_id, presence: true

    attr_accessor :id, :created, :updated, :alias, :avatar, :balance, :country, :currency, :daily_limit, :daily_spent, :description, :public_uuid,
                  :status, :sub_status, :timezone, :user_id, :monetary_account_profile, :notification_filters, :setting, :overdraft_limit

    def self.uri
      "/v1/user/#{@user_id}/monetary-account-bank"
    end

    def self.for_user(user_id)
      full_uri = "/v1/user/#{user_id}/monetary-account-bank"
      response = Client.send_method(:get, full_uri)
      response.map { |resp| new(resp.values.first) }
    end

    def user
      BunqRb::User.find(@user_id)
    end
  end
end
