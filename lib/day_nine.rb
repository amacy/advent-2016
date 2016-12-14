class DayNine
  def initialize(input)
    @input = input
  end

  def solve_part_one
    decoded = ""

    @input.each do |line|
      marker = line.match(/\dx\d/).to_s
      char_repeat_count, repititions = marker.split(/x/)

      sections = line.split(/\(#{marker}\)/)
      not_repeated = sections.shift
      repeated = sections

      decoded += not_repeated

      return decoded.size unless char_repeat_count

      repeated.each do |section|
        decoded += section[0..char_repeat_count.to_i - 1] * repititions.to_i
      end

      decoded += repeated.map { |section| section[char_repeat_count.to_i..-1] }.join
    end

    decoded.size
  end

  def solve_part_two
  end
end
