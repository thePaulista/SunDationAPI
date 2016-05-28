class SunlightService
 attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'http://congress.api.sunlightfoundation.com')
    connection.params[:apikey] = ENV["sunlight_api_key"]
  end

  def legislators(params)
    parse(connection.get("legislators", params))
  end

  def committees(params)
    parse(connection.get("committees", params))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: :true)[:results]
  end
end
