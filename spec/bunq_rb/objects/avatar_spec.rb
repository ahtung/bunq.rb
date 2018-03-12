require "spec_helper"

RSpec.describe BunqRb::Avatar do
  describe "POST /v1/avatar", active_session: true do
    it "returns an :id" do
      avatar = described_class.create({})
      expect(avatar.uuid).to eq("2c7935a6-1e58-4daf-8cdb-41874e9f1a71")
    end
  end

  describe "GET /v1/avatar/:id", active_session: true do
    it "returns an :id" do
      avatar = described_class.find("2c7935a6-1e58-4daf-8cdb-41874e9f1a71")
      expect(avatar.uuid).to eq("2c7935a6-1e58-4daf-8cdb-41874e9f1a71")
    end
  end
end
