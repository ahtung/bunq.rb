module BunqRb
  # InstallationServerPublicKey
  class InstallationServerPublicKey
    attr_reader :server_public_key
    attr_reader :installation_id

    def initialize(hsh = {})
      @server_public_key = hsh["server_public_key"]

      @installation_id = hsh[:installation_id]
    end

    def uri
      "/v1/installation/#{installation_id}/server-public-key"
    end

    def all
      response = Client.send_method(:get, uri)
      response.map { |resp| self.class.new(resp["ServerPublicKey"].merge(installation_id: installation_id)) }
    end
  end
end
