class DayThree
  def initialize(possible_triangles=nil)
    @possible_triangles = possible_triangles || File.readlines("config/day_three_input.txt").map { |line| line.strip.split(/\s+/) }
  end

  def solve_part_one
    @possible_triangles.select do |triangle|
      _possible_triangle?(_sanitize(triangle))
    end.size
  end

  def solve_part_two
    count = 0

    @possible_triangles.each_slice(3) do |three_rows|
      triangle_1 = three_rows.map { |row| row[0] }
      triangle_2 = three_rows.map { |row| row[1] }
      triangle_3 = three_rows.map { |row| row[2] }

      [triangle_1, triangle_2, triangle_3].each do |triangle|
        count += 1 if _possible_triangle?(_sanitize(triangle))
      end
    end

    count
  end

  def _possible_triangle?(triangle)
    triangle[0] + triangle[1] > triangle[2]
  end

  def _sanitize(triangle)
    triangle.map(&:to_i).sort
  end
end
