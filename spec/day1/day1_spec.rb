require 'minitest/autorun'
require 'day1'

describe 'Day 1' do
  describe 'after full path' do
    it 'should answer 5 for R2, L3' do
      Day1.distance_after('R2, L3').must_equal(5)
    end

    it 'should answer 2 for R2, R2, R2' do
      Day1.distance_after('R2, R2, R2').must_equal(2)
    end
  end

  describe 'going only to first repeated position' do
    it 'should answer 4 for R8, R4, R4, R8' do
      Day1.distance_to_first_repeated_position('R8, R4, R4, R8').must_equal 4
    end

    it 'should answer 7 for R8, R0, R8' do
      Day1.distance_to_first_repeated_position('R8, R0, R8').must_equal 7
    end


    it 'should answer 57 for R158, L3, L101, L5, R7' do
      Day1.distance_to_first_repeated_position('R158, L3, L101, L5, R7').must_equal 57
    end
  end
end