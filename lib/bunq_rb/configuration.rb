module BunqRb
  # Configuration
  class Configuration
    attr_accessor :api_key, :key, :session_token, :url, :page_size

    def initialize
      @api_key = ""
      @key = nil
      @session_token = nil
      @url = ""
      @page_size = 10
    end
  end
end
