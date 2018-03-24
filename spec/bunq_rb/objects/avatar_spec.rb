require "spec_helper"

RSpec.describe BunqRb::Avatar, active_session: true do
  it_behaves_like "get", ["2c7935a6-1e58-4daf-8cdb-41874e9f1a71"]
  it_behaves_like "post", {}
end
