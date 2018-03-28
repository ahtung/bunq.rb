module BunqRb
  # CardName
  class CardName
    include BunqRb::Shared

    implements :list

    attr_reader :possible_card_name_array

    def initialize(hsh = {})
      @possible_card_name_array = hsh["possible_card_name_array"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/card-name"
    end
  end
end
