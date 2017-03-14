require "openssl"
require "base64"

class SignRequest < Faraday::Middleware
  def call(env)
    if sign?(env)
      env[:request_headers]["X-Bunq-Client-Authentication"] = BunqRb.configuration.session_token
      uri = Addressable::URI.parse(env[:url])
      string = "#{env[:method].upcase} #{uri.path}\n"
      sorted_headers = env[:request_headers].sort.to_h.map { |k, v| "#{k}: #{v}" }
      string << sorted_headers.join("\n") << "\n\n"
      string << env.body.to_json if env[:method] == :post
      digest = OpenSSL::Digest::SHA256.new
      signature = BunqRb.configuration.key.sign(digest, string)
      env[:request_headers]["X-Bunq-Client-Signature"] = Base64.strict_encode64(signature)
    end
    @app.call(env)
  end

  def sign?(env)
    (env[:method] == :post && env[:url].to_s.match(/v1\/installation/)) ? false : true
  end
end
