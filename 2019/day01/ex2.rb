sum = 0
File.open('input.txt').each do |line|
  total_fuel = 0
  mass = line.to_f()
  fuel = (mass / 3.0).floor() - 2
  while fuel > 0
    total_fuel += fuel
    fuel = (fuel / 3.0).floor() - 2
  end
  sum += total_fuel
end
print "#{sum}\n"
