require "spec_helper"

RSpec.describe BunqRb::Installation do
  describe "POST /v1/installation", vcr: true do
    let(:key) { OpenSSL::PKey::RSA.new 2048 }
    let(:results) { described_class.create(client_public_key: key.public_key) }
    let(:installation) { results[0] }
    let(:token) { results[1] }
    let(:server_public_key) { results[2] }

    it "returns an :id" do
      expect(installation.id).to be(5623)
    end

    it "returns a :token object" do
      expect(token).not_to be_nil
    end

    it "returns a :server_public_key object" do
      expect(server_public_key).not_to be_nil
    end
  end

  describe "GET /v1/installation/:id", valid_session: true, vcr: true do
    it "returns an :id" do
      described_class.find(5448)
      expect(object.id).to be(12)
    end
  end

  describe "GET /v1/installation", valid_session: true, vcr: true do
    it "returns an array of :id's" do
      described_class.all
      expect(object.first.id).to be(12)
    end
  end
end
