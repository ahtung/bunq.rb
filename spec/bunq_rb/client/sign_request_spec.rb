require "spec_helper"

describe SignRequest do
  before do
    VCR.insert_cassette 'post_v1_payment', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  xit 'should sign outgoing requests' do
    response = BunqRb::Client.connection.post('/v1/user/126/monetary-account/222/payment', {
      amount: {
        value: "12.50",
        currency: "EUR"
      },
      counterparty_alias: {
        type: "EMAIL",
        value: "bravo@bunq.com"
      },
      description: "Payment for drinks."
    }) do |request|
      request.headers["User-Agent"] = "bunq-TestServer/1.00 sandbox/0.17b3"
      request.headers["X-Bunq-Client-Authentication"] = "f15f1bbe1feba25efb00802fa127042b54101c8ec0a524c36464f5bb143d3b8b"
      request.headers["X-Bunq-Client-Request-Id"] = "57061b04b67ef"
      request.headers["X-Bunq-Geolocation"] = "en_US"
      request.headers["X-Bunq-Language"] = "en_US"
      request.headers["X-Bunq-Region"] = "en_US"
    end
    expect(response.headers['X-Bunq-Client-Signature']).to eq("ee9sDfzEhQ2L6Rquyh2XmJyNWdSBOBo6Z2eUYuM4bAOBCn9N5vjs6k6RROpagxXFXdGI9sT15tYCaLe5FS9aciIuJmrVW/SZCDWq/nOvSThi7+BwD9JFdG7zfR4afC8qfVABmjuMrtjaUFSrthyHS/5wEuDuax9qUZn6sVXcgZEq49hy4yHrV8257I4sSQIHRmgds4BXcGhPp266Z6pxjzAJbfyzt5JgJ8/suxgKvm/nYhnOfsgIIYCgcyh4DRrQltohiSon6x1ZsRIfQnCDlDDghaIxbryLfinT5Y4eU1eiCkFB4D69S4HbFXYyAxlqtX2W6Tvax6rIM2MMPNOh4Q==")
  end
end
