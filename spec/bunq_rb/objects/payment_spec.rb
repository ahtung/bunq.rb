require "spec_helper"

RSpec.describe BunqRb::Payment, active_session: true do
  it_behaves_like "list", [1, 42]
end
