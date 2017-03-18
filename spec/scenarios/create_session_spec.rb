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
    # 1. POST installation
    _installation, token, _server_public_key = BunqRb::Installation.create(
      client_public_key: BunqRb.configuration.key.public_key
    )

    # Set session_token
    BunqRb.configuration.session_token = token["token"]

    # 2. POST device-server
    _device_server = BunqRb::DeviceServer.create(
      description: "Dunya",
      secret: BunqRb.configuration.api_key,
      permitted_ips: []
    )

    # 3. POST session-server
    _session_server, @token, _user_company = BunqRb::SessionServer.create(
      secret: BunqRb.configuration.api_key
    )

    expect(@token).not_to be_nil
  end
end
