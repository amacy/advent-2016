require "pry"
require_relative "../lib/day_five"

RSpec.describe DayFive do
  describe "solve_part_one" do
    it "works for the example input" do
      expect(DayFive.new("abc").solve_part_one).to eq("18f47a30")
    end

    it "returns the correct answer" do
      expect(DayFive.new("reyedfim").solve_part_one).to eq("f97c354d")
    end
  end

  describe "solve_part_two" do
    it "works for the example input" do
      expect(DayFive.new("abc").solve_part_two).to eq("05ace8e3")
    end

    it "returns the correct answer" do
      expect(DayFive.new("reyedfim").solve_part_two).to eq("863dde27")
    end
  end
end
