module BunqRb
  # PermittedIp
  class PermittedIp
    include BunqRb::Shared

    implements :get, :list

    attr_reader :ip, :status, :id

    def initialize(hsh = {})
      @id = hsh["id"]
      @ip = hsh["ip"]
      @status = hsh["status"]
    end

    def self.url(user_id, credential_password_id)
      "/v1/user/#{user_id}/credential-password-ip/#{credential_password_id}/ip"
    end

    def self.create(hsh = {}, user_id, credential_password_id)
      uri = url(user_id, credential_password_id)
      response = Client.send_method(:post, uri, hsh)
      response[0]["Id"]
    end

    def update(hsh = {}, user_id, credential_password_id)
      uri = self.class.url(user_id, credential_password_id)
      full_path = [uri, id].join("/")
      response = Client.send_method(:put, full_path, hsh)
      response[0]["Id"]
    end
  end
end
