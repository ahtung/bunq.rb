module BunqRb
  # Configuration
  class Configuration
    attr_accessor :api_key
    attr_accessor :key
    attr_accessor :session_token
    attr_accessor :url

    def initialize
      @api_key = ""
      @key = nil
      @session_token = nil
      @url = ""
    end
  end
end
