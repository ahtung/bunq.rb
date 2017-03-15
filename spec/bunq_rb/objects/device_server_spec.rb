require "spec_helper"

describe BunqRb::DeviceServer, active_session: true do
  describe "POST /v1/device-server" do
    before :each do
      VCR.insert_cassette "v1/post_device-server"
      @response = described_class.create(
        description: "Mainframe23 in Amsterdam",
        secret: BunqRb.configuration.api_key,
        permitted_ips: []
      )
      VCR.eject_cassette
    end

    it "returns an :id object" do
      expect(@response.id).to be(3647)
    end
  end
end
