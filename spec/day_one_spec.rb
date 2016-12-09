require "pry"
require_relative "../lib/day_one"

RSpec.describe DayOne do
  INPUT = %w[R3 L5 R2 L1 L2 R5 L2 R2 L2 L2 L1 R2 L2 R4 R4 R1 L2 L3 R3 L1 R2 L2 L4 R4 R5 L3 R3 L3 L3 R4 R5 L3 R3 L5 L1 L2 R2 L1 R3 R1 L1 R187 L1 R2 R47 L5 L1 L2 R4 R3 L3 R3 R4 R1 R3 L1 L4 L1 R2 L1 R4 R5 L1 R77 L5 L4 R3 L2 R4 R5 R5 L2 L2 R2 R5 L2 R194 R5 L2 R4 L5 L4 L2 R5 L3 L2 L5 R5 R2 L3 R3 R1 L4 R2 L1 R5 L1 R5 L1 L1 R3 L1 R5 R2 R5 R5 L4 L5 L5 L5 R3 L2 L5 L4 R3 R1 R1 R4 L2 L4 R5 R5 R4 L2 L2 R5 R5 L5 L2 R4 R4 L4 R1 L3 R1 L1 L1 L1 L4 R5 R4 L4 L4 R5 R3 L2 L2 R3 R1 R4 L3 R1 L4 R3 L3 L2 R2 R2 R2 L1 L4 R3 R2 R2 L3 R2 L3 L2 R4 L2 R3 L4 R5 R4 R1 R5 R3]

  describe "solve_part_one" do
    it "works for the example input" do
      expect(DayOne.new(["R2", "L3"]).solve_part_one).to eq(5)
      expect(DayOne.new(["R2", "R2", "R2"]).solve_part_one).to eq(2)
      expect(DayOne.new(["R5", "L5", "R5", "R3"]).solve_part_one).to eq(12)
    end

    it "returns the correct answer" do
      expect(DayOne.new(INPUT).solve_part_one).to eq(243)
    end
  end

  describe "solve_part_two" do
    it "works for the example input" do
      expect(DayOne.new(%w[R8 R4 R4 R8]).solve_part_two).to eq(4)
    end

    it "returns the correct answer" do
      expect(DayOne.new(INPUT).solve_part_two).to eq(142)
    end
  end
end
