class DayTwo
  IMAGINED_MAPPINGS = {
    "1" => { "D" => "4", "R" => "2",                        },
    "2" => { "D" => "5", "R" => "3", "L" => "1"             },
    "3" => { "D" => "6",             "L" => "2"             },
    "4" => { "D" => "7", "R" => "5",             "U" => "1" },
    "5" => { "D" => "8", "R" => "6", "L" => "4", "U" => "2" },
    "6" => { "D" => "9",             "L" => "5", "U" => "3" },
    "7" => {             "R" => "8",             "U" => "4" },
    "8" => {             "R" => "9", "L" => "7", "U" => "5" },
    "9" => {                         "L" => "8", "U" => "6" },
  }

  REAL_MAPPINGS = {
    "1" => { "D" => "3"                                     },
    "2" => { "D" => "6", "R" => "3"                         },
    "3" => { "D" => "7", "R" => "4", "L" => "2", "U" => "1" },
    "4" => { "D" => "8",             "L" => "3"             },
    "5" => {             "R" => "6"                         },
    "6" => { "D" => "A", "R" => "7", "L" => "5", "U" => "2" },
    "7" => { "D" => "B", "R" => "8", "L" => "6", "U" => "3" },
    "8" => { "D" => "C", "R" => "9", "L" => "7", "U" => "4" },
    "9" => {                         "L" => "8",            },
    "A" => {             "R" => "B",             "U" => "6" },
    "B" => { "D" => "D", "R" => "C", "L" => "A", "U" => "7" },
    "C" => {                         "L" => "B", "U" => "8" },
    "D" => {                                     "U" => "B" },
  }

  def initialize(input)
    @input = input
    @current_position = "5"
  end

  def solve_part_one
    @input.map do |line|
      _solve_line(line, IMAGINED_MAPPINGS)
    end.join
  end

  def solve_part_two
    @input.map do |line|
      _solve_line(line, REAL_MAPPINGS)
    end.join
  end

  def _solve_line(line, mappings)
    line.split(//).map do |direction|
      @current_position = mappings[@current_position][direction] || @current_position
    end.last
  end
end
