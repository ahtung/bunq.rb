require "spec_helper"

describe BunqRb::Installation do
  describe 'POST /v1/installation' do
    let(:key) { OpenSSL::PKey::RSA.new 2048 }
    let(:object) { described_class.create(client_public_key: key.public_key) }

    before do
      VCR.insert_cassette 'post_v1_installation', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns an :id' do
      expect(object.id).to be(5623)
    end

    xit 'returns a :token object' do
      expect(described_class.token).not_to be_nil
    end

    xit 'returns a :server_public_key object' do
      expect(described_class.server_public_key).not_to be_nil
    end
  end

  describe 'GET /v1/installation/:id' do
    let(:token) { 'TEST' }

    before do
      VCR.insert_cassette 'get_v1_installation', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    xit 'returns an :id' do
      described_class.token = token
      described_class.find(5448)
      expect(object.id).to be(12)
    end
  end
end
