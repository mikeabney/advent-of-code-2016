require 'minitest/autorun'
require 'day1'

describe 'Day 1' do
  it 'should answer 5 for R2, L3' do
    Day1.distance_after('R2, L3').must_equal(5)
  end

  it 'should answer 2 for R2, R2, R2' do
    Day1.distance_after('R2, R2, R2').must_equal(2)
  end
end