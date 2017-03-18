require "spec_helper"

RSpec.describe BunqRb::MonetaryAccount, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"

  describe "#" do
    describe "user" do
      let(:item) { described_class.find(1913) }

      it "returns instances of BunqRb::User" do
        expect(item.user).to be_instance_of(BunqRb::User)
      end
    end
  end
end
