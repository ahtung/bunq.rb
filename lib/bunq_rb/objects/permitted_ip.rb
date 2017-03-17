module BunqRb
  # PermittedIp
  class PermittedIp
    attr_reader :ip, :status, :id

    def initialize(hsh = {})
      @id = hsh["id"]
      @ip = hsh["ip"]
      @status = hsh["status"]
    end

    def self.uri(user_id, credential_password_id)
      "/v1/user/#{user_id}/credential-password-ip/#{credential_password_id}/ip"
    end

    def self.create(hsh = {}, user_id, credential_password_id)
      url = uri(user_id, credential_password_id)
      response = Client.send_method(:post, url, hsh)
      response[0]["Id"]
    end

    def self.all(user_id, credential_password_id)
      url = uri(user_id, credential_password_id)
      response = Client.send_method(:get, url)
      response.map { |resp| new(resp["PermittedIp"]) }
    end

    def self.find(id, user_id, credential_password_id)
      url = uri(user_id, credential_password_id)
      full_path = [url, id].join("/")
      response = Client.send_method(:get, full_path)
      new(response[0]["PermittedIp"])
    end

    def update(hsh = {}, user_id, credential_password_id)
      url = self.class.uri(user_id, credential_password_id)
      full_path = [url, id].join("/")
      response = Client.send_method(:put, full_path, hsh)
      response[0]["Id"]
    end
  end
end
