require "spec_helper"

describe BunqRb::SessionServer, active_session: true do
  describe "POST /v1/session-server" do
    before :each do
      @response = described_class.create(
        secret: BunqRb.configuration.api_key
      ).first
    end

    it "returns an :id object" do
      expect(@response.id).not_to be_nil
    end
  end
end
