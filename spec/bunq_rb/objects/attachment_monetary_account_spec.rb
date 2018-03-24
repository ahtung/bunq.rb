require "spec_helper"

RSpec.describe BunqRb::AttachmentMonetaryAccount, active_session: true do
  describe "POST /v1/user/1/monetary-account/11/attachment" do
    it "returns an :id" do
      attachment_public = described_class.create({})
      expect(attachment_public[0].id).to eq(75)
    end
  end
end
