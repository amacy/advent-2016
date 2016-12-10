require "pry"
require_relative "../lib/day_four"

RSpec.describe DayFour do
  describe "solve_part_one" do
    it "works for the example input" do
      example = %w[
        aaaaa-bbb-z-y-x-123[abxyz]
        a-b-c-d-e-f-g-h-987[abcde]
        not-a-real-room-404[oarel]
        totally-real-room-200[decoy]
      ]
      expect(DayFour.new(example).solve_part_one).to eq(1514)
    end

    it "returns the correct answer" do
      expect(DayFour.new.solve_part_one).to eq(158835)
    end
  end

  describe "solve_part_two" do
    it "returns the correct answer" do
      expect(DayFour.new.solve_part_two).to eq(993)
    end
  end
end
