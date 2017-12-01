freq = []

File.open('day6_input.txt').each do |line|
  i = 0
  line.chomp.strip.each_char do |c|
    freq[i] = {} unless freq[i]
    if freq[i].key?(c)
      freq[i][c] += 1
    else
      freq[i][c] = 1
    end
    i += 1
  end
end
freq.each do |c_freq|
  print c_freq.sort_by { |letter, count| [count, letter] }[0][0]
end
print "\n"
