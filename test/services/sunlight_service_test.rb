require 'test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test '#legislators gender' do
    VCR.use_cassette("sunlight_service#legislators gender") do
      legislators = SunlightService.new.legislators(gender: "F")
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal "Joni", legislator[:first_name]
      assert_equal "Ernst", legislator[:last_name]
    end
  end

  test "#legislators chamber" do
    VCR.use_cassette("sunlight_service") do
      legislators = SunlightService.new.legislators(chamber: "senate")
      legislator = legislators.first
      legislator_last = legislators.last

      assert_equal 20, legislators.count
      assert_equal "Benjamin", legislator[:first_name]
      assert_equal "Sasse", legislator[:last_name]
      assert_equal "Patrick", legislator_last[:first_name]
      assert_equal "Toomey", legislator_last[:last_name]
    end
  end
end

