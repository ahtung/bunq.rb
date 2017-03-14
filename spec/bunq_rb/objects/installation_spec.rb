require "spec_helper"

RSpec.describe BunqRb::Installation do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }
  let(:results) { described_class.create(client_public_key: key.public_key) }
  let(:installation) { results[0] }
  let(:token) { results[1] }
  let(:server_public_key) { results[2] }

  describe "POST /v1/installation" do
    before do
      VCR.insert_cassette "post_v1_installation", record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

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

  describe "GET /v1/installation/:id" do
    before :each do
      BunqRb.configure do |config|
        config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
        config.key = key
      end
    end

    before do
      VCR.insert_cassette "get_v1_installation", record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "returns an :id" do
      BunqRb.configuration.session_token = token["token"]
      described_class.find(5448)
      expect(object.id).to be(12)
    end
  end
end
