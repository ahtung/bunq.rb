require "spec_helper"

describe BunqRb::Card, active_session: true do
  it_behaves_like "get", [1913, 11]
  it_behaves_like "list", [1913]
  # it_behaves_like "put", {
  #   pin_code: "0461",
  # }
end
