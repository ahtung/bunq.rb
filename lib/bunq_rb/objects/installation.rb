module BunqRb
  class Installation
    URI = '/v1/installation'

    attr_reader :id

    def initialize(hsh = {})
      @id = hsh['id']
    end

    def self.create(hash = {})
      faraday_response = Client.connection.post(URI, hash)
      json_response = JSON.parse(faraday_response.body)
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      [new(json_response['Response'][0]['Id']), json_response['Response'][1]['Token'], json_response['Response'][2]['ServerPublicKey']]
    end

    def self.find(id)
      uri =  [URI, id].join('/')
      faraday_response = Client.connection.get(uri)
      json_response = JSON.parse(faraday_response.body)
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      new(json_response['Response']['Id'])
    end
  end
end
