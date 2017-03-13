require "spec_helper"

describe BunqRb::DeviceServer do
  let(:key) { OpenSSL::PKey::RSA.new 2048 }
  let(:installation) { BunqRb::Installation.create(client_public_key: key.public_key) }

  describe 'POST /v1/device-server' do

    before do
      VCR.insert_cassette 'post_v1_device-server', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    before :each do
      @response = described_class.create(
        "description": "Mainframe23 in Amsterdam",
        "secret": "e359370ebb0cf7e6923014aa8bee1f7df67245e3bfcb557faea0fee6e27192e1",
        "permitted_ips": [{}]
      )
    end

    it 'returns an :id object' do
      expect(@response.id).to be('')
    end
  end
end
