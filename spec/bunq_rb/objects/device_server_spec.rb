require "spec_helper"

describe BunqRb::DeviceServer, active_session: true do
  it_behaves_like "get", [42]
  it_behaves_like "list"
  it_behaves_like "post", {
    description: "Mainframe23 in Amsterdam",
    secret: "secret",
    permitted_ips: []
  }
end
