class Legislator < OpenStruct

  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(gender)
    #legislators(gender) is a collection of hashes
    service.legislators(gender).map { |legislator| Legislator.new(legislator) }
  end
end
