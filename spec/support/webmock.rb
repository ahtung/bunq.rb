require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

    # INVOICE
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/invoice").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_invoices_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/invoice?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/invoice/42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_invoice.json"))

    # CARD NAME
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/card-name").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_card_name_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/card-name?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # REQUEST RESPONSE
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/request-response").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_request_response_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/request-response?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/request-response/42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_request_response.json"))

    # BUNQ ME TAB
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/42/bunqme-tab").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_bunq_me_tabs_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/42/bunqme-tab?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # Attachment Monetary Account
    ## POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/1933/attachment").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/post_monetary_account.json"))

    # CARD
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/card").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_cards_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/card?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/card/11").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_card.json"))

    # PAYMENT
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/42/payment").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_payments_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/42/payment?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # TAB USAGE SINGLE
    ## POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/user/3/monetary-account/12/cash-register/25/tab-usage-single").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/post_tab_usage_single.json"))
    stub_request(:put, "https://sandbox.public.api.bunq.com/v1/user/3/monetary-account/12/cash-register/25/tab-usage-single/5a442b1d-3d43-4285-b532-dbb21055824a").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/update_tab_usage_single.json"))

    # USER
    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1")
      .to_return(status: 200, body: File.new("spec/support/mocks/v1/get_user.json"))
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_users_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user?older_id=1").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # DEVICE SERVER
    ## GET
    stub_request(:get, /https:\/\/sandbox.public.api.bunq.com\/v1\/device\/.*/).
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_device.json"))
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_devices.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device?older_id=2348").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # AVATAR
    ## POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/avatar").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/post_avatar.json"))
    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/avatar/2c7935a6-1e58-4daf-8cdb-41874e9f1a71").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_avatar.json"))

    # ATTACHMENT PUBLIC
    ## POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/attachment-public").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/post_attachment_public.json"))
    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/attachment-public/b07faaa7-003a-4cdf-a2c1-434e71d42fca").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_attachment_public.json"))

    # CASH REGISTER
    ## POST
    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/11/cash-register").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/post_cash_register.json"))

    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account/42/cash-register/42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_cash_register.json"))

    # PERMITTED IP
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/credential-password-ip/42/ip").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_permitted_ips_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/credential-password-ip/42/ip?older_id=927").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    ## GET
    stub_request(:put, /https:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/credential-password-ip\/.*\/ip\/.*/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 927
            }
          }
        ]
      }.to_json, headers: {})
    # PermittedIp GET
    stub_request(:get, /https:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/credential-password-ip\/.*\/ip\/.*/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "PermittedIp" => {
              "id" => 927,
              "created" => "2017-03-18 12:56:56.046564",
              "updated" => "2017-03-18 12:56:56.046564",
              "ip" => "82.68.23.42",
              "status" => "ACTIVE"
            }
          }
        ]
      }.to_json, headers: {})

    # PermittedIp POST
    stub_request(:post, /https:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/credential-password-ip\/.*\/ip/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 927
            }
          }
        ]
      }.to_json, headers: {})
    # INSTALLATION
    ## GET
    stub_request(:get, /https:\/\/sandbox.public.api.bunq.com\/v1\/installation\/.*/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 12
            }
          }
        ]
      }.to_json, headers: {})
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/installation").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_installation.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/installation?older_id=12").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/installation")
      .to_return(status: 200, body: {
        "Response" => [
          {
            "Id" => {
              "id" => 61
            }
          },
          {
            "Token" => {
              "id" => 134,
              "created" => "2015-06-13 23:19:16.215235",
              "updated" => "2015-06-30 09:12:31.981573",
              "token" => "a4f9d888eea84f52722b9baf2f17c289d549edf6e0eccdbf868eb922be306fb6"
            }
          },
          {
            "ServerPublicKey" => {
              "server_public_key" => "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2cKx+z2NbEapmQWvvov2\nn0k699ZJmWn1yZulOfVeSfHKdGAVj4TlWwAJuvFmThgtHTp+PiJUxKsNUrHHcp+A\nCY0mVH+6f19roBH/B4IS7H5fnXMnpf39IfPDw+hv17bKE+dnuhPuEcloG+LgEOgo\ncjwEb18h5IR3dfbxBHXUce2i4wqfGakAzHumJbPb5XgMMYxng+fqV7uH34CpRpS0\n4bzjuvkwMlRWQsIMUuOvcAjRoCMf1aViFd2+4sEm7RFlyux5PKkq72F\/GITirzlA\nT7T22qrApKnZNPR9y0pGC13FFdx5lVszBNnsKyXDwqrzOsUONSFU+F6JRg6xqUoC\niQIDAQAB\n-----END PUBLIC KEY-----\n"
            }
          }
        ]
      }.to_json)
    # MONETARY ACCOUNT
    ## LIST
    stub_request(:post, /https:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/monetary-account\/.*\/request-inquiry/).
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_request_inquiries.json"))
    ## GET
    stub_request(:get, /https:\/\/sandbox.public.api.bunq.com\/v1\/user\/.*\/monetary-account\/.*\/request-inquiry\/.*/).
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
    stub_request(:get, /https:\/\/sandbox.public.api.bunq.com\/v1\/installation\/.*\/server-public-key/).
      to_return(status: 200, body: {
        "Response" => [
          {
            "ServerPublicKey" => {
              "server_public_key" => "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2cKx+z2NbEapmQWvvov2\nn0k699ZJmWn1yZulOfVeSfHKdGAVj4TlWwAJuvFmThgtHTp+PiJUxKsNUrHHcp+A\nCY0mVH+6f19roBH/B4IS7H5fnXMnpf39IfPDw+hv17bKE+dnuhPuEcloG+LgEOgo\ncjwEb18h5IR3dfbxBHXUce2i4wqfGakAzHumJbPb5XgMMYxng+fqV7uH34CpRpS0\n4bzjuvkwMlRWQsIMUuOvcAjRoCMf1aViFd2+4sEm7RFlyux5PKkq72F\/GITirzlA\nT7T22qrApKnZNPR9y0pGC13FFdx5lVszBNnsKyXDwqrzOsUONSFU+F6JRg6xqUoC\niQIDAQAB\n-----END PUBLIC KEY-----\n"
            }
          }
        ]
      }.to_json, headers: {})

    # MONETARY ACCOUNT BANK
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account-bank").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_monetary_account_banks_page_1.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/user/1/monetary-account-bank?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    # DEVICE SERVER
    ## LIST
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device-server").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_device_servers.json"))
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device-server?older_id=42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/list_page_2.json"))

    ## GET
    stub_request(:get, "https://sandbox.public.api.bunq.com/v1/device-server/42").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/get_device_server.json"))

    ## POST
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

    stub_request(:post, "https://sandbox.public.api.bunq.com/v1/session-server").
      to_return(status: 200, body: {
"Response" => [
{
"Id" => {
"id" => 16
}
},
{
"Token" => {
"id" => 839,
"token" => "b165cce82bbd229b55962f90b4efedd706b3f616f0de831547ff62262f2924e3"
}
},
{
"UserCompany" => {
"id" => 42,
"created" => "2015-06-13 23:19:16.215235",
"updated" => "2015-06-30 09:12:31.981573",
"public_uuid" => "252e-fb1e-04b74214-b9e9467c3-c6d2fbf",
"name" => "bunq",
"display_name" => "bunq",
"public_nick_name" => "bunq",
"alias" => [
{
"type" => "EMAIL",
"value" => "bravo@bunq.com",
"name" => ""
}
],
"chamber_of_commerce_number" => "NL040492904",
"type_of_business_entity" => "One man business",
"sector_of_industry" => "Education",
"counter_bank_iban" => "NL12BUNQ1234567890",
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
"address_main" => {
"street" => "Example Boulevard",
"house_number" => "123a",
"po_box" => "09392",
"postal_code" => "1234AA",
"city" => "Amsterdam",
"country" => "NL"
},
"address_postal" => {
"street" => "Example Boulevard",
"house_number" => "123a",
"po_box" => "09392",
"postal_code" => "1234AA",
"city" => "Amsterdam",
        "country" => "NL"
        },
        "version_terms_of_service" => "1.2",
        "director_alias" => {
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
        "language" => "en_US",
        "region" => "en_US",
        "ubo" => [
        {
        "name" => "A. Person",
        "date_of_birth" => "1990-03-27",
        "nationality" => "NL"
        }
              ],
              "status" => "ACTIVE",
              "sub_status" => "APPROVAL",
              "session_timeout" => 1,
              "daily_limit_without_confirmation_login" => {
              "value" => "12.50",
              "currency" => "EUR"
            },
            "notification_filters" => [
              {
                "notification_delivery_method" => "URL",
                "notification_target" => "https://my.company.com/callback-url",
                "category" => "PAYMENT"
              }
            ]
          }
        }
      ]
    }.to_json, headers: {})
  end
end
