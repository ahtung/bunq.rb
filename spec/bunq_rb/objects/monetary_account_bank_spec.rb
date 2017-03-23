require "spec_helper"

RSpec.describe BunqRb::MonetaryAccountBank, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"
  it_behaves_like "post"
  it_behaves_like "put"

  describe "#" do
    describe "user" do
      let(:user) { BunqRb::User.find(1913) }
      let(:item) { described_class.find(1913) }

      it "returns instances of BunqRb::User" do
        item.user_id = user.id
        expect(item.user).to be_instance_of(BunqRb::User)
      end
    end
  end
end
