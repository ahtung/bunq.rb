module BunqRb
  # ExportAnnualOverview
  class ExportAnnualOverview
    include BunqRb::Shared

    implements :list, :get

    attr_reader :id, :year

    def initialize(hsh = {})
      @id = hsh["id"]
      @year = hsh["year"]
    end

    def self.url(user_id)
      "/v1/user/#{user_id}/export-annual-overview"
    end
  end
end
