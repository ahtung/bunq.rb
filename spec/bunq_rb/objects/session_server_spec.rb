require "spec_helper"

describe BunqRb::SessionServer, valid_session: true do
  describe "POST /v1/session-server" do
    before do
      VCR.insert_cassette "post_v1_session-server"
    end

    after do
      VCR.eject_cassette
    end

    before :each do
      @response = described_class.create(
        secret: BunqRb.configuration.api_key
      )
    end

    it "returns an :id object" do
      expect(@response.id).to be(23)
    end
  end
end
