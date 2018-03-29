require "spec_helper"

describe BunqRb::ExportAnnualOverviewContent, active_session: true, skip: true do
  it_behaves_like "list", [1, 24]
end
