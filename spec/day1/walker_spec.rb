require 'minitest/autorun'
require 'day1'

describe Day1::Walker do
  before do
    @walker = Day1::Walker.new
  end

  describe 'Given brand new' do
    it 'should be facing north' do
      @walker.current_direction.must_equal 'N'
    end

    it 'should be at origin' do
      @walker.current_position.must_equal Vector[0,0]
    end

    it 'should turn left and be facing west' do
      @walker.turn('L')
      @walker.current_direction.must_equal 'W'
    end

    it 'should turn left 6 times and be facing south' do
      6.times { @walker.turn('L') }
      @walker.current_direction.must_equal 'S'
    end

    it 'should turn right and be facing east' do
      @walker.turn('R')
      @walker.current_direction.must_equal 'E'
    end

    it 'should turn right 4 times and be facing north' do
      4.times { @walker.turn('R') }
      @walker.current_direction.must_equal 'N'
    end

    it 'should turn left 4 times and be facing north' do
      4.times { @walker.turn('L') }
      @walker.current_direction.must_equal 'N'
    end
  end

  describe 'Given moves R2, R2, R2' do
    before do
      3.times { @walker.move(['R', 2]) }
    end

    it 'should be facing west' do
      @walker.current_direction.must_equal 'W'
    end

    it 'should be at [0, -2]' do
      @walker.current_position.must_equal Vector[0, -2]
    end

    it 'should be 2 walking units from the origin' do
      @walker.distance_from_origin.must_equal 2
    end
  end

  describe 'Given moves L2, L2, L2' do
    before do
      3.times { @walker.move(['L', 2]) }
    end

    it 'should be facing east' do
      @walker.current_direction.must_equal 'E'
    end

    it 'should be at [0, -2]' do
      @walker.current_position.must_equal Vector[0, -2]
    end

    it 'should be 2 walking units from the origin' do
      @walker.distance_from_origin.must_equal 2
    end
  end

  describe 'Given moves L100, R2, L2' do
    before do
      @walker.move(['L', 100])
      @walker.move(['R', 2])
      @walker.move(['L', 2])
    end

    it 'should be facing west' do
      @walker.current_direction.must_equal 'W'
    end

    it 'should be at [-102, 2]' do
      @walker.current_position.must_equal Vector[-102, 2]
    end

    it 'should be 100 walking units from the origin' do
      @walker.distance_from_origin.must_equal 104
    end
  end

  describe 'Given moves L100, R2, R200, L2' do
    before do
      @walker.move(['L', 100])
      @walker.move(['R', 2])
      @walker.move(['R', 200])
      @walker.move(['L', 2])
    end

    it 'should be facing north' do
      @walker.current_direction.must_equal 'N'
    end

    it 'should be at [100, 4]' do
      @walker.current_position.must_equal Vector[100, 4]
    end

    it 'should be 100 walking units from the origin' do
      @walker.distance_from_origin.must_equal 104
    end
  end
end