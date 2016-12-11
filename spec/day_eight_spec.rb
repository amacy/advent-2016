require "pry"
require_relative "../lib/day_eight"

RSpec.describe DayEight do
  EXAMPLE_INPUT = ["rect 3x2", "rotate column x=1 by 1", "rotate row y=0 by 4", "rotate column x=1 by 1"]
  REAL_INPUT = File.readlines("config/day_eight_input.txt").map(&:chomp)

  describe "solve_part_one" do
    it "works for the example input" do
      expect(DayEight.new(3, 7, EXAMPLE_INPUT).solve_part_one).to eq(6)
    end

    it "returns the correct answer" do
      expect(DayEight.new(6, 50, REAL_INPUT).solve_part_one).to eq(115)
    end
  end

  describe "solve_part_two" do
    it "returns the correct answer" do
      expected_output = <<-OUTPUT
####.####.####.#...##..#.####.###..####..###...##.
#....#....#....#...##.#..#....#..#.#......#.....#.
###..###..###...#.#.##...###..#..#.###....#.....#.
#....#....#......#..#.#..#....###..#......#.....#.
#....#....#......#..#.#..#....#.#..#......#..#..#.
####.#....####...#..#..#.#....#..#.#.....###..##..
OUTPUT
      expect(DayEight.new(6, 50, REAL_INPUT).solve_part_two).to eq(expected_output)
    end
  end
end
