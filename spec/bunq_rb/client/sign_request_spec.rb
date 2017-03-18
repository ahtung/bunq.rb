require "spec_helper"

RSpec.describe SignRequest do
  let(:middleware) { described_class.new(lambda { |env| env }) }

  before :each do
    BunqRb.configure do |bunqrb_config|
      bunqrb_config.api_key = "key"
      bunqrb_config.key = OpenSSL::PKey::RSA.new 2048
    end
  end

  def process(method, url, body)
    env = { body: body, request_headers: Faraday::Utils::Headers.new, method: method, url: url }
    middleware.call(env)
  end

  def request_headers()
    result[:request_headers]
  end

  context "sing? = true" do
    let(:result) { process(:get, "v1/installation", {}) }

    it "include 'X-Bunq-Client-Signature' header" do
      expect(request_headers["X-Bunq-Client-Signature"]).not_to be_nil
    end
  end

  context "sing? = false" do
    let(:result) { process(:post, "v1/installation", {}) }

    it "not include 'X-Bunq-Client-Signature' header" do
      expect(request_headers["X-Bunq-Client-Signature"]).to be_nil
    end
  end
end
