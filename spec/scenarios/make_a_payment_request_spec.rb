require "spec_helper"

describe "Scenario" do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }

  before :each do
    BunqRb.configure do |config|
      config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      config.key = key
    end
  end

  it "Making a payment request" do
    VCR.turned_off do
      WebMock.allow_net_connect!

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

      BunqRb.configuration.session_token = @token["token"]

      # 4. LIST monetary-account
      puts BunqRb::MonetaryAccount.all.inspect

      # 5. POST monetary-account attachment (optional)
<<<<<<< 1041653423ed43a7adf26c597be860c50e5d7e64
      # config_path = File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/images/baz.jpg"))
      # image = Faraday::UploadIO.new(config_path, 'image/jpeg')
      # attachment = BunqRb::AttachmentMonetaryAccount.create(image)
=======
      path = File.join(File.dirname(__FILE__), "../fixtures/images/baz.jpg")
      image = Faraday::UploadIO.new(path, 'image/jpeg')
      # attachment_id = BunqRb::AttachmentMonetaryAccount.create(image)
>>>>>>> Implement second scenario

      # 6. POST request-inquiry
      request_inqury = BunqRb::RequestInquiry.create(
        allow_bunqme: false,
        amount_inquired: {
          value: "9.95",
          currency: "EUR"
        },
        counterparty_alias: {
          type: "EMAIL",
          value: "bravo@bunq.com"
        },
        description: "Enjoy the concert!",
        attachment: [
<<<<<<< 1041653423ed43a7adf26c597be860c50e5d7e64
          # id: attachment.id
=======
          # attachment_id
>>>>>>> Implement second scenario
        ]
      )

      request_inqury = BunqRb::RequestInquiry.find(request_inqury.id)

      expect(request_inqury.status).to eq("PENDING")
    end
  end
end
