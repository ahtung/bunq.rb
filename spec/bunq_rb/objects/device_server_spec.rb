require "spec_helper"

describe BunqRb::DeviceServer, valid_session: true do
  describe "POST /v1/device-server" do
    before do
      VCR.insert_cassette "post_v1_device-server"
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

    it "returns an :id object" do
      expect(@response.id).to be(12)
    end
  end
end
