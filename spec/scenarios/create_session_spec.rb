require "spec_helper"

describe 'Create Session' do

  let(:key) { OpenSSL::PKey::RSA.new 2048 }

  before :each do
    BunqRb.configure do |config|
      config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      config.key = key
    end
  end

  it '' do
    VCR.turned_off do
      WebMock.allow_net_connect!

      # 1. POST installation
      installation = BunqRb::Installation.create(
        client_public_key: BunqRb.configuration.key.public_key
      )

      # 2. POST device-server
      device_server = BunqRb::DeviceServer.create(
        description: "DK",
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
