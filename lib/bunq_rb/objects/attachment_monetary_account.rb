module BunqRb
  # AttachmentMonetaryAccount
  class AttachmentMonetaryAccount
    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.create(image)
      response = Client.send_method(:post, url(1913, 1933), image)
      response.map { |resp| new(resp["MonetaryAccountBank"]) }
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/attachment"
    end
  end
end
