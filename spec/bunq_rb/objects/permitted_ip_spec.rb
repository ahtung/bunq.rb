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

  describe "PUT /v1/user/:user_id/credential-password-ip/:credential_password_id/ip/:id" do
    it "returns PermittedIp hash" do
      VCR.insert_cassette "v1/get_permitted_ip"
      permitted_ip = described_class.find(877, user_id, credential_password_id)
      VCR.eject_cassette
      VCR.insert_cassette "v1/put_permitted_ip"
      response = permitted_ip.update({ status: 'INACTIVE' }, user_id, credential_password_id)
      expect(response["id"]).to eq(877)
      VCR.eject_cassette
    end
  end

  describe "POST /v1/user/:user_id/credential-password-ip/:credential_password_id/ip" do
    it "returns PermittedIp hash" do
      VCR.use_cassette "v1/post_permitted_ip" do
        response = described_class.create({ ip: "84.168.43.28", status: 'INACTIVE' }, user_id, credential_password_id)
        expect(response["id"]).to eq(925)
      end
    end
  end
end
