module BunqRb
  class Configuration
    attr_accessor :api_key
    attr_accessor :key
    attr_accessor :session_token

    def initialize
      @api_key = ''
      @key = nil
      @session_token = nil
    end
  end
end
