require "spec_helper"

describe BunqRb::Client do
  describe "." do
    describe "connection" do
      it "returns a Faraday::Connection object" do
        expect(described_class.connection).to be_instance_of(Faraday::Connection)
      end
    end
  end
end
