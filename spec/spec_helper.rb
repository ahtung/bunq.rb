require "coveralls"
Coveralls.wear!

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bunq_rb"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = "random"

  config.before(:each, active_session: true) do
    BunqRb.configure do |bunqrb_config|
      bunqrb_config.api_key = "c08bbdb62e1d1795ae7e933bc833452fda9c317b4b9d717baeabbc17f8190df9"
      bunqrb_config.key = OpenSSL::PKey::RSA.new 2048
      bunqrb_config.url = "https://sandbox.public.api.bunq.com"
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
