class DaySix
  def initialize(messages)
    @messages = messages
  end

  def solve_part_one
    _solve(:max)
  end

  def solve_part_two
    _solve(:min)
  end

  def _solve(min_or_max)
    results = @messages.inject({}) do |hash, message|
      message.split(//).each_with_index do |char, message_index|
        hash[message_index] ||= {}
        hash[message_index][char] ||= 0
        hash[message_index][char] += 1
      end
      hash
    end

    message = []
    results.each do |message_index, char_count_hash|
      counts_to_chars = char_count_hash.invert
      message[message_index] = counts_to_chars[counts_to_chars.keys.send(min_or_max.to_sym)]
    end
    message.join
  end
end
