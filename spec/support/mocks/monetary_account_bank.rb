RSpec.configure do |config|
  config.before(:each) do
    stub_request(:put, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/?monetary-account-bank\z/)
      .to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" =>2800
            }
          }
        ]
      }.to_json, headers: {})

    stub_request(:get, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/?monetary-account-bank\z/)
      .to_return(status: 200, body: {
        "Response" => [
          {
          "MonetaryAccountBank" => {
          "id" => 1933,
          "created" => "2016-03-15 01:11:13.101139",
          "updated" => "2016-03-15 01:11:13.101139",
          "alias" => [
          {
          "type" => "PHONE_NUMBER",
          "value" => "+31682890601",
          "name" => "+31682890601"
          },
          {
          "type" => "EMAIL",
          "value" => "bell-vof@bunq.nl",
          "name" => "bell-vof@bunq.nl"
          },
          {
          "type" => "IBAN",
          "value" => "NL05BUNQ9900019407",
          "name" => "Stevens B.V."
          }
          ],
          "avatar" => {
          "uuid" => "791c2995-85f8-4306-b92a-edc1ac2ba46f",
          "image" => [
          {
          "attachment_public_uuid" => "52a45442-3dc0-41fb-801a-2511475613d2",
          "height" => 1024,
          "width" => 1024,
          "content_type" => "image/png"
          }
          ],
          "anchor_uuid" => "fb029135-8f58-4347-83cc-689e81d7daf5"
          },
          "balance" => {
          "currency" => "EUR",
          "value" => "2471.8"
          },
          "country" => "NL",
          "currency" => "EUR",
          "daily_limit" => {
          "currency" => "EUR",
          "value" => "1000"
          },
          "daily_spent" => {
          "currency" => "EUR",
          "value" => "1"
          },
          "description" => "bunq account",
          "public_uuid" => "fb029135-8f58-4347-83cc-689e81d7daf5",
          "status" => "ACTIVE",
          "sub_status" => "NONE",
          "timezone" => "europe/amsterdam",
          "user_id" => 1913,
          "monetary_account_profile" => {
          "profile_fill" => nil,
          "profile_drain" => nil,
          "profile_action_required" => "NO_ACTION_NEEDED",
          "profile_amount_required" => {
          "currency" => "EUR",
          "value" => "0"
          }
          },
          "notification_filters" => [
          ],
          "setting" => {
          "color" => "#54C7FC",
          "default_avatar_status" => "AVATAR_DEFAULT",
          "restriction_chat" => "ALLOW_INCOMING"
          },
          "overdraft_limit" => {
          "currency" => "EUR",
          "value" => "0"
          }
          }
          }
          ]
      }.to_json, headers: {})

    stub_request(:get, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/?monetary-account-bank\/.*\z/)
      .to_return(status: 200, body: {
        "Response" => [
          {
          "MonetaryAccountBank" => {
          "id" => 1933,
          "created" => "2016-03-15 01:11:13.101139",
          "updated" => "2016-03-15 01:11:13.101139",
          "alias" => [
          {
          "type" => "PHONE_NUMBER",
          "value" => "+31682890601",
          "name" => "+31682890601"
          },
          {
          "type" => "EMAIL",
          "value" => "bell-vof@bunq.nl",
          "name" => "bell-vof@bunq.nl"
          },
          {
          "type" => "IBAN",
          "value" => "NL05BUNQ9900019407",
          "name" => "Stevens B.V."
          }
          ],
          "avatar" => {
          "uuid" => "791c2995-85f8-4306-b92a-edc1ac2ba46f",
          "image" => [
          {
          "attachment_public_uuid" => "52a45442-3dc0-41fb-801a-2511475613d2",
          "height" => 1024,
          "width" => 1024,
          "content_type" => "image/png"
          }
          ],
          "anchor_uuid" => "fb029135-8f58-4347-83cc-689e81d7daf5"
          },
          "balance" => {
          "currency" => "EUR",
          "value" => "2471.8"
          },
          "country" => "NL",
          "currency" => "EUR",
          "daily_limit" => {
          "currency" => "EUR",
          "value" => "1000"
          },
          "daily_spent" => {
          "currency" => "EUR",
          "value" => "1"
          },
          "description" => "bunq account",
          "public_uuid" => "fb029135-8f58-4347-83cc-689e81d7daf5",
          "status" => "ACTIVE",
          "sub_status" => "NONE",
          "timezone" => "europe/amsterdam",
          "user_id" => 1913,
          "monetary_account_profile" => {
          "profile_fill" => nil,
          "profile_drain" => nil,
          "profile_action_required" => "NO_ACTION_NEEDED",
          "profile_amount_required" => {
          "currency" => "EUR",
          "value" => "0"
          }
          },
          "notification_filters" => [
          ],
          "setting" => {
          "color" => "#54C7FC",
          "default_avatar_status" => "AVATAR_DEFAULT",
          "restriction_chat" => "ALLOW_INCOMING"
          },
          "overdraft_limit" => {
          "currency" => "EUR",
          "value" => "0"
          }
          }
          }
          ]
      }.to_json, headers: {})

    stub_request(:post, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*monetary-account-bank\z/)
      .to_return(status: 200, body: {
        "Response" => [
        {
        "MonetaryAccountBank" => {
        "id" => 42,
        "created" => "2015-06-13 23:19:16.215235",
        "updated" => "2015-06-30 09:12:31.981573",
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
        "currency" => "EUR",
        "description" => "Mary's savings",
        "daily_limit" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "daily_spent" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "overdraft_limit" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "balance" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "alias" => [
        {
        "type" => "EMAIL",
        "value" => "bravo@bunq.com",
        "name" => ""
        }
        ],
        "public_uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
        "status" => "CANCELLED",
        "sub_status" => "PERMANENT",
        "reason" => "OTHER",
        "reason_description" => "I am done saving.",
        "user_id" => 1,
        "monetary_account_profile" => {
        "profile_fill" => {
        "status" => "ACTIVE",
        "balance_preferred" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "balance_threshold_low" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "method_fill" => "IDEAL",
        "issuer" => {
        "bic" => "INGBNL2A",
        "name" => "ING Bank"
        }
        },
        "profile_drain" => {
        "status" => "ACTIVE",
        "balance_preferred" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "balance_threshold_high" => {
        "value" => "12.50",
        "currency" => "EUR"
        },
        "savings_account_alias" => {
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
        }
        }
        },
        "notification_filters" => [
        {
        "notification_delivery_method" => "URL",
        "notification_target" => "https://my.company.com/callback-url",
        "category" => "PAYMENT"
        }
        ],
        "setting" => {
        "color" => "#FF0024",
        "default_avatar_status" => "AVATAR_DEFAULT",
        "restriction_chat" => "ALLOW_INCOMING"
        }
        }
        }
        ]
      }.to_json, headers: {})
  end
end
