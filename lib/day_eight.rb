class DayEight
  def initialize(number_of_rows, number_of_columns, directions)
    @directions = directions
    @screen = []

    row = []
    number_of_columns.times { row << "." }
    number_of_rows.times { @screen << row.dup }
  end

  def solve_part_one
    @directions.each do |direction|
      direction_array = direction.split(/ /)
      command = direction_array[0]

      case command
      when "rect"
        dimensions = direction_array[1]
        rows, columns = dimensions.split(/x/).map(&:to_i)
        row_range = 0..rows - 1
        column_range = 0..columns - 1
        _turn_pixels_on(row_range, column_range)
      when "rotate"
        target = direction_array[1]
        case target
        when "row"
          row_index = direction_array[2].split(/=/).last.to_i
          offset = direction_array.last.to_i
          @screen[row_index].rotate!(-offset)
        when "column"
          column_index = direction_array[2].split(/=/).last.to_i
          row_offset = direction_array.last.to_i
          old_screen = @screen.dup.map { |row| row.dup }

          (0..@screen.length - 1).each do |row_index|
            new_row_index = (row_index + row_offset) % @screen.length
            @screen[new_row_index][column_index] = old_screen[row_index][column_index]
          end
        end
      end
    end

    @screen.inject(0) { |sum, row| sum += row.count("#") }
  end

  def solve_part_two
    solve_part_one
    _pretty_print
  end

  def _pretty_print
    @screen.map(&:join).join("\n") + "\n"
  end

  def _turn_pixels_on(row_range, column_range)
    (column_range).each do |column_index|
      (row_range).each do |row_index|
        @screen[column_index][row_index] = "#"
      end
    end
  end
end
