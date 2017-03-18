require "spec_helper"

RSpec.describe BunqRb::Avatar do
  describe "POST /v1/avatar", active_session: true do
    before :each do
      @avatar = described_class.find(42)
    end

    it "returns an :id" do
      expect(@avatar.id).to be(3739)
    end
  end

  describe "GET /v1/avatar/:id", active_session: true do
    it "returns an :id" do
      installation = described_class.find(42)
      expect(installation.id).to be(3739)
    end
  end
end
