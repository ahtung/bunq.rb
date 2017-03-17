require "spec_helper"

RSpec.describe BunqRb::PermittedIp, active_session: true do
  let(:user_id) { 1913 }
  let(:credential_password_id) { 3088 }

  describe "GET /v1/user/:user_id/credential-password-ip/:credential_password_id/ip" do
    it "returns an array of :id's" do
      VCR.use_cassette "v1/list_permitted_ips" do
        permitted_ips = described_class.all(user_id, credential_password_id)
        expect(permitted_ips.count).to be(2)
      end
    end
  end

  describe "GET /v1/user/:user_id/credential-password-ip/:credential_password_id/ip/:id" do
    it "returns an PermittedIp" do
      VCR.use_cassette "v1/get_permitted_ip" do
        permitted_ip = described_class.find(906, user_id, credential_password_id)
        expect(permitted_ip.status).to eq("ACTIVE")
      end
    end
  end
end
