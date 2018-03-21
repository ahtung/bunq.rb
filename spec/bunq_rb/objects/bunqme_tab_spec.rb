require "spec_helper"

RSpec.describe BunqRb::BunqMeTab do
  describe "GET /v1/user/1913/monetary-account/1933/bunqme-tab", active_session: true do
    it "returns an array of :id's" do
      bunq_me_tabs = described_class.all(1913, 1933)
      expect(bunq_me_tabs.count).to be(1)
    end
  end
end
