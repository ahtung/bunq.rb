require "spec_helper"

RSpec.describe BunqRb::InstallationServerPublicKey do
  describe "GET /v1/installation/:installation_id/server-public-key", active_session: true do
    let(:server_public_key) { described_class.new(installation_id: @installation.id) }

    it "returns a server_public_key" do
      expect(server_public_key.all.first.server_public_key).not_to be_nil
    end
  end
end
