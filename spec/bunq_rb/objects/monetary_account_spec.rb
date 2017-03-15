require "spec_helper"

RSpec.describe BunqRb::MonetaryAccount do
  describe "GET /v1/user/1913/monetary-account", active_session: true do
    xit "returns an array of :id's" do
      VCR.use_cassette "v1/list_monetary_accounts" do
        installations = described_class.all
        expect(installations.count).to be(2)
      end
    end
  end
end
