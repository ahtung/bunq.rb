require "spec_helper"

RSpec.describe BunqRb::PermittedIp, active_session: true do
  let(:user_id) { 1913 }
  let(:credential_password_id) { 3088 }

  describe "GET /v1/user/:user_id/credential-password-ip/:credential_password_id/ip" do
    it "returns an array of :id's" do
      permitted_ips = described_class.all(user_id, credential_password_id)
      expect(permitted_ips.count).not_to eq(0)
    end
  end

  describe "GET /v1/user/:user_id/credential-password-ip/:credential_password_id/ip/:id" do
    it "returns an PermittedIp" do
      permitted_ip = described_class.find(906, user_id, credential_password_id)
      expect(permitted_ip.status).to eq("ACTIVE")
    end
  end

  describe "PUT /v1/user/:user_id/credential-password-ip/:credential_password_id/ip/:id" do
    it "returns PermittedIp hash" do
      permitted_ip = described_class.find(927, user_id, credential_password_id)
      response = permitted_ip.update({ status: "INACTIVE" }, user_id, credential_password_id)
      expect(response["id"]).to eq(927)
    end
  end

  describe "POST /v1/user/:user_id/credential-password-ip/:credential_password_id/ip" do
    it "returns PermittedIp hash" do
      response = described_class.create({ ip: "84.168.43.29", status: "INACTIVE" }, user_id, credential_password_id)
      expect(response["id"]).not_to be_nil
    end
  end
end
