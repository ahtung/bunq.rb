module BunqRb
  # MonetaryAccount
  class MonetaryAccount
    include ActiveModel::Model
    include BunqRb::Shared
    implements :get, :list

    attr_accessor :id, :currency, :created, :updated, :alias, :avatar, :balance, :country, :daily_limit, :daily_spent, :description, :public_uuid,
                  :status, :sub_status, :timezone, :user_id, :monetary_account_profile, :notification_filters, :setting, :overdraft_limit

    def self.uri
      "/v1/user/#{@user_id}/monetary-account"
    end

    def self.for_user(user_id)
      full_uri = "/v1/user/#{user_id}/monetary-account"
      response = Client.send_method(:get, full_uri)
      response.map { |resp| new(resp.values.first) }
    end

    def user
      BunqRb::User.find(@user_id)
    end

    def request_inquiries
      BunqRb::RequestInquiry.for_monetary_account(user_id, id)
    end
  end
end
