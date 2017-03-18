require "spec_helper"

RSpec.describe BunqRb::MonetaryAccount do
  it_behaves_like "get"
  it_behaves_like "list"
end
