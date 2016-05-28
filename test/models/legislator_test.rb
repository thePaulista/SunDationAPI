require 'test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test '#find_by' do
    VCR.use_cassette("legislator#find_by") do
      legislators = Legislator.find_by(gender: 'F')

      assert_equal 20, legislators.count
    end
  end
end
