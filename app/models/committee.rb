class Committee < OpenStruct
  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(params)
    service.committees(params).map { |committee| Committee.new(committee) }
  end
end


