require "spec_helper"

describe BunqRb::Device, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"
end
