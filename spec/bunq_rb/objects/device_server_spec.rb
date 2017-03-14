require "spec_helper"

describe BunqRb::DeviceServer do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }
  let(:results) { BunqRb::Installation.create(client_public_key: key.public_key) }
  let(:installation) { results[0] }

  before :each do
    BunqRb.configure do |config|
      config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      config.key = key
    end
  end

  describe "POST /v1/device-server" do

    before do
      VCR.insert_cassette "post_v1_device-server", record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    before :each do
      @response = described_class.create(
        description: "Mainframe23 in Amsterdam",
        secret: BunqRb.configuration.api_key,
        permitted_ips: []
      )
    end

    xit "returns an :id object" do
      expect(@response.id).to be("")
    end

    it "returns an :id" do
      expect(object.id).to be(12)
    end
  end
end
