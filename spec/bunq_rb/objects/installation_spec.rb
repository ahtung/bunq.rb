require "spec_helper"

RSpec.describe BunqRb::Installation, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"

  describe "POST /v1/installation" do
    it "returns an :id" do
      expect(@installation.id).not_to be_nil
    end

    it "returns a :token object" do
      expect(@token).not_to be_nil
    end

    it "returns a :server_public_key object" do
      expect(@server_public_key).not_to be_nil
    end
  end

  describe "server_public_key" do
    it "returns installation's server_public_key" do
      installation_server_public_key = described_class.all.first
      expect(installation_server_public_key.server_public_key).not_to be_nil
    end
  end
end
