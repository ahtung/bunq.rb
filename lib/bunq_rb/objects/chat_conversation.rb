module BunqRb
  # ChatConversation
  class ChatConversation
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh["id"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/chat-conversation"
    end
  end
end
