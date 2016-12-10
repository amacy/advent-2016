class DayFive
  def initialize(door_id)
    @door_id = door_id
  end

  def solve_part_one
    password = ""
    (0..Float::INFINITY).each do |index|
      hex = _to_hex(index)

      password += hex[5] if hex[0..4] == "00000"

      break password if password.length == 8
    end
  end

  def solve_part_two
    password = []
    (0..Float::INFINITY).each do |md5_index|
      hex = _to_hex(md5_index)
      password_index = hex[5].to_i

      if hex[0..4] == "00000" && %w[0 1 2 3 4 5 6 7].include?(hex[5]) && password[password_index].nil?
        password[password_index] = hex[6]
      end

      break password.join if password.length == 8 && !password.include?(nil)
    end
  end

  def _to_hex(index)
    md5 = Digest::MD5.new
    md5 << "#{@door_id}#{index}"
    md5.hexdigest
  end
end
