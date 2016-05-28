class Legislator < OpenStruct

  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(params)
    #legislators(gender) is a collection of hashes
    service.legislators(params).map { |legislator| Legislator.new(legislator) }
  end
end
