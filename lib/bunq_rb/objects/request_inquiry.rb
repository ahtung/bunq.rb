module BunqRb
  # RequestInquiry
  class RequestInquiry
    include BunqRb::Shared

    implements :get

    attr_reader :id, :status

    def initialize(hsh = {})
      @id = hsh["id"]
      @status = hsh["status"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/request-inquiry"
    end

    def self.create(hash = {})
      response = Client.send_method(:post, url(1, 1933), hash)
      new(response[0]["Id"])
    end
  end
end
