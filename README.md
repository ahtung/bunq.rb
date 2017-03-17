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
end
```

## ToDo

- Use Cases
  - ~~Create Session~~
  - Making a payment request
  - Creating a tab payment
- Installation
  - ~~Installation~~
  - Installation server public key
  - Device
  - Device server
  - ~~Permitted IP~~
  - User credential password IP
- Session
  - Session
  - ~~SessionServer~~
- Monetary Accounts
  - Monetary account
  - Monetary account bank
- Payments
  - Request inquiry
- Attachments
  - Attachment monetary account

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ahtung/bunq_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
