require "active_support/all"
require "money"

require_relative "bunq_rb/version"
require_relative "bunq_rb/configuration"
require_relative "bunq_rb/client"

# BunqRb
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
