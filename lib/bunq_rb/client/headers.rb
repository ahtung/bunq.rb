class Headers < Faraday::Middleware
  def call(env)
    env[:request_headers]["Cache-Control"] = "no-cache"
    env[:request_headers]["User-Agent"] = "bunq_rb/1.00"
    env[:request_headers]["X-Bunq-Language"] = "nl_NL"
    env[:request_headers]["X-Bunq-Region"] = "nl_NL"
    env[:request_headers]["X-Bunq-Geolocation"] = "0 0 0 0 NL"
    env[:request_headers]["X-Bunq-Client-Request-Id"] = SecureRandom.uuid
    @app.call(env)
  end
end
