module BunqRb
  # Payment
  class Payment
    include ActiveModel::Model
    include BunqRb::Shared

    implements :post, :put, :get, :list

    attr_accessor :id, :created, :updated, :alias, :avatar, :balance, :country, :currency, :daily_limit, :daily_spent, :description, :public_uuid,
                  :status, :sub_status, :timezone, :user_id, :monetary_account_profile, :notification_filters, :setting, :overdraft_limit

    def self.uri
      "/v1/user/#{@user_id}/monetary-account/#{@monetary_account_id}/payment"
    end
  end
end
