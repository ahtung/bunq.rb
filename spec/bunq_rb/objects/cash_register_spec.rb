require "spec_helper"

describe BunqRb::CashRegister, active_session: true do
  it_behaves_like "get", [1, 42, 42]

  let(:user_id) { 1 }
  let(:monetary_account_id) { 11 }

  describe "POST /v1/user/:user_id/monetary-account/:monetary_account_id/cash-register" do
    it "returns a BunqRb::CashRegister" do
      response = described_class.create({
        name: "Kassa 12",
        status: "PENDING_APPROVAL",
        avatar_uuid: "5a442bed-3d43-4a85-b532-dbb251052f4a"
      }, user_id, monetary_account_id)
      expect(response["id"]).not_to be_nil
    end
  end
end
