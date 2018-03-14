require "spec_helper"

RSpec.describe BunqRb::MonetaryAccount do
  describe "GET /v1/user/1913/monetary-account", active_session: true do
    it "returns an array of :id's" do
      installations = described_class.all(1913)
      expect(installations.count).to be(1)
    end
  end
end
