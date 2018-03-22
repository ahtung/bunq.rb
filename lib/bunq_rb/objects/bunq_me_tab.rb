module BunqRb
  # Avatar
  class BunqMeTab
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

    def self.all(user_id, monetary_account_id)
      page_size = BunqRb.configuration.page_size
      response = Client.send_method(:get, "#{url(user_id, monetary_account_id)}?count=#{page_size}")
      response.map { |resp| new(resp["BunqMeTab"]) }
    end
  end
end
