require 'matrix'

module Day1
  DIRECTION_TO_COORD_CHANGE = {
      'N' => Vector[0, 1],
      'S' => Vector[0, -1],
      'E' => Vector[1, 0],
      'W' => Vector[-1, 0]
  }

  CARDINAL_DIRECTION_ORDER = %w(N E S W)

  def self.distance_after(move_string)
    moves = parse_move_string(move_string)
    walker = Walker.new
    walker.follow_path(moves)
    walker.distance_from_origin
  end

  def self.parse_move_string(move_string)
    single_moves = move_string.split(/,\s/)
    single_moves.each_with_object([]) do |dir_and_distance, pairs|
      pairs << [dir_and_distance[0], dir_and_distance[1..-1].to_i]
    end
  end

  class Walker

    attr_reader :current_position

    def initialize
      @current_direction_index = 0
      @current_position = Vector[0,0]
    end

    def current_direction
      CARDINAL_DIRECTION_ORDER[@current_direction_index]
    end

    def follow_path(moves)
      moves.each do |move|
        move(move)
      end
    end

    def move(move)
      turn(move[0])
      go(move[1])
    end

    def turn(left_or_right)
      @current_direction_index = (@current_direction_index + (left_or_right == 'L' ? -1 : 1)) % CARDINAL_DIRECTION_ORDER.length
    end

    def go(distance)
      vector_to_add = DIRECTION_TO_COORD_CHANGE[CARDINAL_DIRECTION_ORDER[@current_direction_index]]
      @current_position += (vector_to_add * distance)
    end

    def distance_from_origin
      @current_position.inject(0) { |sum, value| sum + value.abs }
    end
  end
end

if __FILE__ == $0
  puts Day1.distance_after(
    <<~HEREDOC
    L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3,
    L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1,
    L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4,
    L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2,
    R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4,
    R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5,
    L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5,
    L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5,
    L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2,
    L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1,
    R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2
    HEREDOC
  )
end