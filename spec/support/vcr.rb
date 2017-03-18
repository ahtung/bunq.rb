# require "vcr"
#
# VCR.configure do |config|
#   config.hook_into :webmock
#   config.cassette_library_dir = "spec/fixtures/cassettes"
#   config.default_cassette_options = { record: :new_episodes }
#   config.around_http_request do |request|
#     VCR.use_cassette(get_cassette_path(request), &request)
#   end
#
#   def get_cassette_path(request)
#     return "v1/installation" if request.uri =~ /v1\/installation/
#     return "v1/device-server" if request.uri =~ /v1\/device-server/
#     return "v1/session-server" if request.uri =~ /v1\/session-server/
#     return "v1/installation-server-public-key" if request.uri =~ /v1\/installation\/.*\/server-public-key/
#     return "v1/user-credential-password-ip-ip" if request.uri =~ /v1\/user\/.*\/credential-password-ip\/.*\/ip/
#     return "v1/user-monetary-account" if request.uri =~ /v1\/user\/.*\/monetary-account/
#   end
# end
