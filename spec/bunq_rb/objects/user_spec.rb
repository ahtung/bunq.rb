require "spec_helper"

RSpec.describe BunqRb::User, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"

  describe "#" do
    let(:item) { described_class.find(1913) }

    describe "monetary_accounts" do
      xit "returns instances of BunqRb::MonetaryAccount" do
        expect(item.monetary_accounts.first).to be_instance_of(BunqRb::MonetaryAccount)
      end
    end

    describe "monetary_account_banks" do
      xit "returns instances of BunqRb::MonetaryAccountBank" do
        expect(item.monetary_account_banks.first).to be_instance_of(BunqRb::MonetaryAccountBank)
      end
    end
  end
end
