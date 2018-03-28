require "spec_helper"

RSpec.describe BunqRb::MonetaryAccountBank, active_session: true do
  it_behaves_like "list", [1]

  describe "payments" do
    let(:monetary_account) { described_class.all(1).first }

    it "return some payments" do
      expect(monetary_account.payments.count).to be > 0
    end

    it "returns a BunqRb::Payment object" do
      payment = monetary_account.payments.first
      expect(payment).to be_instance_of(BunqRb::Payment)
    end
  end

  describe "invoices" do
    let(:monetary_account) { described_class.all(1).first }

    it "return some invoices" do
      expect(monetary_account.invoices.count).to be > 0
    end

    it "returns a BunqRb::Invoice object" do
      invoice = monetary_account.invoices.first
      expect(invoice).to be_instance_of(BunqRb::Invoice)
    end
  end

  describe "bunq_me_tabs" do
    let(:monetary_account) { described_class.all(1).first }

    it "return some bunq_me_tabs" do
      expect(monetary_account.payments.count).to be > 0
    end

    it "returns a BunqRb::BunqMeTab object" do
      bunqme_tab = monetary_account.bunq_me_tabs.first
      expect(bunqme_tab).to be_instance_of(BunqRb::BunqMeTab)
    end
  end
end
