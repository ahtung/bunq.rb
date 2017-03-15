require "openssl"
require "base64"

# SignRequest
class SignRequest < Faraday::Middleware
  def call(env)
    @env = env
    if sign?
      set_client_authentication_header
      set_image_header if image?
      set_signature_header
    end
    @app.call(@env)
  end

  private

  def set_signature_header
    @env[:request_headers]["X-Bunq-Client-Signature"] = Base64.strict_encode64(signature)
  end

  def set_image_header
    @env[:request_headers]["X-Bunq-Attachment-Description"] = "BAZ"
    @env[:request_headers]["Content-Type"] = "image/jpeg"
  end

  def set_client_authentication_header
    @env[:request_headers]["X-Bunq-Client-Authentication"] = BunqRb.configuration.session_token
  end

  def signature
    digest = OpenSSL::Digest::SHA256.new
    BunqRb.configuration.key.sign(digest, string)
  end

  def string
    sorted_headers = @env[:request_headers].sort.to_h.map { |k, v| "#{k}: #{v}" }
    str = request_string
    str << sorted_headers.join("\n") << "\n\n"
    str << body
    str
  end

  def body
    if image?
      @env.body.to_s
    else
      @env[:method] == :post ? @env.body.to_json : ""
    end
  end

  def image?
    @env[:url].to_s.match(%r{v1\/user\/.*\/monetary-account\/.*\/attachment})
  end

  def request_string
    uri = Addressable::URI.parse(@env[:url])
    "#{@env[:method].upcase} #{uri.path}\n"
  end

  def sign?
    @env[:method] == :post && @env[:url].to_s.match(%r{v1\/installation}) ? false : true
  end
end
