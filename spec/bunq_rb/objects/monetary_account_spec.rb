require "spec_helper"

RSpec.describe BunqRb::MonetaryAccount, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"
end
