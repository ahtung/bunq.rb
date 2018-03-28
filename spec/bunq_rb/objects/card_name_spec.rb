require "spec_helper"

describe BunqRb::CardName, active_session: true do
  it_behaves_like "list", [1]
end
