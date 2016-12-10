class DayFour
  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

  def initialize(input=nil)
    @input = input || File.readlines("config/day_four_input.txt").map(&:chomp)
  end

  def solve_part_one
    @input.inject(0) do |sector_id_total, line|
      sector_id_total += _sector_id(line) if _valid?(line)
      sector_id_total
    end
  end

  def solve_part_two
    valid_input = @input.select { |line| _valid?(line) }
    valid_input.each do |line|
      decrypted_string = ""
      sector_id = _sector_id(line)
      name = _name(line)

      name.each_char do |char|
        if char == " "
          decrypted_string += char
        else
          alphabet_index = ALPHABET.index(char) + (sector_id % 26)
          alphabet_index -= ALPHABET.length if alphabet_index >= ALPHABET.length
          decrypted_string += ALPHABET[alphabet_index]
        end
      end

      return sector_id if decrypted_string.include?("north")
    end
  end

  def _valid?(line)
    _checksum(line) == _possible_checksum(line)
  end

  def _checksum(line)
    sector_id = _sector_id(line)
    name = _name(line)
    letter_count = name.split(//).sort.inject({}) do |hash, letter|
      next hash if letter == " "
      hash[letter] ||= 0
      hash[letter] += 1
      hash
    end

    checksum = ""

    5.times do
      count = letter_count.values.max
      letter = letter_count.key(count)
      checksum += letter
      letter_count.delete(letter)
    end

    checksum
  end

  def _sector_id(line)
    line.match(/\d+/).to_s.to_i
  end

  def _name(line)
    line.split(/#{_sector_id(line)}/).first.gsub(/-/, ' ').strip
  end

  def _possible_checksum(line)
    line.match(/\[(\w+)\]/).captures.first
  end
end
