class DayOne
  def initialize(moves)
    @moves = moves
    @current_position = [0, 0]
    @currently_facing = "north"
    @position_history = [@current_position.dup]
    @hq = nil
  end

  def solve_part_one
    @moves.each { |move| _move(move) }
    _blocks_away(@current_position)
  end

  def solve_part_two
    @moves.each do |move|
      _move(move)
      break if @hq
    end
    _blocks_away(@hq)
  end

  def _blocks_away(position)
    position.map(&:abs).inject(&:+)
  end

  def _move(move)
    _change_direction(move[0])
    _advance(move[1..-1].to_i)
  end

  def _change_direction(turn)
    @currently_facing = case @currently_facing
                        when "north"
                          turn == "R" ? "east" : "west"
                        when "south"
                          turn == "R" ? "west" : "east"
                        when "east"
                          turn == "R" ? "south" : "north"
                        when "west"
                          turn == "R" ? "north" : "south"
                        end
  end

  def _advance(number_of_blocks)
    case @currently_facing
    when "north"
      (@current_position[1] + 1).upto(@current_position[1] + number_of_blocks).each do |y|
        _record_position([@current_position[0], y])
      end
      @current_position[1] += number_of_blocks
    when "south"
      (@current_position[1] - 1).downto(@current_position[1] - number_of_blocks).each do |y|
        _record_position([@current_position[0], y])
      end
      @current_position[1] -= number_of_blocks
    when "east"
      (@current_position[0] + 1).upto(@current_position[0] + number_of_blocks).each do |x|
        _record_position([x, @current_position[1]])
      end
      @current_position[0] += number_of_blocks
    when "west"
      (@current_position[0] - 1).downto(@current_position[0] - number_of_blocks).each do |x|
        _record_position([x, @current_position[1]])
      end
      @current_position[0] -= number_of_blocks
    end
  end

  def _record_position(position)
    @hq = position if @position_history.include?(position) && @hq.nil?
    @position_history << position
  end
end
