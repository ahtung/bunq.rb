module BunqRb
  # MonetaryAccountBank
  class MonetaryAccountBank
    include ActiveModel::Model
    include BunqRb::Shared
    implements :get, :list#, :post, :put
    # belongs_to :user

    attr_accessor :id, :created, :updated, :alias, :avatar, :balance, :country, :currency, :daily_limit, :daily_spent, :description, :public_uuid,
      :status, :sub_status, :timezone, :user_id, :monetary_account_profile, :notification_filters, :setting, :overdraft_limit

    def self.uri
      "/v1/user/#{@user_id}/monetary-account-bank"
    end
  end
end
