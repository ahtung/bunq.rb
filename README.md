# BunqRb

[![Build Status](https://travis-ci.org/ahtung/tink.rb.svg?branch=master)](https://travis-ci.org/ahtung/tink.rb)
[![Gem Version](https://badge.fury.io/rb/tink.rb.svg)](https://badge.fury.io/rb/tink.rb)
[![Maintainability](https://api.codeclimate.com/v1/badges/8e9c963093297534c4bb/maintainability)](https://codeclimate.com/github/ahtung/tink.rb/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/ahtung/tink.rb/badge.svg?branch=master)](https://coveralls.io/github/ahtung/tink.rb?branch=master)

- [Documentation](https://docs.tink.se/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bunq_rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bunq_rb

## Usage

First configure the gem

```
BunqRb.configure do |config|
  config.api_key    = ENV.fetch("API_KEY")
  config.key        = key # OpenSSL::PKey::RSA.new 2048
  config.url        = "https://sandbox.public.api.bunq.com"
  config.page_size  = 200
end
```

## Quickstart

### Openning a session

https://github.com/ahtung/bunq_rb/blob/feature/readme/spec/scenarios/create_session_spec.rb

### Making apayment request

https://github.com/ahtung/bunq_rb/blob/feature/readme/spec/scenarios/make_a_payment_request_spec.rb

### Creating a tab payment

https://github.com/ahtung/bunq_rb/blob/feature/readme/spec/scenarios/creating_a_tab_payment_spec.rb

## Calls

### SETUP

#### Installation

##### POST

```ruby
installation, token, server_public_key = BunqRb::Installation.create(client_public_key: BunqRb.configuration.key.public_key)
```

##### GET

```ruby
installation = BunqRb::Installation.find(2348)
```

##### LIST

```ruby
installations = BunqRb::Installation.all
```

#### Installation server public key

##### LIST

```ruby
installation = BunqRb::Installation.find(2348)
server_public_key = installation.server_public_key
```

#### Device

##### GET

```ruby
device = BunqRb::Device.find(2348)
```

##### LIST

```ruby
devices = BunqRb::Device.all
```

#### Device server

##### POST

```ruby
device_server = BunqRb::DeviceServer.create(
  description: "Dunya",
  secret: BunqRb.configuration.api_key,
  permitted_ips: []
)
```

##### GET

```ruby
device_server = BunqRb::DeviceServer.find(1434035)
```

##### LIST

```ruby
device_servers = BunqRb::DeviceServer.all
```

#### Permitted IP

##### GET

```ruby
user_id = 1
credential_password_id = 11
permitted_ip_id = 42
device_servers = BunqRb::PermittedIp.find(user_id, credential_password_id, permitted_ip_id)
```

##### LIST


```ruby
user_id = 1
credential_password_id = 11
device_servers = BunqRb::PermittedIp.all(user_id, credential_password_id)
```

##### POST

TODO

##### PUT

#### User credential password IP

##### GET

TODO

##### LIST

TODO

#### Session

##### DELETE

TODO

#### SessionServer

##### POST

TODO

### PAYMENTS

#### Payment

##### POST

TODO

##### GET

TODO

##### LIST

```ruby
user = BunqRb::User.find(1)
monetary_account = user.monetary_accounts.first
payments = monetary_account.payments
```

#### Payment Batch

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

### REQUESTS

#### Request Inquiry

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Request Inquiry Batch

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Request Response

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### bunq.me Tab

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

```ruby
user_id = 1
monetary_account_id = 1933
bunq_me_tabs = BunqRb::BunqMeTab.all(user_id, monetary_account_id)

# OR

user = BunqRb::User.find(1)
monetary_accounts = user.monetary_accounts
bunq_me_tabs = monetary_accounts.first.bunq_me_tabs
```

### DRAFT PAYMENTS

#### Draft Payment

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

### SCHEDULED PAYMENTS

#### Schedule Payment

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

##### DELETE

TODO

#### Schedule Payment Batch

##### POST

TODO

##### PUT

TODO

##### DELETE

TODO

#### Schedule Instance

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Schedule

##### GET

TODO

##### LIST

TODO

#### Schedule User

##### LIST

TODO

### TAB PAYMENTS

#### Tab Usage Single

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

##### DELETE

TODO

#### Tab Usage Multiple

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

##### DELETE

TODO

#### Tab Item

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

##### DELETE

TODO

#### Tab Item Batch

##### POST

TODO

#### Tab

##### GET

TODO

##### LIST

TODO

#### Tab QR Code Content

##### LIST

TODO

#### Tab Result Inquiry

##### GET

TODO

##### LIST

TODO

#### Tab Result Response

##### GET

TODO

##### LIST

TODO

### CARD PAYMENTS

#### Mastercard Action

##### GET

TODO

##### LIST

TODO

### IDEAL PAYMENTS

#### Token QR Request Ideal

##### POST

TODO

### USER

#### User

##### GET

```ruby
user = BunqRb::User.find(1)
```

##### LIST

```ruby
users = BunqRb::User.all
```

#### User Person

##### PUT

TODO

##### GET

TODO

#### User Company

##### PUT

TODO

##### GET

TODO

### MONETARY ACCOUNTS

#### Monetary Account

##### GET

TODO

##### LIST

```ruby
user = BunqRb::User.find(1)
monetary_accounts = user.monetary_accounts
```

#### Monetary Account Bank

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

### CASH REGISTERS

#### Cash Register

##### POST

TODO

##### PUT

TODO

##### GET


```ruby
user_id = 1
monetary_account_id = 11
cash_register_id = 42
cash_registers = BunqRb::CashRegister.find(user_id, monetary_account_id, cash_register_id)
```

##### LIST

```ruby
user_id = 1
monetary_account_id = 11
cash_registers = BunqRb::CashRegister.all(user_id, monetary_account_id)
```

#### Cash Register QR Code

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Cash Register QR Code Content

##### LIST

TODO

### CONNECTS

#### Share Invite Bank Inquiry

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Share Invite Bank Response

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Share Invite Bank Amount Used

##### DELETE

TODO

#### Draft Share Invite Bank

##### POST

TODO

##### PUT

TODO

##### GET

TODO

##### LIST

TODO

#### Draft Share Invite Bank QR Code Content

##### LIST

TODO

### CARDS

#### Card

##### PUT

TODO

##### GET

```ruby
user_id = 1
card_id = 82082
card = BunqRb::Card.find(user_id, card_id)
```

##### LIST

```ruby
user_id = 1
cards = BunqRb::Card.all(user_id)

# OR

user = BunqRb::User.find(1)
cards = user.cards
```

#### Card Debit

##### POST

TODO

#### Card Name

##### LIST

```ruby
user_id = 1
cards = BunqRb::CardName.all(user_id)

# OR

user = BunqRb::User.find(1)
cards = user.card_names
```

#### Card Generated CVC2

##### POST

TODO

##### GET

TODO

##### LIST

TODO

### CHAT

#### Payment Chat

##### POST

TODO

##### PUT

TODO

##### LIST

TODO

#### Request Inquiry Chat

##### POST

TODO

##### PUT

TODO

##### LIST

TODO

#### Request Response Chat

##### POST

TODO

##### PUT

TODO

##### LIST

TODO

#### Chat Conversation

##### GET

TODO

##### LIST

TODO

#### Chat Message

##### LIST

TODO

#### Chat Message Attachment

##### POST

TODO

#### Chat Message Text

##### POST

TODO

### CALLBACKS

#### Certificate Pinned

##### POST

TODO

### ATTACHMENTS

#### Avatar

##### POST

```ruby
avatar = BunqRb::Avatar.create(
  attachment_public_uuid: "d93e07e3-d420-45e5-8684-fc0c09a63686"
)
```

##### GET

```ruby
avatar = BunqRb::Avatar.find(1019)
```

#### Attachment Public

##### POST

```ruby
image_path = File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/images/baz.jpg"))
image = Faraday::UploadIO.new(image_path, 'image/jpeg')
attachment = BunqRb::AttachmentPublic.create(image)
```

##### GET

```ruby
avatar = BunqRb::AttachmentPublic.find(1019)
```

#### Attachment Public Content

##### LIST

TODO

#### Attachment Monetary Account

##### POST

```ruby
image_path = File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/images/baz.jpg"))
image = Faraday::UploadIO.new(image_path, 'image/jpeg')
attachment = BunqRb::AttachmentMonetaryAccount.create(image)
```

#### Attachment Tab

##### POST

TODO

##### GET

TODO

#### Attachment Tab Content

##### LIST

TODO

#### Tab Attachment Tab

##### GET

TODO

#### Tab Attachment Tab Content

##### LIST

TODO

#### Attachment Conversation

##### POST

TODO

##### GET

TODO

#### Attachment Conversation Content

##### LIST

TODO

### INVOICES

#### Invoice

##### GET

```ruby
user_id = 1
monetary_account_id = 11
invoice = BunqRb::Invoice.find(user_id, monetary_account_id, 42)
```

##### LIST

```ruby
user_id = 1
monetary_account_id = 11
invoices = BunqRb::Invoice.all(user_id, monetary_account_id)
```

#### Invoice By User

##### GET

```ruby
user_id = 1
invoice = BunqRb::InvoiceByUser.find(user_id, 42)
```

##### LIST

```ruby
user_id = 1
invoices = BunqRb::InvoiceByUser.all(user_id)
```

### EXPORT STATEMENTS

#### Customer Statement Export

##### POST

TODO

##### GET

```ruby
user_id = 1
monetary_account_id = 11
invoice = BunqRb::CustomerStatementExport.find(user_id, monetary_account_id, 42)
```

##### LIST

```ruby
user_id = 1
monetary_account_id = 11
invoices = BunqRb::CustomerStatementExport.all(user_id, monetary_account_id)
```

##### DELETE

```ruby
user_id = 1
monetary_account_id = 11
invoice = BunqRb::CustomerStatementExport.delete(user_id, monetary_account_id, 42)
```

#### Customer Statement Export Content

##### LIST

TODO

#### Export Annual Overview

##### POST

TODO

##### GET

```ruby
user_id = 1
invoice = BunqRb::ExportAnnualOverview.find(user_id, 42)
```

##### LIST

```ruby
user_id = 1
invoices = BunqRb::ExportAnnualOverview.all(user_id)
```

#### Export Annual Overview Content

##### LIST

TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ahtung/bunq_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
