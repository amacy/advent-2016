require "pry"
require_relative "../lib/day_three"

RSpec.describe DayThree do
  describe "solve_part_one" do
    it "works for the example input" do
      expect(DayThree.new([[5, 10, 15]]).solve_part_one).to eq(0)
    end

    it "returns the correct answer" do
      expect(DayThree.new.solve_part_one).to eq(917)
    end
  end

  describe "solve_part_two" do
    it "works for the example input" do
      expect(DayThree.new.solve_part_two).to eq(1649)
    end
  end
end
