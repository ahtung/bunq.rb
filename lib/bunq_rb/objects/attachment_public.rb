module BunqRb
  # AttachmentPublic
  class AttachmentPublic
    URI = "/v1/attachment-public".freeze

    attr_reader :uuid

    def initialize(hsh = {})
      @uuid = hsh["uuid"]
    end

    def self.create(hash = {})
      response = Client.send_method(:post, URI, hash)
      new(response[0]["Uuid"])
    end

    def self.find(id)
      uri = [URI, id].join("/")
      response = Client.send_method(:get, uri)
      new(response[0]["AttachmentPublic"])
    end
  end
end
