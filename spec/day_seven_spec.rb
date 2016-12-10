require "pry"
require_relative "../lib/day_seven"

RSpec.describe DaySeven do
  INPUT = File.readlines("config/day_seven_input.txt").map(&:chomp)

  describe "solve_part_one" do
    it "works for the example input" do
      expect(DaySeven.new(["abba[mnop]qrst"]).solve_part_one).to eq(1)
      expect(DaySeven.new(["abcd[bddb]xyyx"]).solve_part_one).to eq(0)
      expect(DaySeven.new(["aaaa[qwer]tyui"]).solve_part_one).to eq(0)
      expect(DaySeven.new(["ioxxoj[asdfgh]zxcvbn"]).solve_part_one).to eq(1)
    end

    it "returns the correct answer" do
      expect(DaySeven.new(INPUT).solve_part_one).to eq(115)
    end
  end

  describe "solve_part_two" do
    it "works for the example input" do
      expect(DaySeven.new(["aba[bab]xyz"]).solve_part_two).to eq(1)
      expect(DaySeven.new(["xyx[xyx]xyx"]).solve_part_two).to eq(0)
      expect(DaySeven.new(["aaa[kek]eke"]).solve_part_two).to eq(1)
      expect(DaySeven.new(["zazbz[bzb]cdb"]).solve_part_two).to eq(1)
    end

    it "returns the correct answer" do
      expect(DaySeven.new(INPUT).solve_part_two).to eq(231)
    end
  end
end
