two_count = 0
three_count = 0
File.open('input.txt').each do |line|
  letters = Hash.new(0)
  line.chomp.each_char {|c| letters[c] += 1}
  two_count += 1 if letters.has_value?(2)
  three_count += 1 if letters.has_value?(3)
end
print "#{two_count * three_count}\n"
