require "openssl"
require "base64"

# SignRequest
class SignRequest < Faraday::Middleware
  def call(env)
    @env = env
    if sign?
      set_client_authentication_header
      set_signature_header
    end
    @app.call(@env)
  end

  private

  def set_signature_header
    env[:request_headers]["X-Bunq-Client-Signature"] = Base64.strict_encode64(signature)
  end

  def set_client_authentication_header
    env[:request_headers]["X-Bunq-Client-Authentication"] = BunqRb.configuration.session_token
  end

  def signature
    digest = OpenSSL::Digest::SHA256.new
    BunqRb.configuration.key.sign(digest, string)
  end

  def string
    sorted_headers = @env[:request_headers].sort.to_h.map { |k, v| "#{k}: #{v}" }
    str = request_string
    str << sorted_headers.join("\n") << "\n\n"
    str << @env.body.to_json if @env[:method] == :post
    str
  end

  def request_string
    uri = Addressable::URI.parse(@env[:url])
    "#{@env[:method].upcase} #{uri.path}\n"
  end

  def sign?
    @env[:method] == :post && @env[:url].to_s.match(/v1\/installation/) ? false : true
  end
end
