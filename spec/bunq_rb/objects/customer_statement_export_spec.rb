require "spec_helper"

describe BunqRb::CustomerStatementExport, active_session: true do
  it_behaves_like "get", [1, 11, 42]
  it_behaves_like "list", [1, 11]
  it_behaves_like "delete", [1, 11, 42]
end
