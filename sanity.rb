require_relative 'lib/bunq_rb'

BunqRb.configure do |config|
  config.api_key = "85b00ad9fdaf00aef3e8bdebe1887a3a3a874eb14801e7719d9aa5dd95e3ecda"
  config.key = OpenSSL::PKey::RSA.new(2048)
  config.url = "https://api.bunq.com"
  config.page_size = 200
end

installation, token, server_public_key = BunqRb::Installation.create(
  client_public_key: BunqRb.configuration.key.public_key
)

BunqRb.configuration.session_token = token["token"]

device_server = BunqRb::DeviceServer.create(
  description: "Loyo",
  secret: BunqRb.configuration.api_key,
  permitted_ips: []
)

session_server, token, user_company = BunqRb::SessionServer.create(
  secret: BunqRb.configuration.api_key
)

BunqRb.configuration.session_token = token["token"]

############################### TEST ###########################################

user = BunqRb::User.find(228440)
puts BunqRb::ExportAnnualOverview.all(user.id).first

# start_date = DateTime.parse('1st Mar 2018 00:00:00')
# end_date = DateTime.parse('3rd Mar 2018 23:59:59')
# description = "ALBERT HEIJN"
# required = 26
#
# res = user.monetary_accounts.map { |account|
#   account.payments.select { |payment|
#     start_date <= payment.created && payment.created <= end_date
#   }.select { |payment|
#     /#{description}/ =~ payment.description
#   }.inject(0) { |sum, payment|
#     sum + payment.amount
#   }
# }.sum.abs
# puts res
# puts res / required
