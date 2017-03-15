require "spec_helper"

describe SignRequest, active_session: true do
  let(:response) { BunqRb::Client.connection.post("/v1/installation", client_public_key: OpenSSL::PKey::RSA.new(2048).public_key) }

  xit "should sign outgoing requests" do
    expect(response.headers["X-Bunq-Client-Signature"]).to eq(
      "ee9sDfzEhQ2L6Rquyh2XmJyNWdSBOBo6Z2eUYuM4bAOBCn9N5vjs6k6RROpagxXFXdGI9sT15tYCaLe5FS9aciIuJmrVW/SZCDWq/nOvSThi7+BwD9JFdG7zfR4afC8qfVABmjuMrtjaU"\
      "FSrthyHS/5wEuDuax9qUZn6sVXcgZEq49hy4yHrV8257I4sSQIHRmgds4BXcGhPp266Z6pxjzAJbfyzt5JgJ8/suxgKvm/nYhnOfsgIIYCgcyh4DRrQltohiSon6x1ZsRIfQnCDlDDgha"\
      "IxbryLfinT5Y4eU1eiCkFB4D69S4HbFXYyAxlqtX2W6Tvax6rIM2MMPNOh4Q=="
    )
  end
end
