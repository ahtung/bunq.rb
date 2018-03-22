require "spec_helper"

RSpec.describe BunqRb::User, active_session: true do
  it_behaves_like "get", [1913]
  it_behaves_like "list"

  describe "cards" do
    let(:user) { described_class.find(1913) }

    it "return some cards" do
      expect(user.cards.count).to be > 0
    end

    it "returns a BunqRb::Card object" do
      card = user.cards.first
      expect(card).to be_instance_of(BunqRb::Card)
    end
  end

  describe "monetary_accounts" do
    let(:user) { described_class.find(1913) }

    it "return some monetary_accounts" do
      expect(user.monetary_accounts.count).to be > 0
    end

    it "returns a BunqRb::MonetaryAccount object" do
      monetary_account = user.monetary_accounts.first
      expect(monetary_account).to be_instance_of(BunqRb::MonetaryAccount)
    end
  end
end
