class DaySeven
  def initialize(ips)
    @ips = ips
  end

  def solve_part_one
    @ips.inject(0) do |count, ip|
      inside_brackets, outside_brackets = _separate_ip(ip)

      skip_outside = nil
      inside_brackets.each do |section|
        skip_outside = _contains_abba?(section)
        break if skip_outside
      end

      next count if skip_outside

      outside_brackets.each do |section|
        if _contains_abba?(section)
          break count += 1
        end
      end

      count
    end
  end

  def solve_part_two
    @ips.inject(0) do |count, ip|
      count += 1 if _supports_ssl?(ip)
      count
    end
  end

  def _supports_ssl?(ip)
    inside_brackets, outside_brackets = _separate_ip(ip)

    abas = inside_brackets.map do |section|
      _abas(section)
    end.flatten

    return false if abas.empty?

    outside_brackets.each do |section|
      abas.each do |aba|
        bab = "#{aba[1]}#{aba[0]}#{aba[1]}"
        return true if section.include?(bab)
      end
    end

    false
  end

  def _separate_ip(ip)
    sections = ip.split(/\W/)

    inside_brackets = []
    outside_brackets = []
    sections.each_with_index do |section, index|
      if index.odd?
        inside_brackets << section
      else
        outside_brackets << section
      end
    end

    [inside_brackets, outside_brackets]
  end

  def _contains_abba?(section)
    chars = section.split(//)
    loop do
      chars.each_slice(4) do |slice|
        return true if slice == slice.reverse && slice.uniq.length > 1 && slice[0] == slice[3] && slice[1] == slice [2]
      end
      chars.shift
      return false if chars.length < 4
    end
  end

  def _abas(section)
    chars = section.split(//)
    abas = []
    loop do
      chars.each_slice(3) do |slice|
        abas << slice.join if slice == slice.reverse && slice.uniq.length > 1 && slice[0] == slice[2]
      end
      chars.shift
      return abas if chars.length < 3
    end
  end
end
