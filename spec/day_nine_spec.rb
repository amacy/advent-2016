require "pry"
require_relative "../lib/day_nine"

RSpec.describe DayNine do
  REAL_INPUT = File.readlines("config/day_nine_input.txt").map(&:chomp)

  describe "solve_part_one" do
    it "works for the example input" do
      expect(DayNine.new(["ADVENT"]).solve_part_one).to eq(6)
      expect(DayNine.new(["A(1x5)BC"]).solve_part_one).to eq(7)
      expect(DayNine.new(["(3x3)XYZ"]).solve_part_one).to eq(9)
      expect(DayNine.new(["A(2x2)BCD(2x2)EFG"]).solve_part_one).to eq(11)
      expect(DayNine.new(["(6x1)(1x3)A"]).solve_part_one).to eq(6)
      expect(DayNine.new(["X(8x2)(3x3)ABCY"]).solve_part_one).to eq(18)
    end

    it "returns the correct answer" do
      expect(DayNine.new(REAL_INPUT).solve_part_one).to eq(0)
      # 11892 - too low
    end
  end

  describe "solve_part_two" do
    xit "returns the correct answer" do
      expect(DayNine.new(REAL_INPUT).solve_part_two).to eq(0)
    end
  end
end
