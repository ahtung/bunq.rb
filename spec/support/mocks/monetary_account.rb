RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*monetary-account\/.*\z/).
      to_return(status: 200, body: {
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

    stub_request(:get, /\Ahttps:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*monetary-account\z/).
      to_return(status: 200, body: {
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
        "value" => "2472.8"
        },
        "country" => "NL",
        "currency" => "EUR",
        "daily_limit" => {
        "currency" => "EUR",
        "value" => "1000"
        },
        "daily_spent" => {
        "currency" => "EUR",
        "value" => "0"
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
        ],
        "Pagination" => {
        "future_url" => nil,
        "newer_url" => nil,
        "older_url" => nil
        }

      }.to_json, headers: {})
  end
end
