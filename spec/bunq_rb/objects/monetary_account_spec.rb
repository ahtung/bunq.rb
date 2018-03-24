require "spec_helper"

RSpec.describe BunqRb::MonetaryAccountBank, active_session: true do
  it_behaves_like "list", [1913]

  describe "payments" do
    let(:monetary_account) { described_class.all(1913).first }

    it "return some payments" do
      expect(monetary_account.payments.count).to be > 0
    end

    it "returns a BunqRb::Payment object" do
      payment = monetary_account.payments.first
      expect(payment).to be_instance_of(BunqRb::Payment)
    end
  end

  describe "bunq_me_tabs" do
    let(:monetary_account) { described_class.all(1913).first }

    it "return some bunq_me_tabs" do
      expect(monetary_account.payments.count).to be > 0
    end

    it "returns a BunqRb::BunqMeTab object" do
      bunqme_tab = monetary_account.bunq_me_tabs.first
      expect(bunqme_tab).to be_instance_of(BunqRb::BunqMeTab)
    end
  end
end
