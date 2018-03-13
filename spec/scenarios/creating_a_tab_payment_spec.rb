require "spec_helper"

RSpec.describe "Scenario" do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }

  before :each do
    BunqRb.configure do |config|
      config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      config.key = key
    end
  end

  it "Create a Tab Payment" do
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

    # 4. POST attachment-public
    image_path = File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/images/baz.jpg"))
    image = Faraday::UploadIO.new(image_path, 'image/jpeg')
    attachment = BunqRb::AttachmentPublic.create(image)

    # 5. POST avatar
    avatar = BunqRb::Avatar.create(
      attachment_public_uuid: "d93e07e3-d420-45e5-8684-fc0c09a63686"
    )

    # 6. LIST monetary-account
    puts BunqRb::MonetaryAccount.all.inspect

    # 7a. POST cash-register
    _cash_register = BunqRb::CashRegister.create({name: "Test", status: "PENDING_APPROVAL", avatar_uuid: "d93e07e3-d420-45e5-8684-fc0c09a63686"}, 1913, 11)

    expect(nil).not_to be_nil
  end
end
