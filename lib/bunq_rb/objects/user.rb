module BunqRb
  # Installation
  class User
    include ActiveModel::Model
    include BunqRb::Shared
    implements :get, :list
    # has_many :monetary_accounts
    # has_many :monetary_account_banks

    attr_accessor :id, :created, :updated, :alias, :avatar, :status, :sub_status, :public_uuid, :display_name, :public_nick_name, :language, :region,
      :session_timeout, :daily_limit_without_confirmation_login, :notification_filters, :address_main, :address_postal, :counter_bank_iban, :name,
      :chamber_of_commerce_number, :director_alias, :ubo, :version_terms_of_service, :country

    def self.uri
      "/v1/user"
    end
  end
end
