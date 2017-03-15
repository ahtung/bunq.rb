require "spec_helper"

describe BunqRb::DeviceServer, active_session: true do
  describe "POST /v1/device-server" do
    before :each do
      @response = described_class.create(
        description: "Mainframe23 in Amsterdam",
        secret: BunqRb.configuration.api_key,
        permitted_ips: []
      )
    end

    it "returns an :id object" do
      expect(@response.id).to be(3647)
    end
  end
end
