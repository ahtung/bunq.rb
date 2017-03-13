module BunqRb
  class Configuration
    attr_accessor :api_key
    attr_accessor :key

    def initialize
      @api_key = ''
      @key = nil
    end
  end
end
