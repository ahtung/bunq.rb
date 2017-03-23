module BunqRb
  # DeviceServer
  class DeviceServer
    include ActiveModel::Model
    include BunqRb::Shared

    implements :post, :get, :list

    attr_accessor :id, :created, :updated, :ip, :description, :status

    def self.uri
      "/v1/device-server"
    end
  end
end
