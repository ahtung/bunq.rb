require "spec_helper"

RSpec.describe BunqRb::AttachmentPublic, active_session: true do
  it_behaves_like "get", ["b07faaa7-003a-4cdf-a2c1-434e71d42fca"]
  it_behaves_like "post", {}
end
