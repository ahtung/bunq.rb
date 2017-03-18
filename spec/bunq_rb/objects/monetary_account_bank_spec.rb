require "spec_helper"

RSpec.describe BunqRb::MonetaryAccountBank, active_session: true do
  it_behaves_like "get"
  it_behaves_like "list"
  # it_behaves_like "post"
  # it_behaves_like "put"
end
