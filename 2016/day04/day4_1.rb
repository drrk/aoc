sum = 0
File.open('day4_input.txt').each do |line|
  parts = line.chomp.strip.split('-')
  freq = {}
  sector, check = /(\d+)\[(\w+)\]/.match(parts.pop).captures
  parts.each do |part|
    part.each_char do |c|
      if freq.key?(c)
        freq[c] += 1
      else
        freq[c] = 1
      end
    end
  end
  sorted_freq = freq.sort_by { |letter, count| [-count, letter] }
  valid = true
  i = 0
  check.each_char do |c|
    valid = false if c != sorted_freq[i][0]
    i += 1
  end
  sum += sector.to_i if valid
end
print "Valid Sector Sum #{sum}\n"
