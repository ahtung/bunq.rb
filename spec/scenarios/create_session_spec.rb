require "spec_helper"

describe "Scenario" do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }

  before :each do
    BunqRb.configure do |config|
      config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      config.key = key
    end
  end

  it "Create Session" do
    VCR.turned_off do
      WebMock.allow_net_connect!

      # 1. POST installation
      _installation, token, _server_public_key = BunqRb::Installation.create(
        client_public_key: BunqRb.configuration.key.public_key
      )

      # Set session_token
      BunqRb.configuration.session_token = token["token"]

      # 2. POST device-server
      device_server = BunqRb::DeviceServer.create(
        description: "Dunya",
        secret: BunqRb.configuration.api_key,
        permitted_ips: []
      )
      puts device_server

      # 3. POST session-server
      session_server = BunqRb::SessionServer.create(
        secret: BunqRb.configuration.api_key
      )
      puts session_server
    end
  end
end
