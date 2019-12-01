sum = 0
File.open('input.txt').each do |line|
  sum += line.chomp.to_i
end
print "#{sum}\n"
