module BunqRb
  # RequestInquiry
  class RequestInquiry
    include ActiveModel::Model

    attr_accessor :id, :status

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
