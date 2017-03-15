require "spec_helper"

RSpec.describe BunqRb::PermittedIp do
  describe "GET /v1/user/:user_id/credential-password-ip/:credential_password_id/ip", active_session: true do
    it "returns an array of :id's" do
      user_id = 12
      credential_password_id = 12
      VCR.use_cassette "v1/list_permitted_ips" do
        permitted_ips = described_class.all(user_id, credential_password_id)
        expect(permitted_ips.count).to be(2)
      end
    end
  end
end
