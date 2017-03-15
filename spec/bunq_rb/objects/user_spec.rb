require "spec_helper"

RSpec.describe BunqRb::User, active_session: true do
  describe "GET /v1/user/:id" do
    it "returns an UserCompany" do
      VCR.use_cassette "v1/get_user" do
        user = described_class.find(42)
        expect(user.id).to be(3739)
      end
    end
  end

  describe "GET /v1/user" do
    it "returns an array of UserCompany's" do
      VCR.use_cassette "v1/list_user" do
        users = described_class.all
        expect(users.count).to be(2)
      end
    end
  end
end
