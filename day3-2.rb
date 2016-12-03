count = 0
lineno = 0
sets = [[], [], []]
File.open('day3_input').each do |line|
  vals = line.chomp.strip.split(/\s+/)
  sets[0][lineno % 3] = vals[0]
  sets[1][lineno % 3] = vals[1]
  sets[2][lineno % 3] = vals[2]
  if lineno % 3 == 2
    (0..2).each do |set|
      vals_s = sets[set].sort { |a, b| a.to_i <=> b.to_i }
      count += 1 if vals_s[0].to_i + vals_s[1].to_i > vals_s[2].to_i
    end
  end
  lineno += 1
end

print "Count: #{count}\n"
