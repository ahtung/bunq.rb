require "spec_helper"

describe BunqRb::Client do
  describe "." do
    describe "connection" do
      it "returns a Faraday::Connection object" do
        BunqRb.configure do |bunqrb_config|
          bunqrb_config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
          bunqrb_config.key = OpenSSL::PKey::RSA.new 2048
          bunqrb_config.url = "https://sandbox.public.api.bunq.com"
        end
        
        expect(described_class.connection).to be_instance_of(Faraday::Connection)
      end
    end
  end
end
