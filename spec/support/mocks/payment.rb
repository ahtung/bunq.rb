RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/user/monetary-account/payment")
      .to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 2800
            }
          }
        ]
      }.to_json, headers: {})

    stub_request(:put, "https://sandbox.public.api.bunq.com/v1/user/monetary-account/payment")
      .to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 29
            }
          }
        ]
      }.to_json, headers: {})
  end
end
