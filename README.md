[![Build Status](https://travis-ci.org/ahtung/bunq_rb.svg?branch=master)](https://travis-ci.org/ahtung/bunq_rb)
[![Gem Version](https://badge.fury.io/rb/bunq_rb.svg)](https://badge.fury.io/rb/bunq_rb)
[![Maintainability](https://api.codeclimate.com/v1/badges/8e9c963093297534c4bb/maintainability)](https://codeclimate.com/github/ahtung/bunq_rb/maintainability)

# BunqRb

- [Documentation](https://doc.bunq.com/)

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
  config.api_key = ENV.fetch("API_KEY")
  config.key     = key                  # OpenSSL::PKey::RSA.new 2048
  config.url     = "https://sandbox.public.api.bunq.com"
end
```

## ToDo

- Use Cases
  - ~~Create Session~~
  - ~~Making a payment request~~
  - ~~Creating a tab payment~~

---

- INSTALLATION
  - ~~Installation~~
    - POST

    ```ruby
    installation, token, server_public_key = BunqRb::Installation.create(client_public_key: BunqRb.configuration.key.public_key)
    ```

    - GET

    ```ruby
    installation = BunqRb::Installation.find(2348)
    ```

    - LIST

    ```ruby
    installations = BunqRb::Installation.all
    ```

  - ~~Installation server public key~~

    - LIST

    ```ruby
    installation = BunqRb::Installation.find(2348)
    server_public_key = installation.server_public_key
    ```

  - ~~Device~~

    - GET

    ```ruby
    device = BunqRb::Device.find(2348)
    #<BunqRb::Device:0x00007fd1b2ae9148 @id=2348>
    ```

    - LIST

    ```ruby
    devices = BunqRb::Device.all
    [#<BunqRb::Device:0x00007f95b93d6138 @id=1493997>]
    ```

  - ~~Device server~~

    - GET

    ```ruby
    device_server = BunqRb::DeviceServer.find(1434035)
    #<BunqRb::DeviceServer:0x00007f88af94f7c0 @id=1434035>
    ```

    - LIST

    ```ruby
    device_servers = BunqRb::DeviceServer.all
    [#<BunqRb::DeviceServer:0x00007ffcde0d72e8 @id=1434035>]
    ```

    - POST

    ```ruby
    device_server = BunqRb::DeviceServer.create(
      description: "Dunya",
      secret: BunqRb.configuration.api_key,
      permitted_ips: []
    )
    #<BunqRb::DeviceServer:0x00007ffe1daf86b0 @id=1794019>
    ```

  - ~~Permitted IP~~
    - GET
    - LIST
    - POST
    - PUT

  - User credential password IP
    - GET
    - LIST

- SESSION
  - Session
  - ~~SessionServer~~

- USER
  - ~~User~~
    - GET

    ```ruby
    user = BunqRb::User.find(1913)
    ```

    - LIST

    ```ruby
    users = BunqRb::User.all
    ```

  - User person
  - User company
  - Schedule user
- MONETARY ACCOUNTS
  - Monetary account
    - ~~LIST~~
    ```ruby
    user = BunqRb::User.find(1913)
    monetary_accounts = user.monetary_accounts
    [#<BunqRb::MonetaryAccount:0x00007f852938f5a8 @id=301148, @user_id=1913, @currency="EUR", @description="...">, #<BunqRb::MonetaryAccount:0x00007f852938f580 @id=301172, @user_id=1913, @currency="EUR", @description="...">]
    ```
    - GET
  - Monetary account bank
- PAYMENTS
  - Payment
    - ~~LIST~~
    ```ruby
    user = BunqRb::User.find(1913)
    monetary_account = user.monetary_accounts.first
    payments = monetary_account.payments
    [
      #<BunqRb::Payment:0x00007fbed72c4370 @id=74613069, @description="...", @amount=#<Money fractional:-11500 currency:EUR>, @created=2018-03-16 18:54:37 +0300, @updated=2018-03-17 05:39:56 +0300>,
      #<BunqRb::Payment:0x00007fbed72bdc28 @id=74555845, @description="...", @amount=#<Money fractional:-807 currency:EUR>, @created=2018-03-16 11:28:43 +0300, @updated=2018-03-16 11:28:43 +0300>
    ]
    ```
    - GET
  - Draft payment
  - Payment batch
  - Request inquiry
  - Request inquiry batch
  - Request response
  - Schedule instance
  - Schedule payment
  - Schedule payment batch
  - Schedule
  - Payment chat
  - Request inquiry chat
  - Request response chat
- TABS
  - Cash register
  - Cash register qr code
  - Cash register qr code content
  - Tab
  - Tab item
  - Tab item batch
  - Tab usage single
  - Tab usage multiple
  - Tab qr code content
  - Tab result inquiry
  - Tab result response
- CARDS
  - Card
    - ~~GET~~
    ```ruby
    user_id = 1913
    card_id = 82082
    card = BunqRb::Card.find(user_id, card_id)
    #<BunqRb::Card:0x00007f9c969bb538 @id=82082>
    ```
    - ~~LIST~~
    ```ruby
    user_id = 1913
    cards = BunqRb::Card.all(user_id)
    [#<BunqRb::Card:0x00007faf4db07f58 @id=162139>, #<BunqRb::Card:0x00007faf4db07f30 @id=82082>]
    ```
    - PUT
  - Card debit
  - Card name
  - Master card action
- CONNECT
  - Share invite bank inquiry
  - Share invite bank response
  - Share invite bank amount used
  - Draft share invite bank
  - Draft share invite bank qr code content
- CHAT
  - Chat conversation
  - Chat message
  - Chat message attachment
  - Chat message text
- INVOICES
  - Invoice
  - Invoice by user
- EXPORTS
  - Customer statement export
  - Customer statement export content
  - Export annual overview
  - Export annual overview content
- CALLBACKS
  - Certificate pinned
- ATTACHMENTS
  - ~~Avatar~~
    - POST
    - GET
  - ~~Attachment public~~
    - POST
    - GET
  - Attachment public content
  - ~~Attachment monetary account~~
  - Attachment tab
  - Attachment tab content
  - Tab attachment tab
  - Tab attachment tab content
  - Attachment conversation
  - Attachment conversation content

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ahtung/bunq_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
