RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/?monetary-account\/.*\/?request-inquiry\/?\z/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 7
            }
          }
        ]
      }.to_json, headers: {})

    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1913/monetary-account/1933/request-inquiry").
      to_return(status: 200, body: {
        "Response" => [
          {
            "RequestInquiry" => {
              "id" => 42,
              "created" => "2015-06-13 23:19:16.215235",
              "updated" => "2015-06-30 09:12:31.981573",
              "time_responded" => "2015-06-30 09:12:31.981573",
              "time_expiry" => "2015-06-30 09:12:31.981573",
              "monetary_account_id" => 11,
              "amount_inquired" => {
                "value" => "12.50",
                "currency" => "EUR"
              },
              "amount_responded" => {
                "value" => "12.50",
                "currency" => "EUR"
              },
              "user_alias_created" => {
                "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
                "avatar" => {
                  "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
                  "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
                  "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "user_alias_revoked" => {
            "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "counterparty_alias" => {
            "iban" => "NL12BUNQ0300065264",
            "display_name" => "Mary",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "label_user" => {
            "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "country" => "NL",
            "bunq_me" => {
            "type" => "EMAIL",
            "value" => "bravo@bunq.com",
            "name" => ""
            }
            },
            "description" => "Please pay for your candy.",
            "merchant_reference" => "ORDER123-BRANCH3-POS4",
            "attachment" => [
            {
            "id" => 4
            }
            ],
            "status" => "PENDING",
            "batch_id" => 13,
            "scheduled_id" => 219,
            "minimum_age" => 21,
            "require_address" => "BILLING_SHIPPING",
            "redirect_url" => "http://example.com/foo",
            "address_shipping" => {
            "street" => "Example Boulevard",
            "house_number" => "123a",
            "po_box" => "09392",
            "postal_code" => "1234AA",
            "city" => "Amsterdam",
            "country" => "NL"
            },
            "address_billing" => {
            "street" => "Example Boulevard",
            "house_number" => "123a",
            "po_box" => "09392",
            "postal_code" => "1234AA",
            "city" => "Amsterdam",
            "country" => "NL"
            },
            "geolocation" => {
            "latitude" => 53.2,
            "longitude" => 4.89,
            "altitude" => 12,
            "radius" => 100
            },
            "allow_chat" => false
            }
            }
            ]
      }.to_json, headers: {})

    stub_request(:get, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/monetary-account\/.*\/request-inquiry\/.*\z/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "RequestInquiry" => {
              "id" => 42,
              "created" => "2015-06-13 23:19:16.215235",
              "updated" => "2015-06-30 09:12:31.981573",
              "time_responded" => "2015-06-30 09:12:31.981573",
              "time_expiry" => "2015-06-30 09:12:31.981573",
              "monetary_account_id" => 11,
              "amount_inquired" => {
                "value" => "12.50",
                "currency" => "EUR"
              },
              "amount_responded" => {
                "value" => "12.50",
                "currency" => "EUR"
              },
              "user_alias_created" => {
                "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
                "avatar" => {
                  "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
                  "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
                  "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "user_alias_revoked" => {
            "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "counterparty_alias" => {
            "iban" => "NL12BUNQ0300065264",
            "display_name" => "Mary",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "label_user" => {
            "uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
            "avatar" => {
            "uuid" => "5a442bed-3d43-4a85-b532-dbb251052f4a",
            "anchor_uuid" => "f0de919f-8c36-46ee-acb7-ea9c35c1b231",
            "image" => [
            {
            "attachment_public_uuid" => "d93e07e3-d420-45e5-8684-fc0c09a63686",
            "content_type" => "image/jpeg",
            "height" => 380,
            "width" => 520
            }
            ]
            },
            "public_nick_name" => "Mary",
            "display_name" => "Mary",
            "country" => "NL"
            },
            "country" => "NL",
            "bunq_me" => {
            "type" => "EMAIL",
            "value" => "bravo@bunq.com",
            "name" => ""
            }
            },
            "description" => "Please pay for your candy.",
            "merchant_reference" => "ORDER123-BRANCH3-POS4",
            "attachment" => [
            {
            "id" => 4
            }
            ],
            "status" => "PENDING",
            "batch_id" => 13,
            "scheduled_id" => 219,
            "minimum_age" => 21,
            "require_address" => "BILLING_SHIPPING",
            "redirect_url" => "http://example.com/foo",
            "address_shipping" => {
            "street" => "Example Boulevard",
            "house_number" => "123a",
            "po_box" => "09392",
            "postal_code" => "1234AA",
            "city" => "Amsterdam",
            "country" => "NL"
            },
            "address_billing" => {
            "street" => "Example Boulevard",
            "house_number" => "123a",
            "po_box" => "09392",
            "postal_code" => "1234AA",
            "city" => "Amsterdam",
            "country" => "NL"
            },
            "geolocation" => {
            "latitude" => 53.2,
            "longitude" => 4.89,
            "altitude" => 12,
            "radius" => 100
            },
            "allow_chat" => false
            }
            }
            ]
      }.to_json, headers: {})
  end
end
