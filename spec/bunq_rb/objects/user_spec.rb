require "spec_helper"

RSpec.describe BunqRb::User, active_session: true do
  it_behaves_like "get", [1]
  it_behaves_like "list"

  describe "cards" do
    let(:user) { described_class.find(1) }

    it "return some cards" do
      expect(user.cards.count).to be > 0
    end

    it "returns a BunqRb::Card object" do
      card = user.cards.first
      expect(card).to be_instance_of(BunqRb::Card)
    end
  end

  describe "card_names" do
    let(:user) { described_class.find(1) }

    it "return some card_names" do
      expect(user.card_names.count).to be > 0
    end

    it "returns a BunqRb::Card object" do
      card_name = user.card_names.first
      expect(card_name).to be_instance_of(BunqRb::CardName)
    end
  end

  describe "monetary_accounts" do
    let(:user) { described_class.find(1) }

    it "return some monetary_accounts" do
      expect(user.monetary_accounts.count).to be > 0
    end

    it "returns a BunqRb::MonetaryAccountBank object" do
      monetary_account = user.monetary_accounts.first
      expect(monetary_account).to be_instance_of(BunqRb::MonetaryAccountBank)
    end
  end
end
