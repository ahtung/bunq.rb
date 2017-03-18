module BunqRb
  # Device
  class Device
    include ActiveModel::Model
    include BunqRb::Shared

    implements :get, :list

    attr_accessor :id, :created, :updated, :ip, :description, :status

    def self.uri
      "/v1/device"
    end
  end
end
