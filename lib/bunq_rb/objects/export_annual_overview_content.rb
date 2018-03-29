module BunqRb
  # ExportAnnualOverviewContent
  class ExportAnnualOverviewContent
    include BunqRb::Shared

    implements :list

    def initialize(hsh = {})
    end

    def self.url(user_id, export_annual_overview_id)
      "/v1/user/#{user_id}/export-annual-overview/#{export_annual_overview_id}/content"
    end
  end
end
