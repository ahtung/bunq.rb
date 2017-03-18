RSpec.configure do |config|
  config.before(:each) do
    # DeviceServer LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device-server")
      .to_return(status: 200, body: {
        "Response" => [
          {
            "DeviceServer" => {
              "id" => 2348,
              "created" => "2017-03-15 01:11:16.865607",
              "updated" => "2017-03-15 01:11:16.865607",
              "ip" => "10.8.0.51",
              "description" => "Generated device",
              "status" => "ACTIVE"
            }
          }
        ],
        "Pagination" => {
          "future_url" => "/v1/device-server?newer_id=2348",
          "newer_url" => nil,
          "older_url" => nil
        }
      }.to_json, headers: {})

    # DeviceServer GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device-server/1913")
      .to_return(status: 200, body: {
        "Response" => [
          {
            "DeviceServer" => {
              "id" => 2348,
              "created" => "2017-03-15 01:11:16.865607",
              "updated" => "2017-03-15 01:11:16.865607",
              "ip" => "10.8.0.51",
              "description" => "Generated device",
              "status" => "ACTIVE"
            }
          }
        ]
      }.to_json, headers: {})

    # DeviceServer POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/device-server").
      to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 11
            }
          }
        ]
      }.to_json, headers: {})
  end
end
