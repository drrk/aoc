sum = 0
File.open('input.txt').each do |line|
  mass = line.to_f()
  fuel = (mass / 3.0).floor() - 2
  sum += fuel
end
print "#{sum}\n"
