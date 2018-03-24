module BunqRb
  # Schedule
  class Schedule
    include BunqRb::Shared

    implements :list, :get

    attr_reader :recurrence_unit, :recurrence_size, :status

    def initialize(hsh = {})
      @recurrence_unit = hsh["recurrence_unit"]
      @recurrence_size = hsh["recurrence_size"]
      @status = hsh["status"]
    end

    def self.url(user_id, monetary_account_id)
      "/v1/user/#{user_id}/monetary-account/#{monetary_account_id}/schedule"
    end
  end
end
