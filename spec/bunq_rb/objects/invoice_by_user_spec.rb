require "spec_helper"

describe BunqRb::InvoiceByUser, active_session: true do
  it_behaves_like "get", [1, 42]
  it_behaves_like "list", [1]
end
