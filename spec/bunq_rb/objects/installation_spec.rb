require "spec_helper"

RSpec.describe BunqRb::Installation do
  describe "POST /v1/installation", active_session: true do
    it "returns an :id" do
      expect(@installation.id).to be(3739)
    end

    it "returns a :token object" do
      expect(@token).not_to be_nil
    end

    it "returns a :server_public_key object" do
      expect(@server_public_key).not_to be_nil
    end
  end

  describe "GET /v1/installation/:id", active_session: true do
    it "returns an :id" do
      VCR.use_cassette "v1/get_installation" do
        installation = described_class.find(42)
        expect(installation.id).to be(3739)
      end
    end
  end

  describe "GET /v1/installation", active_session: true do
    it "returns an array of :id's" do
      VCR.use_cassette "v1/list_installation" do
        installations = described_class.all
        expect(installations.count).to be(2)
      end
    end
  end
end
