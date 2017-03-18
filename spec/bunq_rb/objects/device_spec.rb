require "spec_helper"

describe BunqRb::Device, active_session: true do
  describe "GET /v1/device/:id" do
    before :each do
      @response = described_class.find(43)
    end

    it "returns an :id object" do
      expect(@response.id).not_to be_nil
    end
  end

  describe "GET /v1/device/" do
    before :each do
      @response = described_class.all
    end

    it "returns an :id object" do
      expect(@response.count).not_to eq(0)
    end
  end
end
