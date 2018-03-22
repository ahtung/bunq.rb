require "spec_helper"

RSpec.describe BunqRb::Payment do
  describe "GET /v1/user/1913/monetary-account/1933/payment", active_session: true do
    it "returns an array of :id's" do
      payments = described_class.all(1913, 1933)
      expect(payments.count).to be(1)
    end
  end
end
