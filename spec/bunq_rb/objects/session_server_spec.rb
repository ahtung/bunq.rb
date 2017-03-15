require "spec_helper"

describe BunqRb::SessionServer, active_session: true do
  describe "POST /v1/session-server" do
    before :each do
      VCR.insert_cassette "v1/post_session-server"
      @response = described_class.create(
        secret: BunqRb.configuration.api_key
      ).first
      VCR.eject_cassette
    end

    it "returns an :id object" do
      expect(@response.id).to be(6038)
    end
  end
end
