module BunqRb
  # Avatar
  class BunqMeTab
    include BunqRb::Shared

    implements :list

    attr_reader :id, :created, :updated, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @status = hsh["status"]
      @created = Time.parse(hsh["created"])
      @updated = Time.parse(hsh["updated"])
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/bunqme-tab"
    end
  end
end
