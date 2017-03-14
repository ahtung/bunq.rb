require_relative "bunq_rb/version"
require_relative "bunq_rb/configuration"
require_relative "bunq_rb/client"

module BunqRb
  # BunqRb
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
