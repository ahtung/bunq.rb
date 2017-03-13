require "spec_helper"

describe 'Create Session' do

  let(:key) { OpenSSL::PKey::RSA.new 2048 }

  fit '' do
    KEY = key
    api_key = "fe7d4dd1fe31bb585fd86ab6febbf96f978e14f630660865840b5f611d42da9a"
    # 1. POST installation
    installation = BunqRb::Installation.create(
      client_public_key: key.public_key
    )

    # 2. POST device-server
    device_server = BunqRb::DeviceServer.create(
      description: "DK",
      secret: api_key,
      permitted_ips: [
        '94.210.58.254'
      ]
    )
    puts device_server

    # 3. POST session-server
    session_server = BunqRb::SessionServer.create(
      secret: api_key
    )
    puts session_server
  end
end
