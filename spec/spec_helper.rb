require "simplecov"
SimpleCov.start

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bunq_rb"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = "random"

  config.before(:each, active_session: true) do
    BunqRb.configure do |bunqrb_config|
      bunqrb_config.api_key = ENV.fetch("API_KEY")
      bunqrb_config.key = OpenSSL::PKey::RSA.new 2048
    end

    @installation, @token, @server_public_key = BunqRb::Installation.create(
      client_public_key: BunqRb.configuration.key.public_key
    )

    BunqRb.configuration.session_token = @token["token"]

    _device_server = BunqRb::DeviceServer.create(
      description: "Dunya",
      secret: BunqRb.configuration.api_key,
      permitted_ips: []
    )

    _session_server, @token, _something = BunqRb::SessionServer.create(
      secret: BunqRb.configuration.api_key
    )

    BunqRb.configuration.session_token = @token["token"]
  end
end
