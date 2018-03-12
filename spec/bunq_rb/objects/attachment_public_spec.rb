require "spec_helper"

RSpec.describe BunqRb::AttachmentPublic do
  describe "POST /v1/attachment-public", active_session: true do
    it "returns an :uuid" do
      attachment_public = described_class.create({})
      expect(attachment_public.uuid).to eq("5a442b1d-3d43-4285-b532-dbb21055824a")
    end
  end

  describe "GET /v1/attachment-public/:id", active_session: true do
    it "returns an :id" do
      attachment_public = described_class.find("b07faaa7-003a-4cdf-a2c1-434e71d42fca")
      expect(attachment_public.uuid).to eq("b07faaa7-003a-4cdf-a2c1-434e71d42fca")
    end
  end
end
