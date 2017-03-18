require "spec_helper"

RSpec.describe BunqRb::Payment, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"
  it_behaves_like "post"
  it_behaves_like "put"

  describe "#" do
    describe "monetary_account" do
      let(:item) { described_class.find(1913) }

      it "returns instances of BunqRb::MonetaryAccount" do
        expect(item.monetary_account).to be_instance_of(BunqRb::MonetaryAccount)
      end
    end
  end
end
