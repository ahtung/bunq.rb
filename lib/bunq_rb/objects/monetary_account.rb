module BunqRb
  # MonetaryAccount
  class MonetaryAccount
    include ActiveModel::Model
    include BunqRb::Shared
    implements :get, :list
    # belongs_to :user

    attr_accessor :id, :currency, :created, :updated, :alias, :avatar, :balance, :country, :daily_limit, :daily_spent, :description, :public_uuid,
      :status, :sub_status, :timezone, :user_id, :monetary_account_profile, :notification_filters, :setting, :overdraft_limit

    def self.uri
      "/v1/user/#{@user_id}/monetary-account"
    end
  end
end
