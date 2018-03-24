require "spec_helper"

RSpec.describe BunqRb::Schedule, active_session: true do
  it_behaves_like "get", [1, 11, 42]
  it_behaves_like "list", [1, 11]
end
