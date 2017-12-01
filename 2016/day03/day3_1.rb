count = 0
File.open('day3_input.txt').each do |line|
  vals = line.chomp.strip.split(/\s+/)
  vals_s = vals.sort { |a, b| a.to_i <=> b.to_i }
  count += 1 if vals_s[0].to_i + vals_s[1].to_i > vals_s[2].to_i
end

print "Count: #{count}\n"
